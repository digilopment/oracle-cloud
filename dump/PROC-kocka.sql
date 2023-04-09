CREATE OR REPLACE NONEDITIONABLE PROCEDURE kocka_procedura IS
  kocka NUMBER;
  osadnik NUMBER;
BEGIN
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

