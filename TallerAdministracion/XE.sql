CREATE USER torres IDENTIFIED BY pass; /*Crear usuario*/

GRANT create session, create table, 
create sequence, create view TO torres; /*Privilegios a andres*/

ALTER USER HR IDENTIFIED by pass;

ALTER USER HR account unlock;

GRANT create SYNONYM to torres;

CREATE USER airbnb IDENTIFIED BY passairbnb;

GRANT create session, create table, 
create sequence, create view TO airbnb;

Alter user airbnb account unlock;

Alter user airbnb quota unlimited on Users; /* Espacio ilimitado a Airbnb */

GRANT create SYNONYM to airbnb;
/*CREATE ROLE manager; /*Crear rol manager

GRANT manager TO andres; /*Asignar Rol a andres

ALTER USER andres IDENTIFIED by pass; /*Modificar contraseña*/





