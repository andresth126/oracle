/* View 1 */ 
CREATE OR REPLACE VIEW view_review_user_place
AS  SELECT r.id, r.update_at, r.created_at, r.user_id, r.place_id, r.text
    FROM review r
    INNER JOIN usuario ON r.user_id=usuario.id
    INNER JOIN place ON r.place_id=place.id;
    
/* View 2 */
CREATE OR REPLACE VIEW view_place_city_state
AS  SELECT p.id, p.update_at, p.created_at, p.user_id, p.name, p.city_id, p.description
    FROM place p
    INNER JOIN city ON p.city_id=city.id
    INNER JOIN state ON city.id=state.id;

/* View 3 */
CREATE OR REPLACE VIEW view_place_amenity (place_name, amenity_name)
AS  SELECT place.name, amenity.name
    FROM place_amenity pa
    INNER JOIN place ON pa.place_id=place.id
    INNER JOIN amenity ON pa.amenity_id=amenity.id;
