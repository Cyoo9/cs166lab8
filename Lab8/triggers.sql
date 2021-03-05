CREATE SEQUENCE part_number_seq START WITH 50000; 

CREATE LANGUAGE plpgsql; 
CREATE OR REPLACE FUNCTION get_next()
RETURNS "trigger" AS 
$BODY$
BEGIN 
NEW.part_number := nextval('part_number_seq');
return NEW;
END;
$BODY$
LANGUAGE plpgsql VOLATILE; 

CREATE TRIGGER populate BEFORE INSERT
ON part_nyc FOR EACH ROW
EXECUTE PROCEDURE get_next(); 
