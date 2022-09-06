CREATE USER airbnb2 IDENTIFIED BY passairbnb2;

GRANT CREATE SESSION, CREATE SYNONYM TO airbnb2;

GRANT SELECT ON airbnb.review TO airbnb2;
GRANT SELECT ON airbnb.usuario TO airbnb2;
GRANT SELECT ON airbnb.place TO airbnb2;
GRANT SELECT ON airbnb.amenity TO airbnb2;
GRANT SELECT ON airbnb.place_amenity TO airbnb2;
GRANT SELECT ON airbnb.state TO airbnb2;
GRANT SELECT ON airbnb.city TO airbnb2;