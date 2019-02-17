--Query all columns for all American cities in CITY with populations larger than 100000. The CountryCode for America is USA.

select * from city
where population > 100000 and countrycode = 'USA';

-- Query the names of all American cities in CITY with populations larger than 120000. The CountryCode for America is USA.

select name from city
where population > 120000 and countrycode = 'USA';

--Query all columns (attributes) for every row in the CITY table.
select * from city;

--Query all columns for a city in CITY with the ID 1661.

select * from city
where id = 1661;

--Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

select * from city
where countrycode = 'JPN';

--Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

select name from city
where countrycode = 'JPN';

--Query a list of CITY and STATE from the STATION table.

select CITY,STATE from STATION;

--Query a list of CITY names from STATION with even ID numbers only. You may print the results in any order, but must exclude duplicates from your answer.

select distinct(CITY) from STATION
where mod(ID,2) = 0;

--Let  be the number of CITY entries in STATION, and let  be the number of distinct CITY names in STATION; query the value of  from STATION. In other words, find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

select count(CITY) - count(distinct(CITY)) from STATION;

--Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

select city, length(city) from station
where length(city) = (select min(length(s.city)) from station s)
order by length(city), city
                                 limit 1;
select city, length(city) from station
where length(city) = (select max(length(s.city)) from station s)
order by length(city), city
                                 limit 1;

--Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

select CITY from STATION
where Left(CITY,1) in ('a','e','i','o','u')

--Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

select distinct(CITY) from station
where right(CITY,1) in ('a','e','i','o','u');

--Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

select distinct(city) from station
where left(city,1) in ('a','e','i','o','u')
and right(city,1) in ('a','e','i','o','u');