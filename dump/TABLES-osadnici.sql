-- vytvorenie tabuľky "osadnici"
CREATE TABLE osadnici (
    id INT PRIMARY KEY,
    fullname VARCHAR(50),
    points INT,
    last_number INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO osadnici (id, fullname, points, last_number, created_at) VALUES (1, 'Tomas', 0, 0, CURRENT_TIMESTAMP);
INSERT INTO osadnici (id, fullname, points, last_number, created_at) VALUES (2, 'Lubo', 0, 0, CURRENT_TIMESTAMP);
INSERT INTO osadnici (id, fullname, points, last_number, created_at) VALUES (3, 'Andy', 0, 0, CURRENT_TIMESTAMP);
INSERT INTO osadnici (id, fullname, points, last_number, created_at) VALUES (4, 'Smyky', 0, 0, CURRENT_TIMESTAMP);
INSERT INTO osadnici (id, fullname, points, last_number, created_at) VALUES (5, 'Vilo', 0, 0, CURRENT_TIMESTAMP);

-- vytvorenie tabuľky "osadnici_games"
CREATE TABLE osadnici_games (
    id NUMBER(10) GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    winner VARCHAR2(50),
    points NUMBER(5),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

