CREATE OR REPLACE TRIGGER before_update_osadnici
BEFORE UPDATE ON osadnici
FOR EACH ROW
BEGIN
  IF :NEW.points > 30 THEN
    RAISE_APPLICATION_ERROR(-20003, 'Bol prekroceny maximalny pocet bodov.');
  END IF;
END;
