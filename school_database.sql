DROP SCHEMA IF EXISTS school;
CREATE SCHEMA school;
USE school;

CREATE TABLE teacher (
  teacher_id INT PRIMARY KEY,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(45) UNIQUE,
  starting_date DATE NOT NULL,
  ending_date DATE,
  address VARCHAR(45) NOT NULL
);

CREATE TABLE subject (
  subject_id INT PRIMARY KEY,
  subject_name VARCHAR(45) NOT NULL,
  starting_date DATE NOT NULL,
  ending_date DATE,
  UNIQUE (subject_name, starting_date)
);

CREATE TABLE teacher_subject (
  teacher_subject_id INT PRIMARY KEY,
  teacher_id INT NOT NULL,
  subject_id INT NOT NULL,
  FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id),
  FOREIGN KEY (subject_id) REFERENCES subject(subject_id),
  UNIQUE (teacher_id, subject_id)
);

CREATE TABLE exam (
  exam_id INT PRIMARY KEY,
  exam_date DATE NOT NULL,
  subject_id INT NOT NULL,
  FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);

CREATE TABLE student (
  student_id INT PRIMARY KEY,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  phone VARCHAR(45) UNIQUE,
  address VARCHAR(45) NOT NULL,
  join_date DATE NOT NULL
);

CREATE TABLE student_subject (
  student_subject_id INT PRIMARY KEY,
  student_id INT NOT NULL,
  subject_id INT NOT NULL,
  grade INT CHECK (grade >= 0 AND grade <= 100),
  FOREIGN KEY (student_id) REFERENCES student(student_id),
  FOREIGN KEY (subject_id) REFERENCES subject(subject_id),
  UNIQUE (student_id, subject_id)
);

INSERT INTO teacher (
		teacher_id,
        first_name,
        last_name,
        email,
        starting_date,
        ending_date,
        address
)
VALUES (
		1234,
        'James',
        'McCompleto',
        'james.mccompleto@sql.com',
        '2019-09-24',
        NULL,
        '123 Mc street'
);

INSERT INTO subject (
		subject_id,
        subject_name,
        starting_date,
        ending_date
)
VALUES (
		1,
        'Mathematics',
        '2022-12-01',
        '2023-05-01'
);

INSERT INTO student_subject (
		student_subject_id,
        student_id,
        subject_id,
        grade
)
VALUES (
		12,
        01,
        1,
        70
);

INSERT INTO exam (
		exam_id,
        exam_date,
        subject_id
)
VALUES (
		88,
        '2023-05-01',
        1
);

INSERT INTO student (
		student_id,
        first_name,
        last_name,
        phone,
        address,
        join_date
)
VALUES (
		01,
        'Mavtias',
        'Oliva',
        473375934,
        'Street of dreams 443',
        '2022-11-30'
);

INSERT INTO teacher_subject (
		teacher_subject_id,
        teacher_id,
        subject_id
)
VALUES (
		12,
        1234,
        1
);

