/*Create for 5th query*/
1. CREATE VIEW eventResults AS SELECT DISTINCT athlete.athlete_id AS AthleteID, athlete.name AS 'Name',medal.medal_name AS Medal,country.country_name AS Country FROM FROM athlete NATURAL JOIN athlete_event NATURAL JOIN events INNER JOIN medal INNER JOIN country WHERE athlete.athlete_id = athlete_event.athlete_id AND athlete_event.event_id = events.event_id AND events.discipline_id = 10 AND athlete_event.medal_id = medal.medal_id AND athlete.country_id = country.country_id; 

/*1.a Run the view in the command line*/
SELECT DISTINCT AthleteID, Name, Medal, Country FROM eventResults WHERE Country = 'Canada';


/*Create for second query*/
2. CREATE VIEW australianCompetitors AS SELECT DISTINCT SELECT DISTINCT athlete.name AS AthleteName, athlete.DOB AS Birthday FROM athlete WHERE athlete.country_id = 37;

/*2.a Run the view in the command line*/
SELECT AthleteName, Birthday FROM australianCompetitors WHERE Birthday >= '2000-01-01';


