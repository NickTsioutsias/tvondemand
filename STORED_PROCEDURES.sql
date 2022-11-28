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


DELIMITER //

CREATE PROCEDURE show1(IN eml VARCHAR(50), IN date1 DATE)

sp2: BEGIN
	SELECT rental.COUNT(inventory_id)
		FROM inventory
		
		INNER JOIN rental 
		ON inventory.inventory_id=rental.inventory_id

		INNER JOIN customer
		ON rental.customer_id=customer.customer_id

		WHERE customer.email = eml AND rental_date = date1;
END //
DELIMITER ;


DELIMITER //

CREATE PROCEDURE  show_money()

sp3: BEGIN
	SELECT payment.date_format(payment_date, '%M'), payment.SUM(amount)
	FROM payment
	INNER JOIN rental
	ON rental.rental_id = payment.rental_id
	INNER JOIN inventory
	ON inventory.inventory_id = rental.inventory_id
	WHERE inventory_id IN (1,2,3,4)
	GROUP BY date_format(payment_date, '%M');

	SELECT payment.date_format(payment_date, '%M'), payment.SUM(amount)
	FROM payment
	INNER JOIN rental
	ON rental.rental_id = payment.rental_id
	INNER JOIN inventory
	ON inventory.inventory_id = rental.inventory_id
	WHERE inventory_id NOT IN (1,2,3,4)
	GROUP BY date_format(payment_date, '%M');


END //
DELIMITER ;	


DELIMITER //

CREATE PROCEDURE show_name_actor(IN suname1 VARCHAR(30),IN surname2 VARCHAR(30))
BEGIN

	SELECT actor.last_name, actor.first_name, COUNT(last_name)
    FROM actor
	WHERE last_name BETWEEN 'surname1' AND 'surname2'
	ORDER BY last_name;

END//
DELIMITER ;


DELIMITER //

CREATE PROCEDURE show_actor(IN surname VARCHAR(45))	
BEGIN
	SELECT DISTINCT actor.first_name, actor.last_name
FROM actor
WHERE actor.last_name LIKE 'surname';
SELECT count(last_name) FROM actor WHERE last_name LIKE 'surname' HAVING count(last_name)>1;
	
END//
DELIMITER ;
