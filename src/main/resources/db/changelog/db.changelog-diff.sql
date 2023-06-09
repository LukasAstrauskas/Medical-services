-- liquibase formatted sql

-- changeset viktorija:1667498246718-1
CREATE TABLE public.service_provider (id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL, company_name VARCHAR(255), email VARCHAR(255), password VARCHAR(255), phone_number VARCHAR(255), type VARCHAR(255), CONSTRAINT service_providerPK PRIMARY KEY (id));
-- rollback DROP TABLE public.service_provider;

-- changeset viktorija:1667498246718-2
CREATE TABLE public.services (id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL, description VARCHAR(255), name VARCHAR(255), price FLOAT8 NOT NULL, CONSTRAINT servicesPK PRIMARY KEY (id));
-- rollback DROP TABLE public.services;

-- changeset viktorija:1667498246718-3
CREATE TABLE public.timeframe (id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL, name VARCHAR(255), time TIMESTAMP WITHOUT TIME ZONE, CONSTRAINT timeframePK PRIMARY KEY (id));
-- rollback DROP TABLE public.timeframe;

-- changeset viktorija:1667498246718-4
CREATE TABLE public.user (id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL, birth_date TIMESTAMP WITHOUT TIME ZONE, email VARCHAR(255), enabled BOOLEAN, first_name VARCHAR(255), last_name VARCHAR(255), locked BOOLEAN, password VARCHAR(255), user_role VARCHAR(255), CONSTRAINT userPK PRIMARY KEY (id));
-- rollback DROP TABLE public.user;

-- liquibase formatted sql

-- changeset viktorija:1668000805452-1
CREATE SEQUENCE  IF NOT EXISTS public.hibernate_sequence START WITH 1 INCREMENT BY 1;
-- rollback DROP SEQUENCE public.hibernate_sequence;

-- liquibase formatted sql

-- changeset viktorija:1668001062249-1
CREATE TABLE public.timeslots (id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL, end_time TIMESTAMP WITHOUT TIME ZONE, start_time TIMESTAMP WITHOUT TIME ZONE, service_provider_id BIGINT, user_id BIGINT, CONSTRAINT "timeslotsPK" PRIMARY KEY (id));
-- rollback DROP TABLE public.timeslots;

-- changeset viktorija:1668001062249-2
ALTER TABLE public.timeslots ADD CONSTRAINT "FKenxp1b73b9i21l22etuayitwv" FOREIGN KEY (user_id) REFERENCES public.user (id);
-- rollback ALTER TABLE public.timeslots DROP CONSTRAINT "FKenxp1b73b9i21l22etuayitwv";

-- changeset viktorija:1668001062249-3
ALTER TABLE public.timeslots ADD CONSTRAINT "FKhyix9to0iicgpauv2gyui33jh" FOREIGN KEY (service_provider_id) REFERENCES public.service_provider (id);
-- rollback ALTER TABLE public.timeslots DROP CONSTRAINT "FKhyix9to0iicgpauv2gyui33jh";

-- changeset viktorija:1668001062249-4
DROP TABLE public.timeframe;
-- rollback CREATE TABLE public.timeframe (id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL, name VARCHAR(255), time TIMESTAMP WITHOUT TIME ZONE, CONSTRAINT timeframePK PRIMARY KEY (id));


-- liquibase formatted sql

-- changeset illiababich:1669469502034-2
CREATE TABLE public.procedure (id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL, description VARCHAR(255), price FLOAT4 NOT NULL, procedure_name VARCHAR(255), service_provider_id BIGINT, CONSTRAINT "procedurePK" PRIMARY KEY (id));

-- changeset illiababich:1669469502034-3
CREATE TABLE public.roles (id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL, role INTEGER, CONSTRAINT rolesPK PRIMARY KEY (id));

-- changeset illiababich:1669469502034-4
CREATE TABLE public.user_roles (user_id BIGINT NOT NULL, role_id BIGINT NOT NULL);

-- changeset illiababich:1669469502034-5
ALTER TABLE public.service_provider ADD enabled BOOLEAN;

-- changeset illiababich:1669469502034-6
ALTER TABLE public.service_provider ADD locked BOOLEAN;

-- changeset illiababich:1669469502034-7
ALTER TABLE public.user_roles ADD CONSTRAINT "FK55itppkw3i07do3h7qoclqd4k" FOREIGN KEY (user_id) REFERENCES public.user (id);

-- changeset illiababich:1669469502034-8
ALTER TABLE public.user_roles ADD CONSTRAINT "FKh8ciramu9cc9q3qcqiv4ue8a6" FOREIGN KEY (role_id) REFERENCES public.roles (id);

-- changeset illiababich:1669469502034-9
ALTER TABLE public.procedure ADD CONSTRAINT "FKodqkxiavd0bxfobwe22d6gr8p" FOREIGN KEY (service_provider_id) REFERENCES public.service_provider (id);

-- changeset illiababich:1669469502034-10
DROP TABLE public.services;

-- changeset illiababich:1669469502034-11
ALTER TABLE public.user DROP COLUMN user_role;

-- liquibase formatted sql

-- changeset illiababich:1669493930048-1
ALTER TABLE public.service_provider DROP COLUMN type;

-- liquibase formatted sql

-- changeset illiababich:1669566024281-1
ALTER TABLE public.user DROP COLUMN locked;

-- changeset illiababich:1670363760048-1
ALTER TABLE public."user" ADD last_checkup_date DATE;

-- changeset illiababich:1669566024281-2
ALTER TABLE public.service_provider DROP COLUMN locked;

-- liquibase formatted sql

-- changeset illiababich:1670105497705-5
CREATE TABLE public.appointment (id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL, timeslot_id BIGINT, CONSTRAINT "appointmentPK" PRIMARY KEY (id));

-- changeset illiababich:1670105497705-6
CREATE TABLE public.appointment_procedures (appointment_id BIGINT NOT NULL, procedure_id BIGINT NOT NULL);

-- changeset illiababich:1670105497705-25
ALTER TABLE public.appointment ADD CONSTRAINT "FKop8banbjd2slni7hxnbu74cgu" FOREIGN KEY (timeslot_id) REFERENCES public.timeslots (id);

-- liquibase formatted sql

-- changeset illiababich:1670108448003-18
ALTER TABLE public.appointment_procedures ADD CONSTRAINT "FKisq1rp4h0t6d4o6rkhm4x08ly" FOREIGN KEY (appointment_id) REFERENCES public.appointment (id);

-- changeset illiababich:1670108448003-22
ALTER TABLE public.appointment_procedures ADD CONSTRAINT "FKs0e0fpdj3tqp6rp0vogwad7y4" FOREIGN KEY (procedure_id) REFERENCES public.procedure (id);

-- liquibase formatted sql

-- changeset illiababich:1670202485246-10
ALTER TABLE public.timeslots ADD COLUMN comment VARCHAR(255);

-- liquibase formatted sql

-- changeset illiababich:1670238476577-1
ALTER TABLE public.appointment ADD comment VARCHAR(255);

-- changeset illiababich:1670238476577-2
ALTER TABLE public.appointment ADD user_id BIGINT;

-- changeset illiababich:1670238476577-3
ALTER TABLE public.appointment ADD CONSTRAINT "FKa8m1smlfsc8kkjn2t6wpdmysk" FOREIGN KEY (user_id) REFERENCES public."user" (id);

-- liquibase formatted sql

DROP TABLE public.timeslots CASCADE;

-- changeset illiababich:1670267802747-10
CREATE TABLE public.timeslots (id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL, end_time TIMESTAMP WITHOUT TIME ZONE, start_time TIMESTAMP WITHOUT TIME ZONE, service_provider_id BIGINT, CONSTRAINT "timeslotsPK" PRIMARY KEY (id));

-- changeset illiababich:1670267802747-16
ALTER TABLE public.timeslots ADD CONSTRAINT "FKhyix9to0iicgpauv2gyui33jh" FOREIGN KEY (service_provider_id) REFERENCES public.service_provider (id);

-- changeset illia:20160303150001-1
INSERT INTO
  public.service_provider (company_name, email, password, phone_number, enabled)
VALUES ('Anteja', 'anteja@gmail.com', '$2a$10$b7vfAo9ei7yRrYjyPWP6f.OWAoLkafP1RsEa2VNOMgFs4yxSOhkGS', '+37012345678', true);
-- rollback DELETE FROM public.service_provider WHERE company_name = 'Anteja' AND email = 'anteja@gmail.com' AND password = '$2a$10$b7vfAo9ei7yRrYjyPWP6f.OWAoLkafP1RsEa2VNOMgFs4yxSOhkGS' AND phone_number = '+37012345678' AND type = 'ANTEJA' AND enabled = true AND locked = false;

-- changeset illia:20160303150001-2
INSERT INTO
  public.service_provider (company_name, email, password, phone_number, enabled)
VALUES ('Antakalnio Poliklinika', 'antakalnio@gmail.com', '$2a$10$VGU/8NUzqiv9CFDVjtZKSOULS8LBosvgp7mSFEhX6mWemh/zmTPxm', '+37012345678', true);
-- rollback DELETE FROM public.service_provider WHERE company_name = 'Antakalnio Poliklinika' AND email = 'antakalnio@gmail.com' AND password = '$2a$10$VGU/8NUzqiv9CFDVjtZKSOULS8LBosvgp7mSFEhX6mWemh/zmTPxm' AND phone_number = '+37012345678' AND type = 'ANTAKALNIS' AND enabled = true AND locked = false;

-- changeset illia:20160303150001-3
INSERT INTO
  public.user (birth_date, email, enabled, first_name, last_name, password, last_checkup_date)
VALUES ('2000-01-01', 'admin@devbridge.com', true, 'admin', 'admin', '$2a$10$8ik5BPs/em0F9BCnSELlgeTl1bwJmwlZEMlQdHwF9wsrCtDeOL4Eq', '2022-12-02');
-- rollback DELETE FROM public.user WHERE birth_date = '2000-01-01' AND email = 'admin@devbridge.com' AND enabled = true AND first_name = 'admin' AND last_name = 'admin' AND locked = false AND password = '$2a$10$8ik5BPs/em0F9BCnSELlgeTl1bwJmwlZEMlQdHwF9wsrCtDeOL4Eq';

--changeset illia:20160303150001-4
INSERT INTO
  public.user (birth_date, email, enabled, first_name, last_name, password, last_checkup_date)
VALUES ('2000-01-01', 'manager@devbridge.com', true, 'manager', 'manager', '$2a$10$5QD2a4gHR8kEmfutKr9uuOtBYqtAzpR8KmTv2NNOSREub7LE95nee', '2022-10-02');
-- rollback DELETE FROM public.user WHERE birth_date = '2000-01-01' AND email = 'manager@devbridge.com' AND enabled = true AND first_name = 'manager' AND last_name = 'manager' AND locked = false AND password = '$2a$10$5QD2a4gHR8kEmfutKr9uuOtBYqtAzpR8KmTv2NNOSREub7LE95nee';

--changeset illia:20160303150001-5
INSERT INTO
  public.user (birth_date, email, enabled, first_name, last_name, password, last_checkup_date)
VALUES ('2000-01-01', 'gusfring@devbridge.com', true, 'Gustavo', 'Fring', '$2a$10$3bdImFS4A5lQ8AwUBR/gvefWGLM0Swnyf7CxGw09xEweLcC2gDWOW', '2022-08-02');
-- rollback DELETE FROM public.user WHERE birth_date = '2000-01-01' AND email = 'gusfring@devbridge.com' AND enabled = true AND first_name = 'Gustavo' AND last_name = 'Fring' AND locked = false AND password = '$2a$10$3bdImFS4A5lQ8AwUBR/gvefWGLM0Swnyf7CxGw09xEweLcC2gDWOW';

-- changeset viktorija:20160303150000
INSERT INTO
  public.timeslots (start_time, end_time, service_provider_id)
VALUES ('2022-07-01 9:00:00', '2022-07-01 9:30:00', 1);
-- rollback DELETE FROM public.timeslots WHERE start_time = '2022-07-01 9:00:00' AND end_time = '2022-07-01 9:30:00' AND service_provider_id = 1;

-- changeset viktorija:20160303150001
INSERT INTO
  public.timeslots (start_time, end_time, service_provider_id)
VALUES ('2022-07-01 9:30:00', '2022-07-01 10:00:00', 1);
-- rollback DELETE FROM public.timeslots WHERE start_time = '2022-07-01 9:30:00' AND end_time = '2022-07-01 10:00:00' AND service_provider_id = 1;

-- changeset viktorija:20160303150002
INSERT INTO
  public.timeslots (start_time, end_time, service_provider_id)
VALUES ('2022-07-01 10:00:00', '2022-07-01 10:30:00', 1);
-- rollback DELETE FROM public.timeslots WHERE start_time = '2022-07-01 10:00:00' AND end_time = '2022-07-01 10:30:00' AND service_provider_id = 1;

-- changeset viktorija:20160303150003
INSERT INTO
  public.timeslots (start_time, end_time, service_provider_id)
VALUES ('2022-07-02 10:30:00', '2022-07-01 11:00:00', 1);
-- rollback DELETE FROM public.timeslots WHERE start_time = '2022-07-02 10:30:00' AND end_time = '2022-07-01 11:00:00' AND service_provider_id = 1;

-- changeset viktorija:20160303150004
INSERT INTO
  public.timeslots (start_time, end_time, service_provider_id)
VALUES ('2022-07-02 11:00:00', '2022-07-01 11:30:00', 1);
-- rollback DELETE FROM public.timeslots WHERE start_time = '2022-07-02 11:00:00' AND end_time = '2022-07-01 11:30:00' AND service_provider_id = 1 AND user_id = 1;

-- changeset illia:20160303150001-6
INSERT INTO
  public.roles (role)
VALUES (0);
-- rollback DELETE FROM public.role WHERE role = '0';

-- changeset illia:20160303150001-7
INSERT INTO
  public.roles (role)
VALUES (1);
-- rollback DELETE FROM public.role WHERE role = '1';

-- changeset illia:20160303150001-8
INSERT INTO
  public.roles (role)
VALUES (2);
-- rollback DELETE FROM public.role WHERE role = '2';

-- changeset illia:20160303150001-9
INSERT INTO
  public.user_roles (user_id, role_id)
VALUES (1, 1);
-- rollback DELETE FROM public.user_roles WHERE user_id = '1' AND role_id = '1';

-- changeset illia:20160303150001-10
INSERT INTO
  public.user_roles (user_id, role_id)
VALUES (1, 3);
-- rollback DELETE FROM public.user_roles WHERE user_id = '1' AND role_id = '3';

-- changeset illia:20160303150001-11
INSERT INTO
  public.user_roles (user_id, role_id)
VALUES (2, 2);
-- rollback DELETE FROM public.user_roles WHERE user_id = '2' AND role_id = '2';

-- changeset illia:20160303150001-12
INSERT INTO
  public.user_roles (user_id, role_id)
VALUES (2, 3);
-- rollback DELETE FROM public.user_roles WHERE user_id = '2' AND role_id = '3';

-- changeset illia:20160303150001-13
INSERT INTO
  public.user_roles (user_id, role_id)
VALUES (3, 3);
-- rollback DELETE FROM public.user_roles WHERE user_id = '3' AND role_id = '3';

-- changeset illia:20160303150001-14
INSERT INTO
  public.procedure (description, price, procedure_name, service_provider_id)
VALUES ('Small amount of blood taken', 1.75, 'Blood Sample', 1);
-- rollback DELETE FROM public.procedure WHERE description = 'Small amount of blood taken' AND price = 1.75 AND procedure_name = 'Blood Sample' AND service_provider_id = 1;

-- changeset illia:20160303150001-15
INSERT INTO
  public.procedure (description, price, procedure_name, service_provider_id)
VALUES ('One shot', 1.2, 'Injection', 1);
-- rollback DELETE FROM public.procedure WHERE description = 'One shot' AND price = 1.2 AND procedure_name = 'Injection' AND service_provider_id = 1;

-- changeset illia:20160303150001-16
INSERT INTO
  public.procedure (description, price, procedure_name, service_provider_id)
VALUES ('Double shot', 2.15, 'Vaccine', 1);
-- rollback DELETE FROM public.procedure WHERE description = 'Double shot' AND price = 2.15 AND procedure_name = 'Vaccine' AND service_provider_id = 1;

-- changeset illia:20160303150001-21
INSERT INTO
  public.timeslots (start_time, end_time, service_provider_id)
VALUES ('2022-07-02 12:00:00', '2022-07-01 12:30:00', 1);
-- rollback DELETE FROM public.timeslots WHERE start_time = '2022-07-02 12:00:00' AND end_time = '2022-07-01 12:30:00';

-- changeset illia:20160303150001-22
INSERT INTO
  public.timeslots (start_time, end_time, service_provider_id)
VALUES ('2022-08-11 14:30:00', '2022-08-11 15:00:00', 1);

-- changeset illia:20160303150001-23
INSERT INTO
  public.timeslots (start_time, end_time, service_provider_id)
VALUES ('2022-10-17 14:00:00', '2022-08-11 14:30:00', 1);

-- changeset illia:20160303150001-24
INSERT INTO
  public.timeslots (start_time, end_time, service_provider_id)
VALUES ('2022-12-21 16:00:00', '2022-12-21 16:30:00', 1);

-- changeset illia:20160303150001-25
INSERT INTO
  public.timeslots (start_time, end_time, service_provider_id)
VALUES ('2023-01-09 13:00:00', '2023-01-09 13:30:00', 1);

-- changeset illia:20160303150001-26
INSERT INTO
  public.appointment(timeslot_id, comment, user_id)
VALUES (6, 'july', 3);

-- changeset illia:20160303150001-27
INSERT INTO
  public.appointment(timeslot_id, comment, user_id)
VALUES (7, 'august', 3);

-- changeset illia:20160303150001-28
INSERT INTO
  public.appointment(timeslot_id, comment, user_id)
VALUES (8, 'october', 3);

-- changeset illia:20160303150001-29
INSERT INTO
  public.appointment(timeslot_id, comment, user_id)
VALUES (9, 'december', 3);

-- changeset illia:20160303150001-31
INSERT INTO
  public.appointment_procedures(appointment_id, procedure_id)
VALUES (1, 1);

-- changeset illia:20160303150001-32
INSERT INTO
  public.appointment_procedures(appointment_id, procedure_id)
VALUES (1, 3);

-- changeset illia:20160303150001-32-1
INSERT INTO
  public.appointment_procedures(appointment_id, procedure_id)
VALUES (2, 3);

-- changeset illia:20160303150001-32-2
INSERT INTO
  public.appointment_procedures(appointment_id, procedure_id)
VALUES (3, 3);

-- changeset illia:20160303150001-32-3
INSERT INTO
  public.appointment_procedures(appointment_id, procedure_id)
VALUES (4, 3);

-- changeset illia:20160303150001-32-4
INSERT INTO
  public.appointment_procedures(appointment_id, procedure_id)
VALUES (4, 3);
