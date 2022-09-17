-- How to Create Table & Insert Data into a simple oracle RDB

CREATE TABLE courses (course_id INT primary key, title varchar(225), semester varchar(20));
insert into courses values (3301, 'DSCI551', 'FALL 2022');
insert into courses values (3302, 'BIO247', 'SPRING 2022');
insert into courses values (3303, 'POSC335', 'FALL 2021');

CREATE TABLE instructor (instructor_id INT primary key, name VARCHAR(30), website VARCHAR(2048));
insert into instructor values (2201, 'Tom Barnes', 'www.professorbarnes.com');
insert into instructor values (2202, 'John Wilkes', 'www.professorwilkes.com');
insert into instructor values (2203, 'Tammy Smith', 'www.professorsmith.com');

CREATE TABLE student (student_id INT primary key, name VARCHAR(30), gpa REAL);
-- or GPA DECIMAL (4,2)
insert into student values (1101, 'Johhny Ramone', 3.6);
insert into student values (1102, 'Ron Weasley', 2.9);
insert into student values (1103, 'Tom Riddle', 3.9);

CREATE TABLE teaching_assistant (student_id INT primary key, name VARCHAR(30), gpa REAL, hourly_rate DECIMAL (4,2)NOT NULL);
-- Subclass entity
insert into teaching_assistant  values (1104, 'Jennifer Goodtime', 4.0, 17.00);
insert into teaching_assistant  values (1105, 'Liam Hendrix', 3.1, 15.00);
insert into teaching_assistant  values (1106, 'Michael Scott', 3.5, 10.00);
