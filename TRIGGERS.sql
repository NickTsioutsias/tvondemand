DELIMITER //
CREATE TRIGGER tri_1 AFTER INSERT
ON rental
FOR EACH ROW
BEGIN 
	IF ROW_COUNT() > 0 THEN
		INSERT INTO log VALUES
		(NEW.customer_id,NOW(),'Success','INSERT','rental');
	ELSE INSERT INTO log VALUES
		(NULL,NOW(),'Fail','INSERT','rental');
	END IF;	
END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER tri_2 AFTER UPDATE
ON rental
FOR EACH ROW
BEGIN
	IF ROW_COUNT() > 0 THEN 
		INSERT INTO log VALUES 
		(NEW.customer_id,NOW(),'Success','UPDATE','rental');
	ELSE 
		INSERT INTO log VALUES
		(OLD.customer_id,NOW(),'Fail','UPDATE','rental');
	END IF;
END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER tri_3 AFTER DELETE
ON rental
FOR EACH ROW
BEGIN
	IF ROW_COUNT() > 0 THEN
		INSERT INTO log VALUES
		(OLD.customer_id,NOW(),'Success','DELETE','rental');
	ELSE
		INSERT INTO log VALUES
		(OLD.customer_id,NOW(),'Fail','DELETE','rental');
	END IF;
END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER tri_4 AFTER INSERT
ON payment
FOR EACH ROW
BEGIN
	IF ROW_COUNT() > 0 THEN
		INSERT INTO log VALUES
		(NEW.customer_id,NOW(),'Success','INSERT','payment');
	ELSE INSERT INTO log VALUES
		(NULL,NOW(),'Fail','INSERT','payment');
	END IF;	
END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER tri_5 AFTER UPDATE
ON payment
FOR EACH ROW
BEGIN
	IF ROW_COUNT() > 0 THEN 
		INSERT INTO log VALUES 
		(NEW.customer_id,NOW(),'Success','UPDATE','payment');
	ELSE 
		INSERT INTO log VALUES
		(OLD.customer_id,NOW(),'Fail','UPDATE','payment');
	END IF;
END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER tri_6 AFTER DELETE
ON payment
FOR EACH ROW
BEGIN
	IF ROW_COUNT() > 0 THEN
		INSERT INTO log VALUES
		(OLD.customer_id,NOW(),'Success','DELETE','payment');
	ELSE
		INSERT INTO log VALUES
		(OLD.customer_id,NOW(),'Fail','DELETE','payment');
	END IF;
END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER tri_7 BEFORE INSERT 
ON payment 
FOR EACH ROW
BEGIN
		
END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER tri_8 BEFORE UPDATE
ON USER
FOR EACH ROW
BEGIN
	IF email LIKE'%customer.org' THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE TEXT = 'You cannot change your personal data.';
	END IF;
END//
DELIMITER ;