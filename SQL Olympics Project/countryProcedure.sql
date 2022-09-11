DELIMITER $$
DROP PROCEDURE newCountry$$ /*Checks to see if procedure already exists, if it does it removes it*/
CREATE PROCEDURE newCountry(
    country_name        VARCHAR(50)
    )
    COMMENT 'Insert new country into table'
    BEGIN
        DECLARE IDIncrementation CHAR(6); /*Declares variable for incrementation*/
        SELECT MAX(country_id) + 1 FROM country INTO IDIncrementation; /*Adds 1 to the CountryID every time a new athlete is added*/
        INSERT INTO country(country_ID,country_name) /*Inserts into country*/
        VALUES(IDIncrementation,country_name);
    END$$
DELIMITER ;

