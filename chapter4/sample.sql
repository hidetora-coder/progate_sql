--! データを追加
INSERT INTO students(name, course)
VALUES ("Kate", "Java");

--! データを更新
UPDATE students
SET name="Jordan", course = "HTML"
WHERE id = 6;

--! データの削除
DELETE FROM students
WHERE id = 7;

--! 復習
INSERT INTO students(name, course)
VALUES ("Katy", "HTML");

UPDATE students
SET name="Juliet", course = "Ruby"
WHERE id = 6;

DELETE FROM students
WHERE id = 2;