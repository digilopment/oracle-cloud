create or replace NONEDITIONABLE TRIGGER before_update_osadnici
BEFORE UPDATE ON osadnici
FOR EACH ROW
BEGIN
  IF (:NEW.points = 30) THEN
    INSERT INTO osadnici_games (winner, points, created_at) VALUES (:NEW.fullname, :NEW.points, SYSDATE);
    :NEW.points := 0; -- set points to 0 instead of deleting the row
  END IF;
  IF :NEW.points > 30 THEN
    RAISE_APPLICATION_ERROR(-20003, 'Bol prekroceny maximalny pocet bodov. Vitaz musi mat presne 30 bodov.');
  END IF;
END;
