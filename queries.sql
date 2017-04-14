/*Query all of the entries in the Genre table*/
select * from Genre;

/*Using the INSERT statement, add one of your favorite artists to the Artist table.*/
select * from Artist;
insert into Artist values (null, 'The Books', 1999);
insert into Artist values (null, 'me', 2017);

/*Using the INSERT statement, add one, or more, albums by your artist to the Album table.*/
select * from Album;
--( `AlbumId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, `Title` TEXT NOT NULL, `ReleaseDate` TEXT NOT NULL, `AlbumLength` INTEGER NOT NULL, `Label` TEXT NOT NULL, `ArtistId` INTEGER NOT NULL, `GenreId` INTEGER, FOREIGN KEY(`ArtistId`) REFERENCES `Artist`(`ArtistId`), FOREIGN KEY(`GenreId`) REFERENCES `Genre`(`GenreId`) )
insert into Album values (null, 'The Lemon of Pink',  '04/05/2005',  2262, 'Tomlab',  28,  14);

/*Using the INSERT statement, add some songs that are on that album to the Song table.*/
--( `SongId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, `Title` TEXT NOT NULL, `SongLength` INTEGER NOT NULL, `ReleaseDate` TEXT NOT NULL, `GenreId` INTEGER, `ArtistId` INTEGER NOT NULL, `AlbumId` INTEGER NOT NULL, FOREIGN KEY(`GenreId`) REFERENCES `Genre`(`GenreId`), FOREIGN KEY(`ArtistId`) REFERENCES `Artist`(`ArtistId`), FOREIGN KEY(`AlbumId`) REFERENCES `Album`(`AlbumId`) )
insert into Song values (null, 'Tokyo', 223, '04/05/2005', 14, 28, 23);
select * from Song;

/*Write a SELECT query that provides the song titles, album title, and artist name 
or all of the data you just entered in. 
Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.*/
SELECT  Artist.ArtistName, Album.Title albumtitle, Song.Title
FROM  Artist, Album 
LEFT JOIN Song
WHERE Artist.ArtistName = 'The Books'
AND Artist.ArtistId = Album.ArtistId
AND Album.AlbumId = Song.AlbumId; 


/*Write a SELECT statement to display how many songs exist for each album. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/
SELECT Count(Song.AlbumId) '# Songs', Album.Title 'Album Title', Artist.ArtistName
FROM Song, Album, Artist
WHERE Song.AlbumId = Album.AlbumId
AND Song.ArtistId = Artist.ArtistId
GROUP BY Album.Title;


/*Write a SELECT statement to display how many songs exist for each artist. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/
SELECT Count(Song.ArtistId) '# Songs', Artist.ArtistName 'Artist Name'
FROM Song, Artist
WHERE Song.ArtistId = Artist.ArtistId
GROUP BY Artist.ArtistName;

/*Write a SELECT statement to display how many songs exist for each genre. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/
SELECT Count(Song.GenreId) '# Songs', Genre.Label 'Genre', Genre.GenreId 'GenreId'
FROM Song, Genre
WHERE Song.GenreId = Genre.GenreId
GROUP BY Genre.GenreId;


/*Using MAX() function, write a select statement to find the album with the longest duration. 
The result should display the album title and the duration.*/
SELECT Album.Title, MAX(Album.AlbumLength) 'Album Length'
FROM Album;

/*Using MAX() function, write a select statement to find the song with the longest duration. 
The result should display the song title and the duration.*/
SELECT MAX(Song.SongLength) 'Song Length', Song.Title 'Song Title', Artist.ArtistName 'Artist', Album.Title 'Album'
FROM Album, Song, Artist
WHERE Song.ArtistId = Artist.ArtistId
AND Song.ArtistId = Album.ArtistId;


/*Modify the previous query to also display the title of the album.*/