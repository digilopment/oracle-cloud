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
