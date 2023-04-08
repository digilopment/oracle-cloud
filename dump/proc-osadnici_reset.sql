CREATE or replace NONEDITIONABLE PROCEDURE osadnici_reset IS 
BEGIN
   UPDATE osadnici SET last_number = 0;
   UPDATE osadnici SET points = 0;
END;

