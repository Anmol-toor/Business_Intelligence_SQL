/* =====BUSINESS INTELLIGENCE BDAT 1010======
          FINAL PROJECT PART - SQL
   ============= GROUP 9 ============
*/


---- create database Movies
create database Movies
use [Movies];

---- create Schema mov under Movies
create schema mov;


Use [movies];

---- Create table call Movie_director ane add the following constraints

CREATE TABLE mov.Movie_Director (
    Director_ID INT NOT NULL PRIMARY KEY IDENTITY(100, 10), -- Auto Increment starting at 100, incremented by 10
    Director_First_Name VARCHAR(50),
    Director_Last_Name VARCHAR(50),
    Director_Age_in_Years INT,
    Director_Gender VARCHAR(10),
    CreatedOn DATE NOT NULL DEFAULT GETDATE() -- Default to current server date
);


---Insert the following records based on the following specifications.
INSERT INTO mov.Movie_Director (Director_First_Name, Director_Last_Name, Director_Age_in_Years, Director_Gender) VALUES 
('Kevin', 'Smith', 52, 'Male'),
('Miguel', 'Arteta', 41, 'Male'),
('Mark', 'Johnson', 58, 'Male'),
('Tom', 'Vaughan', 37, 'Male'),
('Francis', 'Lawrence', 52, 'Male'),
('Adrienne', 'Shelly', 40, 'Female'),
('David', 'Slade', 53, 'Male'),
('Mark', 'Palansky', 53, 'Male'),
('Jeff', 'Lowell', 49, 'Male'),
('Simon', 'Curtis', 37, 'Male'),
('Marc', 'Lawrence', 95, 'Male'),
('Anand', 'Tucker', 59, 'Male'),
('Judd', 'Apatow', 55, 'Male'),
('Cary', 'Fukunaga', 45, 'Male'),
('Mark', 'Helfrich', 49, 'Male'),
('Nanette', 'Burstein', 52, 'Female'),
('James', 'McAvoy', 44, 'Male'),
('Mark', 'Waters', 58, 'Male'),
('Seth', 'Gordon', 46, 'Male'),
('Alex', 'Kendrick', 52, 'Male'),
('Kevin', 'Lima', 60, 'Male'),
('Lasse', 'Hallström', 76, 'Male'),
('Ewan', 'McGregor', 52, 'Male'),
('Rajkumar', 'Hirani', 60, 'Male'),
('Ashutosh', 'Gowariker', 59, 'Male'),
('Karan', 'Johar', 50, 'Male'),
('S.S', 'Rajamouli', 49, 'Male'),
('Sukumar', NULL, 53, 'Male'),
('Aditya', 'Chopra', 51, 'Male'),
('Umesh', 'Shukla', 52, 'Male');

select * from mov.Movie_Director

-- Create a Movies table under mov schema
Use [movies];

CREATE TABLE mov.Movies
(
    Movie_ID INT IDENTITY(1000, 1) PRIMARY KEY NOT NULL,  -- Auto Increment, Primary Key, Not null, starting from 1000 and incrementing by 1
    Movie_Name VARCHAR(255) NOT NULL,                     
    Movie_Released_Year INT NOT NULL,                    
    Movie_Lead_Studio VARCHAR(255) NOT NULL,             
    Movie_Language VARCHAR(255) NOT NULL,                 
    Movie_Category VARCHAR(255) NOT NULL,                
    Movie_Duration_in_Min INT NOT NULL,                  
    Movie_Worldwide_Earning_in_$M DECIMAL(15,2) NOT NULL, 
    Movie_Type VARCHAR(50) NOT NULL,                     
    Director_ID INT NOT NULL,                             
    CreatedOn DATE NOT NULL DEFAULT GETDATE(),            
    FOREIGN KEY (Director_ID) REFERENCES mov.Movie_Director(Director_ID), -- Foreign key from Movie_Director table
    CONSTRAINT CHK_Movie_Type CHECK (Movie_Type IN ('Hollywood', 'Bollywood')) -- Check constraint for Movie_Type
);

-- Insert the records into mov.Movies
INSERT INTO mov.Movies (Movie_Name, Movie_Released_Year, Movie_Lead_Studio, Movie_Language, Movie_Category, Movie_Duration_in_Min, Movie_Worldwide_Earning_in_$M, Movie_Type, Director_ID) VALUES 
('Zack and Miri Make a Porno', 2008, 'The Weinstein Company', 'English', 'Romance', 101, 41.94, 'Hollywood', 100),
('Youth in Revolt', 2010, 'The Weinstein Company', 'English', 'Comedy', 90, 19.62, 'Hollywood', 110),
('When in Rome', 2010, 'Disney', 'English', 'Comedy', 91, 43.04, 'Hollywood', 120),
('What Happens in Vegas', 2008, 'Fox', 'English', 'Comedy', 99, 219.37, 'Hollywood', 130),
('Water For Elephants', 2011, '20th Century Fox', 'English', 'Drama', 120, 117.09, 'Hollywood', 140),
('Waitress', 2007, 'Independent', 'English', 'Romance', 108, 22.18, 'Hollywood', 150),
('Twilight', 2008, 'Summit', 'English', 'Romance', 122, 376.66, 'Hollywood', 160),
('Penelope', 2008, 'Summit', 'English', 'Comedy', 144, 20.74, 'Hollywood', 170),
('Over Her Dead Body', 2008, 'New Line', 'English', 'Comedy', 95, 20.71, 'Hollywood', 180),
('My Week with Marilyn', 2011, 'The Weinstein Company', 'English', 'Drama', 99, 8.26, 'Hollywood', 190),
('Music and Lyrics', 2007, 'Warner Bros.', 'English', 'Romance', 104, 145.9, 'Hollywood', 200),
('Leap Year', 2010, 'Universal', 'English', 'Comedy', 100, 32.59, 'Hollywood', 210),
('Knocked Up', 2007, 'Universal', 'English', 'Comedy', 129, 219, 'Hollywood', 220),
('Jane Eyre', 2011, 'Universal', 'English', 'Romance', 120, 30.15, 'Hollywood', 230),
('Good Luck Chuck', 2007, 'Lionsgate', 'English', 'Comedy', 101, 59.19, 'Hollywood', 240),
('Going the Distance', 2010, 'Warner Bros.', 'English', 'Comedy', 103, 42.05, 'Hollywood', 250),
('Gnomeo and Juliet', 2011, 'Disney', 'English', 'Animation', 84, 193.97, 'Hollywood', 260),
('Ghosts of Girlfriends Past', 2009, 'Warner Bros.', 'English', 'Comedy', 100, 102.22, 'Hollywood', 270),
('Four Christmases', 2008, 'Warner Bros.', 'English', 'Comedy', 88, 161.83, 'Hollywood', 280),
('Fireproof', 2008, 'Independent', 'English', 'Drama', 122, 33.47, 'Hollywood', 290),
('Enchanted', 2007, 'Disney', 'English', 'Comedy', 107, 340.49, 'Hollywood', 300),
('Dear John', 2010, 'Sony', 'English', 'Drama', 108, 114.97, 'Hollywood', 310),
('Beginners', 2011, 'Independent', 'English', 'Comedy', 105, 14.31, 'Hollywood', 320),
('3 Idiots', 2009, 'Vinod Chopra Films', 'Hindi', 'Comedy', 171, 4000, 'Bollywood', 330),
('Lagaan', 2001, 'Aamir Khan Productions', 'Hindi', 'Romance', 224, 659, 'Bollywood', 340),
('My Name Is Khan', 2010, 'Dharma Productions', 'Hindi', 'Drama', 165, 48.77, 'Bollywood', 350),
('Baahubali', 2015, 'Arka Media Works', 'Telugu', 'Thriller', 159, 6500, 'Bollywood', 360),
('Dilwale Dulhania Le Jayenge', 1995, 'Yash Chopra', 'Hindi', 'Romance', 189, 2000, 'Bollywood', 380),
('Oh My God', 2012, '', 'Hindi', 'Comedy', 165, 1200, 'Bollywood', 390),
('Pushpa', 2021, 'Mythri Movie Makers', 'Telugu', 'Drama', 179, 3730, 'Bollywood', 370);


select * from mov.movies

---Create Movie_Actor Table under mov

USE Movies;

-- Create the Movie_Actor table
CREATE TABLE mov.Movie_Actor (
    Actor_ID INT IDENTITY(10, 1) PRIMARY KEY NOT NULL,        -- Auto Increment, Primary Key, Not null, starting from 10 and incrementing by 1
    Actor_First_Name VARCHAR(255) NOT NULL,                   
    Actor_Last_Name VARCHAR(255),                    
    Actor_Age_in_Years INT NOT NULL,                        
    Actor_Location VARCHAR(255) NOT NULL,                     
    Movie_ID INT NOT NULL,                                    
    CreatedOn DATE NOT NULL DEFAULT GETDATE(),                
    FOREIGN KEY (Movie_ID) REFERENCES mov.Movies(Movie_ID)    -- Foreign key from Movies table
);

-- Insert the records into mov.Movie_Actor
INSERT INTO mov.Movie_Actor (Actor_First_Name, Actor_Last_Name, Actor_Age_in_Years, Actor_Location, Movie_ID) VALUES 
('Seth', 'Rogen', 53, 'Los Angeles', 1000),
('Michael', 'Cera', 49, 'New York', 1001),
('Josh', 'Duhamel', 37, 'North Dakota', 1002),
('Jason', 'Sudeikis', 60, 'Kansas', 1003),
('Robert', 'Pattinson', 45, 'Los Angeles', 1004),
('Nathan', 'Fillion', 55, 'Canada', 1005),
('Robert', 'Pattinson', 45, 'Los Angeles', 1006),
('James', 'McAvoy', 49, 'Scotland', 1007),
('Paul', 'Rudd', 52, 'New York', 1008),
('Kenneth', 'Branagh', 44, 'Northern Ireland', 1009),
('Hugh', 'Grant', 58, 'London', 1010),
('Matthew', 'Goode', 46, 'England', 1011),
('Judd', 'Apatow', 58, 'Los Angeles', 1012),
('Michael', 'Fassbender', 46, 'Germany', 1013),
('Dane', 'Cook', 52, 'United States', 1014),
('Jason', 'Sudeikis', 60, 'Kansas', 1015),
('Kelly', 'Asbury', 76, 'United States', 1016),
('Matthew', 'McConaughey', 52, 'Los Angeles', 1017),
('Vince', 'Vaughn', 60, 'Minnesota', 1018),
('Kirk', 'Cameron', 59, 'United States', 1019),
('James', 'Marsden', 50, 'Columbia', 1020),
('Channing', 'Tatum', 58, 'Alabama', 1021),
('Mike', 'Mills', 37, 'New York', 1022),
('Aamir', 'Khan', 52, 'India', 1023),
('Aamir', 'Khan', 52, 'India', 1024),
('Shah Rukh', 'Khan', 53, 'India', 1025),
('Prabhas', NULL, 53, 'India', 1026),
('Allu', 'Arjun', 49, 'India', 1027),
('Shah Rukh', 'Khan', 53, 'India', 1028),
('Akshay', 'Kumar', 50, 'India', 1029);

Select* from mov.Movie_Actor

--- Create Movie rating Table

Use [movies];

CREATE TABLE mov.Movie_Rating (
    Movie_Rating_ID INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,  -- Auto Increment, Primary Key, Not null, starting from 1 and incrementing by 1
    Rating_Audience_Score VARCHAR(255) NOT NULL,              
    Rating_Rotten_Tomatoes VARCHAR(255) NOT NULL,             
    Movie_ID INT NOT NULL,                                    
    CreatedOn DATE NOT NULL DEFAULT GETDATE(),               
    FOREIGN KEY (Movie_ID) REFERENCES mov.Movies(Movie_ID)    -- Foreign key from Movies table
);

-- Insert the records into mov.Movie_Rating
INSERT INTO mov.Movie_Rating (Rating_Audience_Score, Rating_Rotten_Tomatoes, Movie_ID) VALUES 
('70', '64', 1000),
('52', '68', 1001),
('44', '15', 1002),
('72', '28', 1003),
('72', '60', 1004),
('67', '89', 1005),
('82', '49', 1006),
('74', '52', 1007),
('47', '15', 1008),
('84', '83', 1009),
('70', '63', 1010),
('49', '21', 1011),
('83', '91', 1012),
('77', '85', 1013),
('61', '3', 1014),
('56', '53', 1015),
('52', '56', 1016),
('47', '27', 1017),
('52', '26', 1018),
('51', '40', 1019),
('80', '93', 1020),
('66', '29', 1021),
('80', '84', 1022),
('95', '100', 1023),
('81', '95', 1024),
('79', '83', 1025),
('80', '90', 1026),
('76', '82', 1027),
('85', '100', 1028),
('81', '74', 1029);

select * from mov.Movie_Rating

--7.	Write the following Query based on the above datasets.
--a.	List all the Movies information from the Movies table.
SELECT * FROM mov.Movies;

--b.	List all the Director information from the Director table.	
SELECT * FROM mov.Movie_Director;

--c.	List all the Actor information from the Actor table.
SELECT * FROM mov.Movie_Actor;

--d.	List all the Rating information from the Rating table.	
SELECT * FROM mov.Movie_Rating;

--e.	List all the movie released in year “2010”.
SELECT * FROM mov.Movies
WHERE Movie_Released_Year = 2010;

--f.	List all the movie released by “The Weinstein Company” studio.
SELECT * FROM mov.Movies
WHERE Movie_Lead_Studio = 'The Weinstein Company';

--g.	List all the movie released in “English”.
SELECT * FROM mov.Movies
WHERE Movie_Language = 'English';

--h.	List all the movie whose name starts with ‘G’.
SELECT * FROM mov.Movies
WHERE Movie_Name LIKE 'G%';

--i.	Display all the movie under “Comedy” category.
SELECT * FROM mov.Movies
WHERE Movie_Category = 'Comedy';

--j.	Display all the movie where movie type is “Hollywood”.
SELECT * FROM mov.Movies
WHERE Movie_Type = 'Hollywood';

--k.	Display all the “Female” directors.
SELECT * FROM mov.Movie_Director
WHERE Director_Gender = 'Female';

--l.	Display all the director whose Age is more than 45 years.
SELECT * FROM mov.Movie_Director
WHERE Director_Age_in_Years > 45;

--m.	Display all the Actors from “Los Angeles”.
SELECT * FROM mov.Movie_Actor
WHERE Actor_Location = 'Los Angeles';

--n.	Display all the Actor whose Age is less than 50 years.
SELECT * FROM mov.Movie_Actor
WHERE Actor_Age_in_Years < 50;

--o.	Display all the Actor whose name is starts from “J”.
SELECT * FROM mov.Movie_Actor
WHERE Actor_First_Name LIKE 'J%';

--p.	Display all the Actor who is from “Los Angeles” or “New York”.
SELECT * FROM mov.Movie_Actor
WHERE Actor_Location IN ('Los Angeles', 'New York');

--q.	List Director_FullName, Director_Age_in_Years, Director_Gender from Director
--[Director_FullName =Director_First_Name + " " + Director_Last_Name]
SELECT 
    Director_First_Name + ' ' + Director_Last_Name AS Director_FullName,
    Director_Age_in_Years,
    Director_Gender
FROM mov.Movie_Director;


--r.	List Director_FullName, Director_Age_in_Years, Director_Gender from Director whose Age is less than 45 years. [Director_FullName =Director_First_Name + " " + Director_Last_Name] 
SELECT 
    Director_First_Name + ' ' + Director_Last_Name AS Director_FullName,
    Director_Age_in_Years,
    Director_Gender
FROM mov.Movie_Director
WHERE Director_Age_in_Years < 45;

--8.	Write the following Query based on the above datasets.
--a.	Display all the Movies and their Actors information based on the relationship.
SELECT 
    m.Movie_Name,
    a.Actor_First_Name,
    a.Actor_Last_Name,
    a.Actor_Age_in_Years,
    a.Actor_Location
FROM 
    mov.Movies m
JOIN 
    mov.Movie_Actor a ON m.Movie_ID = a.Movie_ID;

--b.	Display the Movies name and their Ratings.
SELECT 
    m.Movie_Name,
    r.Rating_Audience_Score,
    r.Rating_Rotten_Tomatoes
FROM 
    mov.Movies m
JOIN 
    mov.Movie_Rating r ON m.Movie_ID = r.Movie_ID;

--c.	Display all the Movies, Actors, and Directors information based on the relationship.
SELECT 
    m.Movie_Name,
    a.Actor_First_Name,
    a.Actor_Last_Name,
    a.Actor_Age_in_Years,
    a.Actor_Location,
    d.Director_First_Name,
    d.Director_Last_Name,
    d.Director_Age_in_Years,
    d.Director_Gender
FROM 
    mov.Movies m
JOIN 
    mov.Movie_Actor a ON m.Movie_ID = a.Movie_ID
JOIN 
    mov.Movie_Director d ON m.Director_ID = d.Director_ID;

--d.	Display all the Movies, Actors, Directors, and Movie Rating information based on the relationship.
SELECT 
    m.Movie_Name,
    a.Actor_First_Name,
    a.Actor_Last_Name,
    a.Actor_Age_in_Years,
    a.Actor_Location,
    d.Director_First_Name,
    d.Director_Last_Name,
    d.Director_Age_in_Years,
    d.Director_Gender,
    r.Rating_Audience_Score,
    r.Rating_Rotten_Tomatoes
FROM 
    mov.Movies m
JOIN 
    mov.Movie_Actor a ON m.Movie_ID = a.Movie_ID
JOIN 
    mov.Movie_Director d ON m.Director_ID = d.Director_ID
JOIN 
    mov.Movie_Rating r ON m.Movie_ID = r.Movie_ID;

--e.	Display all the Movies, Actors, Directors, and Movie Rating information whose Rating_Audience_Score is more than 80% based on the relationship.
SELECT 
    m.Movie_Name,
    a.Actor_First_Name,
    a.Actor_Last_Name,
    a.Actor_Age_in_Years,
    a.Actor_Location,
    d.Director_First_Name,
    d.Director_Last_Name,
    d.Director_Age_in_Years,
    d.Director_Gender,
    r.Rating_Audience_Score,
    r.Rating_Rotten_Tomatoes
FROM 
    mov.Movies m
JOIN 
    mov.Movie_Actor a ON m.Movie_ID = a.Movie_ID
JOIN 
    mov.Movie_Director d ON m.Director_ID = d.Director_ID
JOIN 
    mov.Movie_Rating r ON m.Movie_ID = r.Movie_ID
WHERE 
    r.Rating_Audience_Score > 80;

--f.	Display all the Movies information whose Rating_Rotten_Tomatoes is more than 90%.
SELECT 
    m.Movie_Name,
	r.Rating_Rotten_Tomatoes,
    m.Movie_Released_Year,
    m.Movie_Lead_Studio,
    m.Movie_Language,
    m.Movie_Category,
    m.Movie_Duration_in_Min,
    m.Movie_Worldwide_Earning_in_$M,
    m.Movie_Type,
    m.Director_ID,
    m.CreatedOn
FROM 
    mov.Movies m
JOIN 
    mov.Movie_Rating r ON m.Movie_ID = r.Movie_ID
WHERE 
    r.Rating_Rotten_Tomatoes > 90;

--9.	Write the following Query based on the above datasets.
--a.	Create new table MovieCopy and copy all records of Movie table.
SELECT * INTO mov.MovieCopy FROM mov.Movies;

- b. Create a new table DirectorCopy and copy only the schema of director table.
SELECT TOP 0 * INTO mov.DirectorCopy FROM mov.Movie_Director;

-- c. Create new table ActorCopy and copy all records of Actor table.
SELECT * INTO mov.ActorCopy FROM mov.Movie_Actor;

-- d. Create new table RatingCopy and copy all records of Rating table.
SELECT * INTO mov.RatingCopy FROM mov.Movie_Rating;

-- e. Create new table RatingCopies and copy only the schema from Rating table.
SELECT TOP 0 * INTO mov.RatingCopies FROM mov.Movie_Rating;

-- 10a. Delete all the record from RatingCopy table.
DELETE FROM mov.RatingCopy;

-- b. Delete all the movies from MovieCopy table whose released in year “2010”.
DELETE FROM mov.MovieCopy
WHERE Movie_Released_Year = 2010;

-- c. Delete all the movies from MovieCopy table where language is ‘Hindi’.
DELETE FROM mov.MovieCopy
WHERE Movie_Language = 'Hindi';

--d.	Delete all the movie from MovieCopy where Rating_Audience_Score is less than 80%.
DELETE mc
FROM mov.MovieCopy mc
INNER JOIN mov.Movie_Rating rc ON mc.Movie_ID = rc.Movie_ID
WHERE CAST(rc.Rating_Audience_Score AS INT) < 80;


--e.	Delete all the movie from MovieCopy where Rating_Rotten_Tomatoes is less than 70%.
DELETE mc
FROM mov.MovieCopy mc
INNER JOIN mov.Movie_Rating rc ON mc.Movie_ID = rc.Movie_ID
WHERE CAST(rc.Rating_Rotten_Tomatoes AS INT) < 70;

--11.	Write the following Query based on the above datasets.
--a.	Update the Rating_Audience_Score by 85% for the movie, released by “The Weinstein Company” studio.

UPDATE rc
SET rc.Rating_Audience_Score = 85
FROM mov.Movie_Rating rc
INNER JOIN mov.MovieCopy mc ON rc.Movie_ID = mc.Movie_ID
WHERE mc.Movie_Lead_Studio = 'The Weinstein Company';


--b.	Update the Rating_Rotten_Tomatoes by 75% for the movie, released in Year 2010.

UPDATE rc
SET rc.Rating_Rotten_Tomatoes = 75
FROM mov.Movie_Rating rc
INNER JOIN mov.MovieCopy mc ON rc.Movie_ID = mc.Movie_ID
WHERE mc.Movie_Released_Year = 2010;

--c.	Increase the Actor Age by 2 years whose Name is “Michael Cera”.
-- Use the Movies database
USE Movies;

-- Increase Actor Age by 2 years for "Michael Cera"
UPDATE mov.Movie_Actor
SET Actor_Age_in_Years = Actor_Age_in_Years + 2
WHERE Actor_First_Name = 'Michael' AND Actor_Last_Name = 'Cera';

--d.	Increase the Director Age by 3 years who has directed the movie “Leap Year”.
-- Use the Movies database
USE Movies;

-- Update Director Age by 3 years for the director of "Leap Year"
UPDATE mov.Movie_Director
SET Director_Age_in_Years = Director_Age_in_Years + 3
WHERE Director_ID IN (SELECT Director_ID FROM mov.Movies WHERE Movie_Name = 'Leap Year');


-- e. Increase the Director and Actor Age by 1 year who has directed or acted in the movie “Leap Year”.
UPDATE mov.Movie_Director
SET Director_Age_in_Years = Director_Age_in_Years + 1
WHERE Director_ID IN (SELECT Director_ID FROM mov.Movies WHERE Movie_Name = 'Leap Year');

UPDATE mov.Movie_Actor
SET Actor_Age_in_Years = Actor_Age_in_Years + 1
WHERE Actor_ID IN (SELECT Actor_ID FROM mov.Movie_Actor WHERE Movie_ID IN (SELECT Movie_ID FROM mov.Movies WHERE Movie_Name = 'Leap Year'));

-- 12a. Create a view to display all the movie information.
CREATE VIEW MovieInformationView AS
SELECT *
FROM mov.MovieCopy;

-- b. Create a view to display all the movies and their rating information.
CREATE VIEW MovieRatingView AS
SELECT mc.Movie_Name, mc.Movie_Released_Year, mc.Movie_Lead_Studio, mc.Movie_Language, mc.Movie_Category,
       mc.Movie_Duration_in_Min, mc.Movie_Worldwide_Earning_in_$M, mc.Movie_Type,
       r.Rating_Audience_Score, r.Rating_Rotten_Tomatoes
FROM mov.MovieCopy mc
JOIN mov.RatingCopy r ON mc.Movie_ID = r.Movie_ID;

-- c. Create a view to display all the movies and their actor information.
CREATE VIEW MovieActorView AS
SELECT mc.Movie_Name, mc.Movie_Released_Year, mc.Movie_Lead_Studio, mc.Movie_Language, mc.Movie_Category,
       mc.Movie_Duration_in_Min, mc.Movie_Worldwide_Earning_in_$M, mc.Movie_Type,
       a.Actor_First_Name, a.Actor_Last_Name, a.Actor_Age_in_Years, a.Actor_Location
FROM mov.MovieCopy mc
JOIN mov.Movie_Actor ma ON mc.Movie_ID = ma.Movie_ID
JOIN mov.ActorCopy a ON ma.Actor_ID = a.Actor_ID;

--d.	Create a view to display all the movies, rating, actor along with director information.
USE Movies;

CREATE VIEW MoviesRatingsActorsDirectors AS
SELECT 
    m.Movie_ID,
    m.Movie_Name,
    m.Movie_Released_Year,
    m.Movie_Lead_Studio,
    m.Movie_Language,
    m.Movie_Category,
    m.Movie_Duration_in_Min,
    m.Movie_Worldwide_Earning_in_$M,
    m.Movie_Type,
    m.CreatedOn AS Movie_CreatedOn,
    r.Rating_Audience_Score,
    r.Rating_Rotten_Tomatoes,
    a.Actor_ID,
    a.Actor_First_Name,
    a.Actor_Last_Name,
    a.Actor_Age_in_Years,
    a.Actor_Location,
    a.CreatedOn AS Actor_CreatedOn,
    d.Director_ID,
    d.Director_First_Name,
    d.Director_Last_Name,
    d.Director_Age_in_Years,
    d.Director_Gender,
    d.CreatedOn AS Director_CreatedOn
FROM mov.Movies m
JOIN mov.Movie_Rating r ON m.Movie_ID = r.Movie_ID
JOIN mov.Movie_Actor a ON m.Movie_ID = a.Movie_ID
JOIN mov.Movie_Director d ON m.Director_ID = d.Director_ID;

--e.	Create a view to display all the information based on the result set returned by the query as shown below-
--List movie, Director_FullName, Director_Age_in_Years, Director_Gender from Director
--[Director_FullName =Director_First_Name + " " + Director_Last_Name]

CREATE VIEW MovieDirectorInfo AS
SELECT 
    m.Movie_Name,
    CONCAT(d.Director_First_Name, ' ', d.Director_Last_Name) AS Director_FullName,
    d.Director_Age_in_Years,
    d.Director_Gender
FROM mov.Movies m
JOIN mov.Movie_Director d ON m.Director_ID = d.Director_ID;


--13.	Write the following Query based on the above datasets.
--a.	Retrieve the list of all Databases.
SELECT name AS database_name
FROM sys.databases;

SELECT t.NAME AS TableName, s.Name AS SchemaName, p.rows AS RowCounts,
       SUM(a.total_pages) * 8 AS TotalSpaceKB 
FROM sys.tables t  
INNER JOIN sys.indexes i ON t.OBJECT_ID = i.object_id  
INNER JOIN sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id  
INNER JOIN sys.allocation_units a ON p.partition_id = a.container_id  
LEFT OUTER JOIN sys.schemas s ON t.schema_id = s.schema_id  
GROUP BY t.Name, s.Name, p.Rows  
ORDER BY TotalSpaceKB DESC;

--c.	List of tables with number of records.
EXEC sp_MSforeachdb 'USE [?];
SELECT
    DB_NAME() AS database_name,
    t.name AS table_name,
    p.rows AS number_of_records
FROM
    sys.tables t
    INNER JOIN sys.partitions p ON t.object_id = p.object_id
WHERE
    p.index_id IN (0, 1);';

--d.	List of Primary Key and Foreign Key for Whole Database.
SELECT 
    FK.name AS ForeignKey,
    OBJECT_NAME(FK.parent_object_id) AS TableName,
    COL_NAME(FK.parent_object_id, FKC.parent_column_id) AS ColumnName,
    OBJECT_NAME(FK.referenced_object_id) AS ReferencedTable,
    COL_NAME(FK.referenced_object_id, FKC.referenced_column_id) AS ReferencedColumn
FROM 
    sys.foreign_keys AS FK
INNER JOIN 
    sys.foreign_key_columns AS FKC ON FK.object_id = FKC.constraint_object_id;


--e.	Get all Nullable columns of a table.
SELECT 
    TABLE_NAME,
    COLUMN_NAME
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    IS_NULLABLE = 'YES' 
    AND TABLE_NAME = 'Movie_Director';  

--f.	Get All table that do not have primary key.
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME NOT IN (
    SELECT OBJECT_NAME(OBJECT_ID)
    FROM sys.indexes
    WHERE is_primary_key = 1
);

--g.	Get All table that do not have identity column. 
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME NOT IN (
    SELECT OBJECT_NAME(OBJECT_ID)
    FROM sys.identity_columns
);

-- Get First Date of Current Month
-- SQL Server
SELECT DATEADD(month, DATEDIFF(month, 0, GETDATE()), 0) AS FirstDateOfMonth;

-- Get Last date of Current month
-- SQL Server
SELECT DATEADD(month, DATEDIFF(month, 0, GETDATE()) + 1, -1) AS LastDateOfMonth;

-- Get first date of next month
-- SQL Server
SELECT DATEADD(month, DATEDIFF(month, 0, GETDATE()) + 1, 0) AS FirstDateOfNextMonth;

-- Get Last date of next month
-- SQL Server
SELECT DATEADD(month, DATEDIFF(month, 0, GETDATE()) + 2, -1) AS LastDateOfNextMonth;


--l.	Get all the information from the tables.
EXEC sp_MSforeachdb 'USE [?];
SELECT
    DB_NAME() AS database_name,
    t.*
FROM
    sys.tables t;';

--m.	Get all columns contain any constraints.
EXEC sp_MSforeachdb 'USE [?];
SELECT
    DB_NAME() AS database_name,
    t.name AS table_name,
    c.name AS column_name,
    cc.*
FROM
    sys.tables t
    INNER JOIN sys.columns c ON t.object_id = c.object_id
    INNER JOIN sys.check_constraints cc ON c.object_id = cc.parent_object_id
WHERE
    cc.definition IS NOT NULL;';

--n.	Get all tables that contain a view.

select distinct schema_name(v.schema_id) as schema_name,
       v.name as view_name,
       schema_name(o.schema_id) as referenced_schema_name,
       o.name as referenced_entity_name,
       o.type_desc as entity_type
from sys.views v
join sys.sql_expression_dependencies d
     on d.referencing_id = v.object_id
     and d.referenced_id is not null
join sys.objects o
     on o.object_id = d.referenced_id
 order by schema_name,
          view_name;


--o.	Get all columns of table that using in views.
select schema_name(v.schema_id) as schema_name,
       object_name(c.object_id) as view_name,
       c.column_id,
       c.name as column_name,
       type_name(user_type_id) as data_type,
       c.max_length,
       c.precision
from sys.columns c
join sys.views v 
     on v.object_id = c.object_id
order by schema_name,
         view_name,
         column_id;

-- Get all the information from the tables
-- SQL Server
SELECT * FROM mov.Movies;
SELECT * FROM mov.Movie_Director;
SELECT * FROM mov.Movie_Actor;
SELECT * FROM mov.Movie_Rating;
