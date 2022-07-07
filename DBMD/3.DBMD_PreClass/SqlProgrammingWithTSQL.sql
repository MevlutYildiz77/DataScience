use movie
GO

--1. STORED PROCEDURE BASICS


--Crating Stored Procedure

CREATE PROC FilmYear
AS 
BEGIN
	SELECT 
		Movie_ID
		,Title
	FROM 
		movie
	ORDER BY 
		Movie_ID DESC
END

EXECUTE FilmYear --Executing the Sored Procedure

--Modifiying the stored procedure
ALTER PROC [dbo].[FilmYear]
AS 
BEGIN
	SELECT 
		Movie_ID
		, Title
		,Genre
	FROM 
		movie
	ORDER BY 
		Movie_ID DESC
END

EXECUTE [dbo].[FilmYear]  --Executing the Sored Procedure


--DELETING THE STORED PROCEDURE
DROP PROC FilmYear


--2.STORED PROCEDURE PARAMETERS

--Adding parameter to the procedure
 

CREATE PROC duration(@MinDuration AS INT)
AS 
BEGIN
	SELECT 
		Movie_ID
		,Title
		,Duration
	FROM 
		movie
	WHERE 
		Duration > 150
	ORDER BY 
		Movie_ID DESC
END


EXEC duration 60 -- DO AGAIN

--3 ADDING MULTIPLY PARAMETERS
ALTER PROC [dbo].[duration]
		(@MinDuration AS INT
		,@MaxDuration AS INT
		)
AS
BEGIN
	SELECT 
		Movie_ID
		,Title
		,Duration
	FROM
		movie
	WHERE 
		Duration > @MinDuration AND
		Duration <= @MaxDuration
	ORDER BY Movie_ID	  

END

EXEC duration 105, 140
EXEC duration @MinDuration=105, @MaxDuration=140

--CREATING A TEXT PARAMETER

ALTER PROC [dbo].[duration]
		(@MinDuration AS INT
		,@MaxDuration AS INT
		,@Genre AS VARCHAR(MAX)
		)
AS
BEGIN
	SELECT 
		Movie_ID
		,Title
		,Duration
		,Genre
	FROM
		movie
	WHERE 
		Duration > @MinDuration AND
		Duration <= @MaxDuration AND
		Genre LIKE '%' + @Genre + '%'
	ORDER BY Movie_ID	  

END

EXEC duration @MinDuration=100, @MaxDuration=160, @Genre= 'Drama'


--ASSIGNING DEFAULT VALUES TO A PARAMETER

ALTER PROC [dbo].[duration]
		(@MinDuration AS INT = 0
		,@MaxDuration AS INT
		,@Genre AS VARCHAR(MAX)
		)
AS
BEGIN
	SELECT 
		Movie_ID
		,Title
		,Duration
		,Genre
	FROM
		movie
	WHERE 
		Duration > @MinDuration AND
		Duration <= @MaxDuration AND
		Genre LIKE '%' + @Genre + '%'
	ORDER BY Movie_ID	  

END

EXEC duration @MaxDuration=160, @Genre= 'Western'

--USING NULL AS THE DEFAULT VALUE

ALTER PROC [dbo].[duration]
		(@MinDuration AS INT = NULL
		,@MaxDuration AS INT = NULL
		,@Genre AS VARCHAR(MAX)
		)
AS
BEGIN
	SELECT 
		Movie_ID
		,Title
		,Duration
		,Genre
	FROM
		movie
	WHERE 
		@MinDuration IS NULL OR Duration > @MinDuration AND
		@MaxDuration IS NULL OR Duration <= @MaxDuration AND
		Genre LIKE '%' + @Genre + '%'
	ORDER BY Movie_ID	  

END

EXEC duration @Genre= 'Drama', @MinDuration= 140 --DO AGAIN
EXEC duration @Genre= 'Western', @MinDuration= 140


--VARIABLES


