---1 no answer--
create database CollegeDB
on
(
  name='CollegeDB_Data_1',
  filename='C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\CollegeDB_Data_1.mdf',
  size=25mb,
  maxsize=100mb,
  filegrowth=5%

)
log on
(
  name='CollegeDB_log_1',
  filename='C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\CollegeDB_log_1.ldf',
  size=2mb,
  maxsize=50mb,
  filegrowth=1mb

)
go
use CollegeDB
go
create table subjects
(
  subjectid int not null primary key,
  subjectname nvarchar(50) not null,
)
create table student
(
  studentid int not null primary key,
  studentname nvarchar(50) not null,
)

create table Teacher
(
  techerid int not null primary key,
  teachername nvarchar(50) not null,
  subjectid int not null references subjects(subjectid)
)

create table semester
(
  semesterid int not null primary key,
  semestername nvarchar(50) not null,
  studentid int not null references student(studentid)
)
create table studentSubject
(
 studentid int not null references student(studentid),
 subjectid int not null references subjects(subjectid)
)
go
insert into subjects values(1,'c#'),(2,'Data base'),(3,'php'),(4,'Data base')
insert into student values(1,'aa'),(2,'bb'),(3,'cc'),(4,'dd')
insert into Teacher values(1,'A',1),(2,'B',2),(3,'C',3),(4,'D',4)
insert into semester values(1,'sprin',1),(2,'fall',2),(3,'sprin',3),(4,'summer',4)
insert into studentSubject values(1,1),(2,2),(3,3),(4,4)
go
---2 no answer 
select *
from student st
inner join semester sm on st.studentid=sm.studentid
inner join studentSubject ss on ss.studentid=st.studentid
inner join Teacher t on t.subjectid=ss.subjectid
inner join subjects sb on sb.subjectid=t.subjectid

group by st.studentid,sb.subjectid
go
select cast('01-june-2019 10:00 AM') as 2019-06-01 returns int
select convert(cast('01-june-2019 10:00 AM'), 131),returns int
go


----3 no answer--
create proc inserte @id int,@name nvarchar(50)
as
begin try
    insert into student(studentid,studentname)
	values(@id,@name)
end try
begin catch
      declare @mgs nvarchar(1000)
	  select @mgs=ERROR_MESSAGE()
	  raiserror(@mgs,16,1)

end catch
go
exec inserte 5,'ee'
select*from student
go
---update
create proc updates @id int,@name nvarchar(50)
as
begin try
  update student
  set studentname=@name
  where studentid=@id
end try
begin catch
      declare @mgs nvarchar(1000)
	  select @mgs=ERROR_MESSAGE()
	  raiserror(@mgs,16,1)

end catch
go
exec updates 5,'gg'
select*from student
go

----delete
create proc deletes @id int
as
begin try
    delete student
	where studentid=@id
end try
begin catch
      declare @mgs nvarchar(1000)
	  select @mgs=ERROR_MESSAGE()
	  raiserror(@mgs,16,1)

end catch
go
exec deletes 5
select*from student
go

---4--
create trigger tr1
on teacher
insertand of insert
as 
begin
if
begin
   from student st
inner join semester sm on st.studentid=sm.studentid
inner join studentSubject ss on ss.studentid=st.studentid
inner join Teacher t on t.subjectid=ss.subjectid
inner join subjects sb on sb.subjectid=t.subjectid
end
end
---5
create function fn(@id) 
return(
	  declare @mgs nvarchar(1000)
	  select @mgs=ERROR_MESSAGE()
	  raiserror(@mgs,16,1)
     )





---7 no answer--
create  table candidate
(
   id int not null primary key ,
   [name] nvarchar(50) not null
)
create  table person
(
   [name] nvarchar(50) not null primary key,
   age int not null,
)
--7(b)
drop table person
--7(c)
delete  student
where studentid=2



