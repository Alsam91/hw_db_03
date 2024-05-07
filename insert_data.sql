--Задание №1

INSERT INTO genre (genre_name)
VALUES 
	('Rock'),
	('POP'),
	('RAP'),
	('RnB');

INSERT INTO artist (artist_name)
VALUES 
	('Starset'),
	('Britney Spears'),
	('Eminem'),
	('Beyonce');

INSERT INTO album (album_name, release_year)
VALUES 
	('Transmissions ','2014-06-08'),
	('In_the_Zone','2003-11-12'),
	('The_Eminem_Show','2002-05-26'),
	('Telephone','2010-01-26');

INSERT INTO track (track_name, duration, album_id)
VALUES 
	('My_Demons', '4:48', 1),
	('Antigravity', '6:10', 1),
	('Toxic', '3:32', 2),
	('Everytime', '4:09', 2),
	('Without_Me', '4:50', 3),
	('Sing_For_The_Moment', '5:40', 3),
	('Alphabeat', '4:51', 4),
	('Crookers', '4:54', 4);
	
INSERT INTO collection (collection_name, release_year)
VALUES 
	('coll1', '2014-06-08'),
	('coll2', '2003-11-12'),
	('coll3', '2002-05-26'),
	('coll4', '2010-01-26');
	
INSERT INTO genre_artist (genre_id, artist_id)
VALUES 
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4);

INSERT INTO artist_album (artist_id, album_id)
VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4);

INSERT INTO track_collection (track_id, collection_id)
VALUES
	(1, 1),
	(2, 1),
	(3, 2),
	(4, 2),
	(5, 3),
	(6, 3),
	(7, 4),
	(8, 4);

INSERT INTO artist (artist_name)
VALUES
	('artist_more_then_one_genre');

INSERT INTO genre_artist (genre_id,artist_id)
VALUES
	(1, 5);

INSERT INTO artist_album (artist_id,album_id)
VALUES
	(5, 1);

INSERT INTO track (track_name)
VALUES
	('track_without_collection')
	

