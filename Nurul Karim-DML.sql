--USE  
USE db_IT_Training
GO
--INSERT DATA INTO THE TABLE--
INSERT INTO Courses
VALUES	(101, 'WADA'),
		(102, 'GRAPHIC DESIGN'),
		(103, 'NETWORKING')
GO

SELECT *
FROM Courses
GO

INSERT INTO Exams
VALUES	(201, 'C SHARP'),
		(202, 'ADOBE PHOTOSHOP'),
		(203, 'CCNA')
GO

SELECT * 
FROM Exams
GO

INSERT INTO Modules
VALUES (301, 'ASP.NET'),
(302, 'MVC'),
(303, 'HTML')
GO

SELECT * 
FROM Modules
GO

INSERT INTO CourseModules
VALUES	(101, 201),
		(101, 202),
		(102, 203)
GO

SELECT * 
FROM CourseModules
GO

Insert Into Trainees values
(501,'Alomgir',101),
(502,'Jamal',103),
(503,'Kaml',102)

SELECT * 
FROM Trainees
GO

Insert Into ExamResults Values
(202,'Kaml',503),
(201,'Jamal',502),
(203,'Alomgir',501)

SELECT * 
FROM ExamResults
GO
--Test Procedures
exec spInsertCourse 'C#'
go
exec spInsertCourse 'HTML'
go
exec spInsertCourse 'Web Development'
go
exec spUpdateCourse 3, 'HTML5'
go
select * from Courses
go
exec spInsertModule 'T-SQL'
GO
exec spInsertModule 'SQL Server'
GO
exec spInsertModule 'C# Introduction'
GO
select * from modules
GO
exec spInsertExam 'Mid-Term'
GO
exec spInsertExam 'Final1'
GO
--test view
select * from vTraineeInfo
GO
--test function
SELECT dbo.fnScalar(1)
go
select * from fnTable(1)
GO
--TO DELETE DATABASE--
--USE master
--GO
--DROP DATABASE db_IT_Training
--GO