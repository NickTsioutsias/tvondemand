INSERT INTO actor VALUES 
(1,'PENELOPE','GUINESS'),
(2,'NICK','WAHLBERG'),
(3,'ED','CHASE'),
(4,'JENNIFER','DAVIS'),
(5,'BABIS','CHASE');

INSERT INTO `language` (language_id, name) VALUES 
(1, 'English'),
(2, 'Italian'),
(3, 'French'),
(4, 'German');

INSERT INTO `film` (`film_id`, `title`, `description`, `release_year`, `language_id`, `original_language_id`, `length`, `rating`, `special_features`) VALUES
(1, 'LUCK OPUS', 'A Boring Display of a Moose And a Squirrel who must Outrace a Teacher in A Shark Tank', 2006, 1, NULL, 152, 'NC-17', 'Trailers,Commentaries,Behind the Scenes'),
(2, 'POSEIDON FOREVER', 'A Thoughtful Epistle of a Womanizer And a Monkey who must Vanquish a Dentist in A Monastery', 2006, 4, NULL, 159, 'PG-13', 'Commentaries'),
(3, 'SAINTS BRIDE', 'A Fateful Tale of a Technical Writer And a Composer who must Pursue a Explorer in The Gulf of Mexico', 2006, 2, NULL, 125, 'G', 'Deleted Scenes'),
(4, 'SPEED SUIT', 'A Brilliant Display of a Frisbee And a Mad Scientist who must Succumb a Robot in Ancient China', 2006, 1, NULL, 124, 'PG-13', 'Commentaries,Behind the Scenes');


INSERT INTO series VALUES
(1,'MONSTER','sth about a monster',1,1,'R','Trailers'),
(2,'HUNTER','sth about a hunter',1,1,'R','Trailers'),
(3,'FISHING','men fishing',1,1,'R','Trailers'),
(4,'ALIEN','sth about aliens',1,1,'R','Trailers');

INSERT INTO seasons VALUES
(1,1,8,'2000-01-01'),
(2,1,8,'2000-01-01'),
(3,1,8,'2001-01-01'),
(4,1,8,'2000-01-01');

INSERT INTO inventory (inventory_id,film_id) VALUES
(1,1),
(2,2),
(3,3),
(4,4);

INSERT INTO inventory (inventory_id,series_id) VALUES
(5,1),
(6,2),
(7,3),
(8,4);

INSERT INTO xrhsths VALUES
(1,'Nick','Tsioutsias','NiTs@sth.com',1,'1980-01-01 00:00:00'),
(2,'George','Christopoulos','GeCh@sth.com',1,'1980-01-01 00:00:00'),
(3,'Lilian','Tsioutsia','LiTs@sth.com',0,'1980-01-01 00:00:00'),
(4,'Giannis','Kyriakopoulos','GiKy@sth.com',1,'1980-01-01 00:00:00'),
(5,'Liam','Popper','LiPo@sth.com',0,'1980-01-01 00:00:00');

INSERT INTO `address` (`address_id`, `address`, `district`, `city_id`, `postal_code`, `phone`) VALUES
(1, '1346 Mysore Drive', 'Bretagne', 1, '61507', '516647474029'),
(2, '1740 Le Mans Loop',  'Pays de la Loire', 2, '22853', '168476538960'),
(3, '1386 Yangor Avenue', 'Provence-Alpes-Cte', 3, '80720', '449216226468'),
(4, '391 Callao Drive', 'Midi-Pyrnes', 4, '34021', '440512153169'),
(5, '442 Rae Bareli Place', 'Nordrhein-Westfalen', 5, '24321', '886636413768');

INSERT INTO `city` (`city_id`, `city`, `country_id`) VALUES
(1, 'Brest', 1),
(2, 'Le Mans', 1),
(3, 'Toulon', 1),
(4, 'Toulouse', 1),
(5, 'Duisburg', 2);

INSERT INTO `country` (`country_id`, `country`) VALUES
(1, 'Greece'),
(2, 'Germany');

INSERT INTO customer VALUES
(1,1),
(2,2),
(3,3);

INSERT INTO employee VALUES
(4);

INSERT INTO administrator VALUES
(5);

INSERT INTO customer_subscription VALUES
(),
(),
();

INSERT INTO rental VALUES
(1,'2010-01-01 00:00:00',1,1),
(2,'2011-01-01 00:00:00',1,1),
(3,'2010-01-01 00:00:00',2,1),
(4,'2010-01-01 00:00:00',5,2),
(5,'2011-01-01 00:00:00',5,2),
(6,'2010-01-01 00:00:00',6,2),
(7,'2010-01-01 00:00:00',3,3),
(8,'2010-01-01 00:00:00',7,3);

INSERT INTO payment VALUES
(1,1,1,0.4,'2010-01-01 00:00:00'),
(2,1,2,0.4,'2011-01-01 00:00:00'),
(3,1,3,0.4,'2010-01-01 00:00:00'),
(4,2,4,0.2,'2010-01-01 00:00:00'),
(5,2,5,0.2,'2011-01-01 00:00:00'),
(6,2,6,0.2,'2010-01-01 00:00:00'),
(7,3,7,0.1,'2010-01-01 00:00:00'),
(8,3,8,0.1,'2010-01-01 00:00:00');

