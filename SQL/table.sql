CREATE TABLE friends (
  id INTEGER,
  name TEXT,
  birthday DATE
);

INSERT INTO friends (id, name, birthday)
VALUES (1, 'Ororo Munroe', '30-05-1940');

INSERT INTO friends (id, name, birthday)
VALUES (2, 'Abdullah Al Mahfuz', '05-02-1991');

INSERT INTO friends (id, name, birthday)
VALUES (3, 'Mehedi Hasan', '25-07-1991');

UPDATE friends
SET name='Storm'
WHERE id=1;

ALTER TABLE friends
ADD COLUMN email TEXT;

UPDATE friends
SET email='storm@codeacademy.com'
WHERE id=1;

UPDATE friends
SET email='manna3006@gmail.com'
WHERE id=2;

UPDATE friends
SET email='mhasansylbd07@gmail.com'
WHERE id=3;

DELETE FROM friends
WHERE id=1;

SELECT * FROM friends;