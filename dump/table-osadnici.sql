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
