/* a) Proyecte el listado de todas las columnas de todos los empleados. */
SELECT * FROM employees;

/* b) Proyecte los empleados, como en el punto anterior, y ordene por nombre y apellido. */
SELECT * FROM employees ORDER BY first_name, last_name;

/* c) Seleccione los empleados para los cuales su nombre empieza por la letra K. */
SELECT * FROM employees WHERE first_name LIKE 'K%';

/* d) Seleccione los empleados cuyo nombre empieza por la letra K y ordene la proyección igual que el inmediato pasado punto con ordenamiento. */
SELECT * FROM employees WHERE first_name LIKE 'K%' ORDER BY first_name, last_name;

/* e) Proyecte los IDs de departamentos (departments), con la cantidad de empleados(employees), que hay en cada uno de ellos (los departamentos). */
SELECT department_id, count(department_id) FROM employees GROUP BY department_id; /* count(*) cuenta los nulos */ 
 
/* f) Averigüe cual es la máxima cantidad de empleados que departamento alguno tenga. */
SELECT max(count(department_id)) FROM employees GROUP BY department_id;
 
/* g) Proyecte el ID y nombre de los empleados con el nombre del departamento en el que trabaja. */
SELECT employee_id, first_name, department_name FROM employees NATURAL JOIN departments;

/* h) Proyecte el número, nombre y salario de los empleados que trabajan en el departamento SALES. */
SELECT employee_id, first_name, salary FROM employees 
NATURAL JOIN departments WHERE departments.department_name = 'Sales';

/* i) Igual al anterior pero ordenado de mayor a menor salario. */
SELECT employee_id, first_name, salary FROM employees
NATURAL JOIN departments WHERE departments.department_name = 'Sales'
ORDER BY salary DESC;

/* j) Obtenga el número y nombre de cada empleado junto con su salario y grado salarial (Si falta la tabla de grado salarial, crearla y poblarla conforme se estudió el ejemplo de non-equijoin). */
    CREATE TABLE job_grades (Grade             VARCHAR2(10) ,
                             lowest_sal      NUMBER(20) ,
                             highest_sal     NUMBER(20));
    
ALTER TABLE job_grades add CONSTRAINT GRA_pk PRIMARY KEY(GRADE); 
INSERT INTO job_grades VALUES ('A',1000 , 2999);
INSERT INTO job_grades VALUES ('B',3000 , 5999);
INSERT INTO job_grades VALUES ('C',6000 , 9999);
INSERT INTO job_grades VALUES ('D',10000 , 14999);
INSERT INTO job_grades VALUES ('E',15000 , 24999);

SELECT e.last_name, e.salary, j.grade AS Grade_Level FROM employees e JOIN job_grades j
ON e.salary BETWEEN j.lowest_sal AND j.highest_sal;

/* k) Proyectar el ID, nombre y grado salarial de los empleados que tienen grados salariales 2, 4 o 5. */
SELECT e.last_name, e.salary, j.grade AS Grade_Level FROM employees e JOIN job_grades j
ON e.salary BETWEEN j.lowest_sal AND j.highest_sal
where j.grade IN('B', 'D', 'E');

/* l) Obtener el ID del departamento con el promedio salarial ordenado de mayor a menor. */
SELECT department_id, AVG(salary) temp_salary FROM employees
GROUP BY department_id ORDER BY temp_salary DESC;

/* m) Proyectar el nombre del departamento con el promedio salarial ordenado de 
mayor a menor. */
SELECT department_name, AVG(salary) temp_salary FROM employees
NATURAL JOIN departments GROUP BY department_name
ORDER BY temp_salary DESC;

/* n) Presentar el ID del departamento con la cantidad de empleados del departamento que cuente con el mayor número de empleados. */
SELECT department_id, s FROM (SELECT department_id, count(*) s
FROM employees GROUP BY department_id)
WHERE s = ( SELECT MAX(s) FROM ((SELECT department_id, count(*) s 
FROM employees GROUP BY department_id)) );
 
/* o) Encuentre los jefes (manager), presentando su ID y nombre, y el nombre del departamento donde trabajan. */
SELECT DISTINCT manager_id, department_name FROM employees
NATURAL JOIN departments;

/* q) Averiguar los IDs y nombres de los distintos departamentos en donde hay al menos un empleado que gana más de 3000 (Que no hayan tuplas repetidas). */
SELECT DISTINCT department_id, department_name FROM employees
NATURAL JOIN departments WHERE salary > 3000
GROUP BY department_id, department_name;

/* r) Identificar los IDs y nombres de los distintos departamentos en donde hay al menos dos empleados distintos que ganan más de 2500. */
SELECT DISTINCT department_id, department_name FROM employees
NATURAL JOIN departments WHERE salary > 2500
GROUP BY department_id, department_name HAVING count(salary) >= 2
ORDER BY department_id;

/* s) Encontrar los IDs y nombres de los empleados que ganan más dinero que su respectivo jefe. */
SELECT * FROM employees e JOIN employees m
ON (e.manager_id = m.employee_id)
WHERE e.salary > m.salary;

/* t) Establecer los IDs y nombres de los departamentos en donde al menos uno de los empleados gana más de 3000 informando la cantidad de estos empleados identificada para cada departamento. */
SELECT department_id, department_name, count(*)
FROM employees NATURAL JOIN departments
WHERE salary > 3000 GROUP BY department_id, department_name;

/* u) Determinar los IDs y nombres de los departamentos en donde todos los empleados ganan más de 3000. */
SELECT d.department_id, d.department_name
FROM employees e, departments d
WHERE   e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING count(d.department_id) = ( SELECT count(*)
                                  FROM employees sce
                                  WHERE sce.department_id = d.department_id
                                  AND sce.salary > 3000);

/* v) Determinar los IDs y nombres de los departamentos en donde todos los empleados ganan más de 3000 y existe al menos un jefe que gana más de 5000 */
SELECT d.department_id, d.department_name
FROM employees e, employees m, departments d
WHERE e.department_id = d.department_id
    AND e.manager_id = m.employee_id
GROUP BY d.department_id, d.department_name
HAVING count(d.department_id) = (
                                SELECT count(*)
                                FROM employees sce
                                WHERE sce.department_id = d.department_id
                                AND sce.salary > 3000);