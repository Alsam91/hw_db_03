CREATE TABLE IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,
	genre_name varchar(60) NOT NULL);

CREATE TABLE IF NOT EXISTS artist (
	id SERIAL PRIMARY KEY,
	artist_name varchar(60) NOT NULL);

CREATE TABLE IF NOT EXISTS genre_artist (
	genre_id integer REFERENCES Genre(id),
	artist_id integer REFERENCES Artist(id),
	CONSTRAINT pk PRIMARY KEY(genre_id, artist_id));

CREATE TABLE IF NOT EXISTS album (
	id serial PRIMARY KEY,
	album_name varchar(60), 
	release_year date);

CREATE TABLE IF NOT EXISTS artist_album (
	artist_id integer REFERENCES artist(id),
	album_id integer REFERENCES album(id),
	CONSTRAINT pk1 PRIMARY KEY(artist_id, album_id));

CREATE TABLE IF NOT EXISTS track (
	id serial PRIMARY KEY,
	track_name varchar(60) NOT NULL,
	duration INTERVAL MINUTE, 
	album_id integer REFERENCES Album(id));

CREATE TABLE IF NOT EXISTS Collection (
	id serial PRIMARY KEY,
	collection_name varchar(60) NOT NULL,
	release_year date);

CREATE TABLE IF NOT EXISTS track_collection (
	track_id integer REFERENCES track(id),
	collection_id integer REFERENCES collection(id),
	CONSTRAINT pk2 PRIMARY KEY(track_id, collection_id));
