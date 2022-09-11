DROP PROCEDURE newDiscipline;
DELIMITER $$

CREATE PROCEDURE newDiscipline(
    discipline_name VARCHAR(20)
    )
    COMMENT 'Enter name of new sport category'
    BEGIN 
        DECLARE IDIncrementation CHAR(6); /*Declares ID incrementation*/
        SELECT MAX(discipline_id)+1 FROM discipline INTO IDIncrementation; /*Adds 1 every to disciplineID every time a new discipline is added*/
        INSERT INTO discipline(discipline_id, discipline_name) /*Insert into discipline*/
        VALUES(IDIncrementation, discipline_name);
    END $$
DELIMITER ;
