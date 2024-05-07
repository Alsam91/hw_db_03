--Задание 2

--Название и продолжительность самого длительного трека
SELECT duration, track_name FROM track
ORDER BY duration DESC
LIMIT 1;

--Название треков, продолжительность которых не менее 5 минут (изменил время так как не подходит к подобранным трекам)
SELECT track_name FROM track
WHERE duration > '05:00';

--Названия сборников, вышедших в период с 2001 по 2005 год включительно (изменил интервал выхода сборников так как не подходят к подобранным сборникам)
SELECT collection_name FROM collection
WHERE EXTRACT(YEAR FROM release_year) BETWEEN 2001 AND 2005;

--Исполнители, чьё имя состоит из одного слова
SELECT artist_name FROM artist
WHERE artist_name NOT LIKE '% %';

--Название треков, которые содержат слово «мой» или «my» (реализовал так, чтобы работало без учёта регистра)
SELECT track_name FROM track
WHERE lower(track_name) LIKE '%мой%' OR lower(track_name) LIKE '%my%';


--Задание 3

--Количество исполнителей в каждом жанре
SELECT genre_name, count(artist_name)  FROM genre g
JOIN genre_artist ga ON ga.genre_id = g.id
JOIN artist a ON ga.artist_id = a.id
GROUP BY genre_name;

--Количество треков, вошедших в альбомы 2001–2005 годов (изменил интервал выхода треков так как не подходят к подобранным трекам)
SELECT album_name, count(track_name) FROM album a
JOIN track t ON a.id = t.id
WHERE EXTRACT(YEAR FROM release_year) BETWEEN 2001 AND 2005
GROUP BY album_name;

--Средняя продолжительность треков по каждому альбому
 SELECT album_name, avg(duration) FROM album a
 JOIN track t ON a.id = t.id 
 GROUP BY album_name;

--Все исполнители, которые не выпустили альбомы в 2014 году (изменил год так как не подходит к подобранным альбомам)
 SELECT artist_name FROM artist a
 JOIN album a2 ON a.id = a2.id
 WHERE EXTRACT(YEAR FROM release_year) != 2014
 GROUP BY artist_name;

--Названия сборников, в которых присутствует конкретный исполнитель (Eminem)
SELECT c.collection_name FROM collection c
JOIN track_collection tc on c.id = tc.collection_id
JOIN track t ON tc.track_id = t.id
JOIN album a ON t.album_id  = a.id
JOIN artist_album aa ON a.id = aa.album_id
JOIN artist a1 ON aa.artist_id = a1.id
WHERE a1.artist_name = 'Eminem';


--Задание 4

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT album_name, count(genre_name) FROM album a
JOIN artist_album aa ON aa.album_id = a.id
JOIN artist a2 ON a2.id = a.id 
JOIN genre_artist ga ON ga.artist_id = a2.id 
JOIN genre g ON ga.genre_id = g.id
GROUP BY album_name
HAVING count(genre_name) > 1;

--Наименования треков, которые не входят в сборники
SELECT track_name FROM track t
FULL OUTER JOIN track_collection tc ON t.id = tc.track_id
LEFT OUTER JOIN collection c ON c.id = tc.collection_id 
WHERE c.id IS NULL;

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько
SELECT artist_name FROM artist a 
JOIN artist_album aa ON aa.artist_id = a.id
JOIN album a2 ON a2.id = aa.album_id 
JOIN track t ON a2.id = t.album_id 
WHERE t.duration = (SELECT min(t.duration) FROM track t);

--Названия альбомов, содержащих наименьшее количество треков
SELECT album_name, count(track_name) FROM album a 
JOIN track t ON t.album_id = a.id
GROUP BY album_name 
HAVING count(t.track_name) = (SELECT min(count) FROM (SELECT a.album_name, count(t.track_name) FROM album a
											JOIN track t ON a.id = t.album_id
											GROUP BY a.album_name));



