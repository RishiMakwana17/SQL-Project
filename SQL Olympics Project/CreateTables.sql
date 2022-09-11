/*Creates table for country*/
CREATE TABLE country 
(
    country_id   INT(6) NOT NULL,
    country_name VARCHAR(50) NOT NULL,
    CONSTRAINT   country_pk PRIMARY KEY (country_id)
);

/*Creates table for medal*/
CREATE TABLE medal 
( 
    medal_id   INT(4) NOT NULL,
    medal_name VARCHAR(10) NOT NULL,
    CONSTRAINT medal_pk PRIMARY KEY (medal_id)
);

/*Creates table for discipline*/
CREATE TABLE discipline 
( 
    discipline_id   INT(6) NOT NULL,
    discipline_name VARCHAR(20) NOT NULL,
    CONSTRAINT discipline_PK PRIMARY KEY (discipline_id)
);

/*Creates table for athlete*/
CREATE TABLE athlete 
( 
    athlete_id    INT(6) NOT NULL,
	country_id    INTEGER NOT NULL,
    name      VARCHAR(20) NOT NULL,
    gender        CHAR(1) NOT NULL,
    DOB         DATE NOT NULL, 
    CONSTRAINT athlete_pk PRIMARY KEY (athlete_id)
);

/*Creates table for events*/
CREATE TABLE events 
(
    event_id        INT(6) NOT NULL,
    discipline_id     INTEGER NOT NULL,
    title           VARCHAR(100) NOT NULL,
    CONSTRAINT event_pk PRIMARY KEY (event_id),
	CONSTRAINT event_fk2 FOREIGN KEY (discipline_id) REFERENCES discipline(discipline_id) ON DELETE RESTRICT
);

/*Creates table for athlete_event*/
CREATE TABLE athlete_event 
(
    athlete_event_id INTEGER NOT NULL,
    athlete_id        INTEGER NOT NULL,
    event_id          INT(6) NOT NULL,
	medal_id		  INTEGER NOT NULL,
    CONSTRAINT athlete_event_pk PRIMARY KEY (athlete_event_id),
	CONSTRAINT athlete_event_fk1 FOREIGN KEY (athlete_id) REFERENCES athlete(athlete_id) ON DELETE RESTRICT,
	CONSTRAINT athlete_event_fk2 FOREIGN KEY (event_id) REFERENCES events(event_id) ON DELETE RESTRICT,
	CONSTRAINT athlete_event_fk3 FOREIGN KEY (medal_id) REFERENCES medal(medal_id) ON DELETE RESTRICT
);
