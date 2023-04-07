-- vytvorenie tabuľky "osadnici"
CREATE TABLE osadnici (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    points INT,
    last_number INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO osadnici (id, name, points, last_number, created_at) VALUES (1, 'Tomas', 10, 0, SYSDATE-1);
INSERT INTO osadnici (id, name, points, last_number, created_at) VALUES (2, 'Lubo', 5, 0, SYSDATE-2);
INSERT INTO osadnici (id, name, points, last_number, created_at) VALUES (3, 'Andy', 8, 0, SYSDATE-3);
INSERT INTO osadnici (id, name, points, last_number, created_at) VALUES (4, 'Smyky', 7, 0, SYSDATE-4);
INSERT INTO osadnici (id, name, points, last_number, created_at) VALUES (5, 'Vilo', 4, 0, SYSDATE-5);

-- vytvorenie procedúry "hod_kockou"
CREATE OR REPLACE PROCEDURE hod_kockou AS
    kocka NUMBER;
    osadnik NUMBER;
BEGIN
    -- vygenerovanie náhodného čísla od 2 do 12 a uloženie do premennej "kocka"
    kocka := FLOOR(DBMS_RANDOM.VALUE(2, 13));
    -- vygenerovanie náhodného ID od 1 do 5 a uloženie do premennej "osadnik"
    osadnik := FLOOR(DBMS_RANDOM.VALUE(1, 6));
    -- ak je hodnota "kocka" rovná 7, vygeneruje sa chyba
    IF kocka = 7 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Nemozno upravit cislo 7!');
    END IF;
    -- inak sa aktualizuje stĺpec "last_number" tabuľky "osadnici" pre dané ID "osadnik"
    UPDATE osadnici SET last_number = kocka WHERE id = osadnik;
    UPDATE osadnici SET points = points + kocka WHERE id = osadnik;
    -- vypíše sa správa o úspešnom updatovaní
    DBMS_OUTPUT.PUT_LINE('Hodnota ' || kocka || ' bola priradena k osadnikovi s ID ' || osadnik);
END;
