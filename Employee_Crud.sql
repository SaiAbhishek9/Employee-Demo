create database Employee_crud
go
use Employee_crud
go
create table Employee_Form
(
EmployeeId int primary key not null identity(1,1),
EmployeeName varchar(100) not null,
EmployeeAge datetime not null,
EmployeeGender varchar(100) not null,
EmployeeAddress varchar(100) not null,
EmployeeState varchar(100) not null,
EmployeeCity varchar(100) not null,
EmployeeHobbies varchar(100) not null,
EmployeeTechskills varchar(100) not null
)

select * from Employee_Form
go
create proc add_employee(@name varchar(100),@age datetime,@gender varchar(100),@address varchar(100),@state varchar(100),@city varchar(100),
@hobbies varchar(100),@techskills varchar(100))
as
begin
insert Employee_Form values(@name,@age,@gender,@address,@state,@city,@hobbies,@techskills)
return @@identity
end

add_employee 'xyz','12/12/12','Male','sdd','Karnataka','jhjg','Cricket','DotNet'
go
Create proc search_employee(@name varchar(100))
as
begin
select * from Employee_Form where EmployeeName like '%'+@name+'%' or EmployeeId  like '%'+@name+'%'
end

search_employee 'sa'

go
create proc find_employee(@id int)
as
begin
select * from Employee_Form where EmployeeId=@id
end

go
create proc update_employee(@id int,@age datetime,@address varchar(100),@state varchar(100),@city varchar(100),@hobbies varchar(100),@techskills varchar(100))
as
begin
update Employee_Form set EmployeeAge=@age,EmployeeAddress=@address,EmployeeState=@state,EmployeeCity=@city,EmployeeHobbies=@hobbies,EmployeeTechskills=@techskills 
where EmployeeId=@id
return @@rowcount
end
go
create proc delete_employee(@id int)
as
begin
delete from Employee_Form where EmployeeId=@id
end