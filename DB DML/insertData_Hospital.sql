INSERT INTO patients(first_name, last_name, birth_date, phone_number, email)
VALUES ('Taras', 'Bobryk', '1989-07-11', '+78569832', 'taras.bobryk@mail.ua'),
       ('Penelope', 'Cruz', '1979-03-17', '+78569832', 'p.cruz@mail.ua'),
       ('Jim', 'Carry', '1968-01-24', '+78569832', 'j.carry@mail.ua'),
       ('Alex', 'Tornu', '1986-05-26', '+78236985', 'alex.tornu@mail.ua'),
       ('Richard', 'Brandson', '1964-02-01', '+78165168', 'rich@mail.ua'),
       ('Ostap', 'Yarysh', '1992-08-12', '+78369874', 'ostap.yarysh@mail.ua'),
       ('Oleg', 'Fisun', '1993-09-12', '+78315354', 'oleg.fisun@mail.ua'),
       ('Alice', 'Teylor', '1995-06-10', '+78936901', 'alice.teylor@mail.ua'),
       ('Roman', 'Furda', '1991-11-04', '+78598746', 'roman.furda@mail.ua'),
       ('Ivan', 'Kucab', '1985-10-15', '+78951236', 'ivan.kucab@mail.ua');

INSERT INTO placements(room_number, unit, floor)
VALUES ('101', 'A', '1'),
       ('102', 'A', '1'),
       ('103', 'A', '1'),
       ('201', 'A', '2'),
       ('202', 'A', '2'),
       ('203', 'A', '2'),
       ('101', 'B', '1'),
       ('102', 'B', '1'),
       ('201', 'B', '2'),
       ('202', 'B', '2');

INSERT INTO doctors(first_name, last_name, specialization, phone_number)
VALUES ('Eric', 'Foreman', 'Diagnostic Medicine, neurologist', '+7532658'),
       ('Allison', 'Cameron', 'Emergency Medicine, immunologist', '+7578965'),
       ('Robert', 'Chase', 'Surgeon, intensive care specialist', '+7532149'),
       ('Riki', 'Martin', 'Surgeon, intensive care specialist', '+7532223'),
       ('John', 'Dou', 'Surgeon, intensive care specialist', '+7532100'),
       ('Jackie', 'Chan', 'Surgeon, intensive care specialist', '+7532099'),
       ('Matthew', 'Mac', 'Surgeon, intensive care specialist', '+7532266'),
       ('Dr. Gregory', 'House', 'Diagnostic Medicine', '+7512396'),
       ('Lisa', 'Cuddy', 'Dean of Medicine, endocrinologist', '+7556987'),
       ('James', 'Wilson', 'Diagnostic Medicine', '+7512396');

INSERT INTO departments(department_name, department_head_id)
VALUES ('Neurology', '1'),
       ('Anaesthetics', '2'),
       ('Cardiology', '3'),
       ('Diagnostic imaging', '4'),
       ('Gastroenterology', '5'),
       ('Gynaecology', '6'),
       ('Neurology', '7'),
       ('Oncology', '8'),
       ('Physiotherapy', '9'),
       ('Ophthalmology', '10');

UPDATE doctors
SET department_id = 5
WHERE doctor_id = 6;

INSERT INTO hospitalizations(initial_diagnosis, start_date, doctor_id, patient_id, placement_id)
VALUES ('Some initial diagnosis', '2023-01-10', 1, 1, 1),
       ('Some initial diagnosis 1', '2022-11-09', 1, 2, 1),
       ('Some initial diagnosis 3', '2023-02-02', 2, 4, 2),
       ('Some initial diagnosis 4', '2022-11-04', 3, 5, 3),
       ('Some initial diagnosis 4', '2022-11-04', 4, 6, 3),
       ('Some initial diagnosis 4', '2022-11-04', 5, 7, 4),
       ('Some initial diagnosis 4', '2022-12-04', 5, 8, 4),
       ('Some initial diagnosis 4', '2022-12-04', 5, 9, 4),
       ('Some initial diagnosis 4', '2022-11-04', 1, 10, 4);

INSERT INTO hospitalizations(initial_diagnosis, start_date, end_date, doctor_id, patient_id, placement_id)
VALUES ('Some initial diagnosis 2', '2022-12-13', '2023-01-26', 2, 3, 2);

INSERT INTO examinations(symptoms_description, diagnosis, diagnosis_date, doctor_id, hospitalization_id)
VALUES ('Abdominal pain', 'gastritis', '2023-01-12', 1, 1),
       ('Strong cough', 'asthma', '2022-11-20', 2, 2),
       ('Some symptoms', 'some diagnosis', '2022-11-20', 3, 5),
       ('Some symptoms', 'some diagnosis', '2022-12-20', 4, 5),
       ('Some symptoms', 'some diagnosis', '2022-11-22', 5, 5),
       ('Some symptoms', 'some diagnosis', '2022-11-26', 6, 5),
       ('Some symptoms', 'some diagnosis', '2022-12-20', 6, 5),
       ('Some symptoms', 'some diagnosis', '2022-12-20', 8, 9),
       ('Some symptoms', 'some diagnosis', '2022-12-20', 9, 9),
       ('Strong cough', 'asthma', '2022-11-20', 2, 2);
