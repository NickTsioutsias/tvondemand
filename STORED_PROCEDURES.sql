DELIMITER //

CREATE PROCEDURE best(IN type VARCHAR(1) ,IN n INT,IN date1 DATE,IN date2 DATE)

sp: BEGIN

	IF type LIKE 'm' THEN

		SELECT film.film_id, film.title,rental.count(inventory_id) 
			FROM film

			INNER JOIN inventory
			ON film.film_id = inventory.film_id

			INNER JOIN rental
			ON inventory.inventory_id = rental.inventory_id

			WHERE rental_date BETWEEN date1 AND date2

			ORDER BY count(inventory_id) DESC LIMIT 0,n;

	ELSEIF type LIKE 's' THEN

		SELECT series.series_id, series.title,rental.count(inventory_id) 
			FROM series

			INNER JOIN inventory
			ON series.series_id = inventory.series_id

			INNER JOIN rental
			ON inventory.inventory_id = rental.inventory_id

			WHERE rental_date BETWEEN date1 AND date2

			ORDER BY count(inventory_id) DESC LIMIT 0,n;

	ELSE
		LEAVE sp;

	END IF;

END//
DELIMITER ;