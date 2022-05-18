--creating a table in the database
--we declare the column names/entinties and their datatypes

create table users(
user_id int not null,
name varchar(200),
num_friends int,)

--Inserting values into the  columns

insert into users(user_id, name, num_friends) values(1, 'Dunn', 2),(2, 'Sue', 3)
insert into users(user_id, name, num_friends) values(3, 'Chi', 3),
(3, 'Chi', 3),
(4, 'Thor', 3),
(5, 'Clive', 2),
(6, 'Hicks', 3),
(7, 'Devin', 2),
(8, 'Kate', 2),
(9, 'Klein', 3),
(10, 'Jen', 1)

--Showing results of the newly added users

select *
from users

--Updating the data that we already have in the database
update users
set num_friends = 3
where user_id = 1

--checking the updated row

select num_friends,name
from users
where user_id = 1

--Deleting rows in a table

delete from users
where user_id =1 

--this will only delete one row where the user_id is one in this case Dunn
 
 delete from users

 --the above script will delete every row from the table

 SELECT * FROM users-- get the entire contents
SELECT * FROM users limit 2
SELECT user_id FROM users; -- only get specific columns
SELECT user_id FROM users WHERE name = 'Dunn'; -- only get specific rows

--Group by 
-- groups together rows with identical values in specified columns
--For example finding the number of users and the smallest user id for each possible name length

select len(name) as name_length,
min(user_id) as min_user_id,
count(*) as num_users
from users
group by len(name)


--average number of friends for users whose name start with the same letter 
--but only showing the results for letters whose corresponding average is greater than 1

select SUBSTRING(name, 1, 1) as first_letter,
	AVG(num_friends) as avg_num_friends
from users
group by SUBSTRING(name, 1, 1)
having avg(num_friends) > 1
 
 --verall agregates

 select sum(user_id) as user_id_sum
 from users
 where user_id > 1

 --Order By
 --this help us sort results
 --checking the first two names alphabetically

 select top 2 *
 from users
 order by name

 --Join
--We start by creating another table called user_interests in this table we will put users interests


 create table user_interests(
 user_id int not null,
interest varchar(100) not null
 )

 insert into user_interests(user_id, interest)
 values (0, 'SQL'), (0, 'NoSql'),
		(2, 'SQL'), (2, 'MySQL')

--now joining the two tables to find users interests

select users.name
from users
join user_interests
on users.user_id = user_interests.user_id
where user_interests.interest = 'SQL'

--Subquerries
--finding the smallest user_id for anyone interested in MySQL

select min(user_id) as min_user_id from
(select user_id from user_interests where interest = 'MySQL') sql_interests

--Query Optimization
--lets try top find users who are interested in SQL

select users.name
from users
join user_interests
on users.user_id = user_interests.user_id
where user_interests.interest = 'SQL'

