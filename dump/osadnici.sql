-- vytvorenie tabuľky "osadnici"
CREATE TABLE osadnici (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    points INT,
    last_number INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO osadnici (id, name, points, last_number, created_at) VALUES (1, 'Tomas', 0, 0, SYSDATE-1);
INSERT INTO osadnici (id, name, points, last_number, created_at) VALUES (2, 'Lubo', 0, 0, SYSDATE-2);
INSERT INTO osadnici (id, name, points, last_number, created_at) VALUES (3, 'Andy', 0, 0, SYSDATE-3);
INSERT INTO osadnici (id, name, points, last_number, created_at) VALUES (4, 'Smyky', 0, 0, SYSDATE-4);
INSERT INTO osadnici (id, name, points, last_number, created_at) VALUES (5, 'Vilo', 0, 0, SYSDATE-5);

create or replace NONEDITIONABLE PROCEDURE kocka_procedura IS
  kocka NUMBER(2);
  osadnik NUMBER(5);
BEGIN
  -- Overenie počtu spustení
  DECLARE
    pocet_spusteni NUMBER(2);
  BEGIN
    SELECT COUNT(*) INTO pocet_spusteni FROM user_scheduler_jobs WHERE job_name = 'HOD_KOCKOU_JOB';
    IF pocet_spusteni >= 15 THEN
      RAISE_APPLICATION_ERROR(-20001, 'Procedúra môže byť spustená maximálne 15-krát.');
    END IF;
  END;

  -- Generovanie náhodných čísel
  kocka := TRUNC(DBMS_RANDOM.VALUE(2, 13));
  osadnik := TRUNC(DBMS_RANDOM.VALUE(1, 6));

  -- Overenie hodnoty kocky a aktivácia before triggeru
  IF kocka = 7 THEN
    UPDATE osadnici SET last_number = kocka WHERE id = osadnik;
    UPDATE osadnici SET points = points - kocka WHERE id = osadnik;
  ELSE
    UPDATE osadnici SET points = points + kocka, last_number = kocka WHERE id = osadnik;
  END IF;
END;

create or replace NONEDITIONABLE PROCEDURE OSADNICI_RESET_GAME AS 
BEGIN
  UPDATE osadnici SET last_number = 0;
  UPDATE osadnici SET points = 0;
END OSADNICI_RESET_GAME;

create or replace NONEDITIONABLE TRIGGER before_update_osadnici
BEFORE UPDATE ON osadnici
FOR EACH ROW
BEGIN
  IF :NEW.points > 30 THEN
    RAISE_APPLICATION_ERROR(-20003, 'Bol prekroceny maximalny pocet bodov.');
  END IF;
END;

BEGIN
  DBMS_SCHEDULER.CREATE_JOB (
    job_name        => 'osadnici_autoplay',
    job_type        => 'PLSQL_BLOCK',
    job_action      => 'BEGIN kocka_procedura(); END;',
    start_date      => SYSTIMESTAMP,
    repeat_interval => 'FREQ=SECONDLY;INTERVAL=5',
    enabled         => TRUE
  );
END;
