CREATE TABLE actor (
  actor_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  PRIMARY KEY  (actor_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE category (
  category_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(25) NOT NULL,
  PRIMARY KEY  (category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE language (
  language_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  name CHAR(20) NOT NULL,
  PRIMARY KEY (language_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE film (
  film_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(128) NOT NULL,
  description TEXT DEFAULT NULL,
  release_year YEAR DEFAULT NULL,
  language_id TINYINT UNSIGNED NOT NULL,
  original_language_id TINYINT UNSIGNED DEFAULT NULL,
  length SMALLINT UNSIGNED DEFAULT NULL,
  rating ENUM('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  special_features SET('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
  PRIMARY KEY  (film_id),
  CONSTRAINT fk_film_language FOREIGN KEY (language_id) REFERENCES language (language_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_film_language_original FOREIGN KEY (original_language_id) REFERENCES language (language_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE film_actor (
  actor_id SMALLINT UNSIGNED NOT NULL,
  film_id SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY  (actor_id,film_id),
  CONSTRAINT fk_film_actor_actor FOREIGN KEY (actor_id) REFERENCES actor (actor_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_film_actor_film FOREIGN KEY (film_id) REFERENCES film (film_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE film_category (
  film_id SMALLINT UNSIGNED NOT NULL,
  category_id TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (film_id, category_id),
  CONSTRAINT fk_film_category_film FOREIGN KEY (film_id) REFERENCES film (film_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_film_category_category FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE series(
	series_id INT(5) NOT NULL AUTO_INCREMENT,
	title VARCHAR(70) DEFAULT 'TITLE' NOT NULL,
	description TEXT,
	language_id TINYINT UNSIGNED NOT NULL ,
	original_language_id TINYINT UNSIGNED DEFAULT NULL,
	rating ENUM('G','PG','PG-13','R','NC-17') DEFAULT 'G',
	special_features SET('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
	PRIMARY KEY (series_id),
    CONSTRAINT fk_series_language FOREIGN KEY (language_id) REFERENCES language (language_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_series_language_original FOREIGN KEY (original_language_id) REFERENCES language (language_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE seasons(
	series_id INT(5) NOT NULL,
	season_number INT(2) DEFAULT '1' NOT NULL,
	number_of_episodes INT(3) DEFAULT '0' NOT NULL, 
	release_year DATE NOT NULL,
	PRIMARY KEY(series_id,season_number),
	CONSTRAINT SERIESSEASONS FOREIGN KEY (series_id) REFERENCES series(series_id)
	ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE series_actor(
	actor_id SMALLINT UNSIGNED NOT NULL,
	series_id INT(5) NOT NULL,
	PRIMARY KEY (actor_id,series_id),
	CONSTRAINT ACTRSRSACTR FOREIGN KEY (actor_id) REFERENCES actor(actor_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT ACTRSRSSRS FOREIGN KEY (series_id) REFERENCES series(series_id)
	ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE series_category(
	category_id TINYINT UNSIGNED NOT NULL,
	series_id INT(5) NOT NULL,
	PRIMARY KEY(category_id,series_id),
	CONSTRAINT SRSCTGRCTGR FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT SRSCTGRSRS FOREIGN KEY(series_id) REFERENCES series(series_id)
	ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE country (
  country_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  country VARCHAR(50) NOT NULL,
  PRIMARY KEY  (country_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `city`
--

CREATE TABLE city (
  city_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  city VARCHAR(50) NOT NULL,
  country_id SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY  (city_id),
  CONSTRAINT `fk_city_country` FOREIGN KEY (country_id) REFERENCES country (country_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




--
-- Table structure for table `address`
--

CREATE TABLE address (
  address_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  address VARCHAR(50) NOT NULL,
  district VARCHAR(20) DEFAULT NULL,
  city_id SMALLINT UNSIGNED NOT NULL,
  postal_code VARCHAR(10) DEFAULT NULL,
  phone VARCHAR(20) NOT NULL,
  PRIMARY KEY  (address_id),
  CONSTRAINT `fk_address_city` FOREIGN KEY (city_id) REFERENCES city (city_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE customer (
  customer_id smallint(5) UNSIGNED NOT NULL,
  address_id smallint(5) UNSIGNED NOT NULL,
  subscription_type ENUM ('MOVIES','SERIES','BOTH'),
  PRIMARY KEY (customer_id),
  CONSTRAINT usrcsu FOREIGN KEY (customer_id) REFERENCES xrhsths (user_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_customer_address FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE CASCADE ON UPDATE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE employee (
  employee_id smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (employee_id),
  CONSTRAINT usremp FOREIGN KEY (employee_id) REFERENCES xrhsths (user_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE administrator (
  admin_id smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (admin_id),
  CONSTRAINT usradm FOREIGN KEY (admin_id) REFERENCES xrhsths (user_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE xrhsths(
  user_id smallint(5) UNSIGNED NOT NULL,
  first_name varchar(45) NOT NULL,
  last_name varchar(45) NOT NULL,
  email varchar(50) DEFAULT NULL,
  active tinyint(1) NOT NULL DEFAULT 1,
  create_date datetime NOT NULL,
  PRIMARY KEY (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




CREATE TABLE inventory (
  inventory_id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  film_id SMALLINT UNSIGNED DEFAULT NULL,
  series_id INT(5) DEFAULT NULL,
  PRIMARY KEY  (inventory_id),
  CONSTRAINT fk_inventory_film FOREIGN KEY (film_id) REFERENCES film(film_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT  FOREIGN KEY (series_id) REFERENCES series(series_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE rental (
  rental_id INT NOT NULL AUTO_INCREMENT,
  rental_date DATETIME NOT NULL,
  inventory_id MEDIUMINT UNSIGNED NOT NULL,
  customer_id SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (rental_id),
  UNIQUE KEY  (rental_date,inventory_id,customer_id),
  CONSTRAINT fk_rental_inventory FOREIGN KEY (inventory_id) REFERENCES inventory (inventory_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_rental_customer FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE payment (
  payment_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  customer_id SMALLINT UNSIGNED NOT NULL,
  rental_id INT DEFAULT NULL,
  amount DECIMAL(5,2) NOT NULL,
  payment_date DATETIME NOT NULL,
  PRIMARY KEY  (payment_id),
  CONSTRAINT fk_payment_rental FOREIGN KEY (rental_id) REFERENCES rental (rental_id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk_payment_customer FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE RESTRICT ON UPDATE CASCADE
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE actor 
ADD INDEX idx_lastname (last_name)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE log(
	user_id  SMALLINT(5) UNSIGNED NOT NULL,
	date VARCHAR(20) NULL,
	success ENUM('Success','Fail') DEFAULT 'Fail',
	type ENUM('INSERT','UPDATE','DELETE') DEFAULT NULL,
	table_name VARCHAR(10) NULL,
	CONSTRAINT LGCSTMR FOREIGN KEY (user_id) REFERENCES xrhsths(user_id) ON DELETE CASCADE ON UPDATE CASCADE 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;