/* SYNONYM TABLES */

CREATE SYNONYM rev FOR airbnb.review;
CREATE SYNONYM usu FOR airbnb.usuario;
CREATE SYNONYM pla FOR airbnb.place;
CREATE SYNONYM ame FOR airbnb.amenity;
CREATE SYNONYM plame FOR airbnb.place_amenity;
CREATE SYNONYM sta FOR airbnb.state;
CREATE SYNONYM cit FOR airbnb.city;

/* SYNONYM VIEWS */

CREATE OR REPLACE SYNONYM view_review_user_pla FOR airbnb.view_review_user_place;
CREATE OR REPLACE SYNONYM view_place_city_sta FOR airbnb.view_place_city_state;
CREATE OR REPLACE SYNONYM view_place_ame FOR airbnb.view_place_amenity;