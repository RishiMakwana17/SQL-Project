/*Lists the competitor countries in the event Mens Mixed Archery in alphabetical order*/
1. SELECT country.country_name FROM country NATURAL JOIN athlete NATURAL JOIN athlete_event WHERE country.country_id = athlete.country_id AND athlete.athlete_id = athlete_event.athlete_id AND athlete_event.event_id = 1 ORDER BY country.country_name ASC;

/*Lists the full names of all competitors from Australia that were born after the 2000's*/
2. SELECT DISTINCT athlete.name AS AthleteName, athlete.DOB AS Birthday FROM athlete WHERE athlete.country_id = 37 AND athlete.DOB >= '2000-01-01';

/*Display the country name and the total number of competitors for each country, include the countries that dont have competitors*/
3. SELECT country.country_name, COUNT(athlete_event.athlete_id) FROM country LEFT OUTER JOIN athlete ON country.country_id = athlete.country_id LEFT OUTER JOIN athlete_event ON athlete.athlete_id = athlete_event.athlete_id GROUP BY country.country_name; 

/*List competitors & their birthdays who have competed in 2 or more events and list events*/
4. SELECT DATE_FORMAT(athlete.DOB, '%d %M %Y') AS Birthday, athlete.athlete_id AS AthleteID, athlete.name AS AthleteName FROM athlete NATURAL JOIN athlete_event NATURAL JOIN events WHERE athlete.athlete_id = athlete_event.athlete_id AND athlete_event.event_id = events.event_id GROUP BY athlete.athlete_id, athlete.name HAVING COUNT(athlete_event.athlete_id) >= 2;

/*Display results of athletes that partake in swimming*/
5. SELECT DISTINCT athlete.athlete_id, athlete.name,medal.medal_name,country.country_name FROM athlete NATURAL JOIN athlete_event NATURAL JOIN events INNER JOIN medal INNER JOIN country WHERE athlete.athlete_id = athlete_event.athlete_id AND athlete_event.event_id = events.event_id AND events.discipline_id = 10 AND athlete_event.medal_id = medal.medal_id AND athlete.country_id = country.country_id; 

/*List name and and total number of races the competitor was in*/
6. SELECT athlete.name AS 'Name',COUNT(athlete_event.athlete_id) FROM athlete LEFT OUTER JOIN athlete_event ON athlete.athlete_id = athlete_event.athlete_id GROUP BY athlete.name;

/*List total number of gold medals won by each country*/
7. SELECT country.country_name, COUNT(athlete_event.medal_id) FROM country NATURAL JOIN athlete NATURAL JOIN athlete_event WHERE country.country_id = athlete.country_id AND athlete.athlete_id = athlete_event.athlete_id AND athlete_event.medal_id = 2 GROUP BY country.country_name;

/*List names and number of medals won by only with medals*/
8. SELECT athlete.name, COUNT(athlete_event.medal_id) FROM athlete NATURAL JOIN athlete_event WHERE athlete.athlete_id = athlete_event.athlete_id GROUP BY athlete.name;
