SELECT * FROM Genre;

INSERT INTO Artist
(ArtistName, YearEstablished)
VALUES
("Pee Men and Jenn", 1989);

SELECT * 
FROM Artist
WHERE 
ArtistName = "Jisie"
or ArtistName LIKE "P%";


SELECT a.Title, s.Title
FROM Album a
LEFT JOIN Song s ON s.AlbumId = a.AlbumId;

SELECT a.Title, s.Title
FROM Song s
LEFT JOIN Album a ON s.AlbumId = a.AlbumId;

SELECT a.Title, s.Title
FROM Song s
JOIN Album a ON s.AlbumId = a.AlbumId;

SELECT s.AlbumId, a.Title, COUNT(s.SongId)
FROM Song s
JOIN Album a ON s.AlbumId = a.AlbumId
GROUP BY s.AlbumId;

SELECT a.Title, MAX(a.AlbumLength)
FROM Album a;

--Using the INSERT statement, add one, or more, albums by your artist to the Album table.

INSERT INTO Album
VALUES
(null, "Evan is Weird", "06/14/20018", "9000", "Jack Bob Records", "30", "13");

--Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO Song
VALUES
(null, "Revenge", 61, "12/03/1982", 9, 30, 23);

/**Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in.
 Use the LEFT JOIN keyword sequence to connect the tables, 
 and the WHERE keyword to filter the results to the album and artist you added.**/
 
SELECT a.Title "album", s.Title "song", ar.ArtistName "artist"
FROM Album a
LEFT JOIN Song s ON s.AlbumId = a.AlbumId JOIN Artist ar ON ar.ArtistId = s.ArtistId
WHERE a.Title = "Evan is Weird";
 
 /**Using SELECT and LEFT JOIN, write a query that displays the song title, the song duration, the album label, 
 and the genre name for every song.**/
 
SELECT s.Title "Song Name", s.SongLength "Length", a.Label "Label", g.Label "Genre"
FROM Song s
LEFT JOIN Album a ON s.AlbumId = a.AlbumId JOIN Genre g ON s.GenreId = g.GenreId;
 
 
 /**Using a WHERE clause, modify the previous query to only show the information 
 for songs that have a duration of 250 or greater.**/
 
 SELECT s.Title "Song Name", s.SongLength "Length", a.Label "Label", g.Label "Genre"
FROM Song s
LEFT JOIN Album a ON s.AlbumId = a.AlbumId JOIN Genre g ON s.GenreId = g.GenreId
WHERE s.SongLength >= 250;
 
 /**Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() 
 function and the GROUP BY keyword sequence.**/
 
 SELECT a.ArtistName "Artist", COUNT(s.SongId) "Number of Songs"
 FROM Song s
JOIN Artist a ON a.ArtistId = s.ArtistId
GROUP BY a.ArtistId;
 
 /**Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() f
 unction and the GROUP BY keyword sequence.**/
 
 SELECT g.Label "Genre", COUNT(s.SongId) "Number of Songs"
 FROM Song s
 JOIN Genre g ON g.GenreId = s.GenreId
 GROUP BY g.GenreId;
 
 /**Write a SELECT statement to display how many artists exist for each genre. You'll need to use the COUNT() 
 function and the GROUP BY keyword sequence.**/
 
 SELECT g.Label "Genre", COUNT(s.ArtistId) "Number of Artists"
 FROM Song s
 JOIN Genre g ON s.GenreId = g.GenreId
 GROUP BY s.ArtistId;
 
 /**Using MAX() function, write a select statement to find the song with the longest duration. 
 The result should display the song title and the duration.**/
 
SELECT s.Title "Song", MAX(s.SongLength) "Song Length"
FROM Song s;

SELECT s.Title, MAX(s.SongLength)
From Song s;
 
 --Modify the previous query to also display the title of the album.
 
 SELECT s.Title "Song", a.Title "Album", MAX(s.SongLength) "Song Length"
 FROM Song s
 JOIN Album a ON s.AlbumId = a.AlbumId;
 