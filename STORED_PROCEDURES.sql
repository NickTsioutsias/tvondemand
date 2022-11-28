DELIMITER //

CREATE PROCEDURE best(IN type VARCHAR(1) ,IN n INT,IN date1 DATE,IN date2 DATE)

sp: BEGIN

	IF type LIKE 'm' THEN

		SELECT film.film_id, film.title, count(rental.inventory_id)
			FROM film

			INNER JOIN inventory
			ON film.film_id = inventory.film_id

			INNER JOIN rental
			ON inventory.inventory_id = rental.inventory_id

			WHERE rental_date BETWEEN "2009-01-01" AND "2010-01-02"

			ORDER BY count(rental.inventory_id) DESC LIMIT 0,4;

	ELSEIF type LIKE 's' THEN

		SELECT series.series_id, series.title,count(rental.inventory_id) 
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


DELIMITER //

CREATE PROCEDURE show1(IN eml VARCHAR(50), IN date1 DATE)

sp2: BEGIN
	SELECT COUNT(rental.inventory_id) AS "Rentals", xrhsths.first_name AS "FIRST NAME", xrhsths.last_name AS "LASTNAME"
		FROM rental
		
		INNER JOIN customer 
		ON customer.customer_id = rental.customer_id

		INNER JOIN xrhsths
		ON customer.customer_id = xrhsths.user_id

		WHERE xrhsths.email = eml AND rental_date = date1;
END //
DELIMITER ;


DELIMITER //

CREATE PROCEDURE  show_money()

sp3: BEGIN
	SELECT date_format(payment.payment_date, '%M') AS "MONTH", SUM(payment.amount) AS "Movie Box Office"
	FROM payment
	INNER JOIN rental
	ON rental.rental_id = payment.rental_id
	INNER JOIN inventory
	ON inventory.inventory_id = rental.inventory_id
	WHERE rental.inventory_id IN (1,2,3,4)
	GROUP BY date_format(payment_date, '%M');

	SELECT date_format(payment.payment_date, '%M') AS "MONTH", SUM(payment.amount) AS "Series Box Office"
	FROM payment
	INNER JOIN rental
	ON rental.rental_id = payment.rental_id
	INNER JOIN inventory
	ON inventory.inventory_id = rental.inventory_id
	WHERE rental.inventory_id NOT IN (1,2,3,4)
	GROUP BY date_format(payment_date, '%M');


END //
DELIMITER ;	


DELIMITER //

CREATE PROCEDURE get_actors(IN lastname_1 VARCHAR(32), IN lastname_2 VARCHAR(32))
BEGIN

DECLARE total INT;

CREATE TEMPORARY TABLE temp_actors
SELECT first_name , last_name FROM actor WHERE last_name BETWEEN lastname_1 AND lastname_2
ORDER BY last_name ASC;

SELECT * FROM temp_actors;

SELECT COUNT(*) INTO total FROM temp_actors ;
SELECT 'count', total;
DROP TEMPORARY TABLE IF EXISTS temp_actors;
END//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE show_actor(IN surname VARCHAR(45))	
BEGIN
	SELECT DISTINCT actor.first_name, actor.last_name
FROM actor
WHERE actor.last_name = surname;
SELECT count(last_name) FROM actor WHERE last_name = surname HAVING count(last_name)>1;
	
END//
DELIMITER ;
