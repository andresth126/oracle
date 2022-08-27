/* CREACIÓN BASE DE DATOS - ANDRÉS TORRES */
CREATE TABLE place (
    id                  VARCHAR2(20),
    update_at           DATE DEFAULT SYSDATE,
    created_at          DATE DEFAULT SYSDATE,
    user_id             VARCHAR2(20),
    name                VARCHAR2(30),
    city_id             VARCHAR2(30),
    description         VARCHAR2(50),
    number_rooms        NUMBER(10),
    number_bathrooms    NUMBER(10),
    max_guest           NUMBER(10),
    price_by_night      NUMBER(10),
    latitude            NUMBER(12,2),
    longitude           NUMBER(12,2)
);

CREATE TABLE review (
    id                  VARCHAR2(20),
    update_at           DATE DEFAULT SYSDATE,
    created_at          DATE DEFAULT SYSDATE,
    user_id             VARCHAR2(20),
    place_id            VARCHAR2(20),
    text                VARCHAR2(50)
);

CREATE TABLE usuario (
    id                  VARCHAR2(20),
    update_at           DATE DEFAULT SYSDATE,
    created_at          DATE DEFAULT SYSDATE,
    email               VARCHAR2(20),
    password            VARCHAR2(20),
    first_name          VARCHAR2(20),
    last_name           VARCHAR2(20)
);

CREATE TABLE amenity (
    id                  VARCHAR2(20),
    update_at           DATE DEFAULT SYSDATE,
    created_at          DATE DEFAULT SYSDATE,
    name                VARCHAR2(20)
);

CREATE TABLE place_amenity (
    amenity_id          VARCHAR2(20),
    place_id            VARCHAR2(20)
);

CREATE TABLE state (
    id                  VARCHAR2(20),
    update_at           DATE DEFAULT SYSDATE,
    created_at          DATE DEFAULT SYSDATE,
    name                VARCHAR2(20)
);

CREATE TABLE city (
    id                  VARCHAR2(20),
    update_at           DATE DEFAULT SYSDATE,
    created_at          DATE DEFAULT SYSDATE,
    state_id            VARCHAR2(20),
    name                VARCHAR2(20)
);

/* PRIMARY KEY'S */
ALTER TABLE place ADD CONSTRAINT place_id_pk PRIMARY KEY(id);
ALTER TABLE review ADD CONSTRAINT review_id_pk PRIMARY KEY(id);
ALTER TABLE usuario ADD CONSTRAINT user_id_pk PRIMARY KEY(id);
ALTER TABLE amenity ADD CONSTRAINT amenity_id_pk PRIMARY KEY(id);
ALTER TABLE state ADD CONSTRAINT state_id_pk PRIMARY KEY(id);
ALTER TABLE city ADD CONSTRAINT city_id_pk PRIMARY KEY(id);

/* FOREIGN KEY'S */
ALTER TABLE place ADD CONSTRAINT place_usuario_id_fk FOREIGN KEY(user_id) REFERENCES usuario(id);
ALTER TABLE place ADD CONSTRAINT place_city_id_fk FOREIGN KEY(city_id) REFERENCES city(id);
ALTER TABLE review ADD CONSTRAINT review_user_id_fk FOREIGN KEY(user_id) REFERENCES usuario(id);
ALTER TABLE review ADD CONSTRAINT review_place_id_fk FOREIGN KEY(place_id) REFERENCES place(id);
ALTER TABLE place_amenity ADD CONSTRAINT place_amenity_amenity_id_fk FOREIGN KEY(amenity_id) REFERENCES amenity(id);
ALTER TABLE place_amenity ADD CONSTRAINT place_amenity_place_id_fk FOREIGN KEY(place_id) REFERENCES place(id);
ALTER TABLE city ADD CONSTRAINT city_state_id_fk FOREIGN KEY(state_id) REFERENCES state(id);