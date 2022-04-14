CREATE DATABASE LIBRARY
USE LIBRARY
Create table  Authors (
ID INT PRIMARY KEY IDENTITY,
NAME NVARCHAR(100) NOT NULL,
SURNAME NVARCHAR(100) NOT NULL
)
Create table Books(
ID INT PRIMARY KEY IDENTITY,
NAME NVARCHAR(100) CONSTRAINT LBR_BKS_NAME CHECK(LEN(NAME)>2),
AuthorID INT FOREIGN KEY REFERENCES Authors(ID),
PageCount INT CONSTRAINT LBR_BKS_PGC CHECK (PageCount>2) NOT NULL,
)
INSERT INTO Authors
VALUES ('Lev','Tolstoy'),
('Con','Steynbek'),
('Qabriel','Markes'),
('Corc','Oruel'),
('Uilyam','Qoldinq')
INSERT INTO Books
VALUES('Anna Karenina',1,283),
('Qezeb Salximlari',2,290),
('Yuz ilin tenhaligi',3,303),
('1984',4,304),
('Milcekler Tanrisi',5,505),
('The Devil',1,301),
('Gozlenilen bir qatil tarixcesi',3,403)
 
 CREATE VIEW FULLNAME
  AS
 SELECT B.NAME,B.AuthorID,B.PageCount ,(Authors.NAME+Authors.SURNAME) AS 'FullName' FROM Books AS B
 JOIN Authors  ON Authors.ID=B.AuthorID
 Select *from FULLNAME
 CREATE PROCEDURE SEARCH(@SEARCH NVARCHAR(255))
 AS
 SELECT B.NAME,B.AuthorID,B.PageCount ,(Authors.NAME+Authors.SURNAME) AS 'FullName' FROM Books AS B
 JOIN Authors  ON Authors.ID=B.AuthorID
 WHERE (Authors.NAME+Authors.SURNAME) LIKE '%'+@SEARCH+'%'
 EXEC SEARCH @SEARCH='LEVT'
 

 CREATE PROCEDURE proc_ath_insrt (@Name NVARCHAR(100),@Surname NVARCHAR(100))
 AS
 INSERT INTO Authors(Name,Surname)
 Values (@Name,@Surname)
 EXEC proc_ath_insrt @Name='InsertName',@surname='InsertSurname'
 

 CREATE PROCEDURE proc_ath_delete(@ID INT)
 AS
 DELETE FROM Authors WHERE ID=@ID
 EXEC proc_ath_delete @ID=2
 