-- liquibase formatted sql

-- changeset illia:20160303150001-1
INSERT INTO
  public.service_provider (id, company_name, email, password, phone_number, enabled)
VALUES (1, 'Anteja', 'anteja@gmail.com', '$2a$10$b7vfAo9ei7yRrYjyPWP6f.OWAoLkafP1RsEa2VNOMgFs4yxSOhkGS', '+37012345678', true);
-- rollback DELETE FROM public.service_provider WHERE company_name = 'Anteja' AND email = 'anteja@gmail.com' AND password = '$2a$10$b7vfAo9ei7yRrYjyPWP6f.OWAoLkafP1RsEa2VNOMgFs4yxSOhkGS' AND phone_number = '+37012345678' AND type = 'ANTEJA' AND enabled = true AND locked = false;

-- changeset illia:20160303150001-2
INSERT INTO
  public.service_provider (id, company_name, email, password, phone_number, enabled)
VALUES (2, 'Antakalnio Poliklinika', 'antakalnio@gmail.com', '$2a$10$VGU/8NUzqiv9CFDVjtZKSOULS8LBosvgp7mSFEhX6mWemh/zmTPxm', '+37012345678', true);
-- rollback DELETE FROM public.service_provider WHERE company_name = 'Antakalnio Poliklinika' AND email = 'antakalnio@gmail.com' AND password = '$2a$10$VGU/8NUzqiv9CFDVjtZKSOULS8LBosvgp7mSFEhX6mWemh/zmTPxm' AND phone_number = '+37012345678' AND type = 'ANTAKALNIS' AND enabled = true AND locked = false;

-- changeset illia:20160303150001-3
INSERT INTO
  public.user (id, birth_date, email, enabled, first_name, last_name, password)
VALUES (1, '2000-01-01', 'admin@devbridge.com', true, 'admin', 'admin', '$2a$10$8ik5BPs/em0F9BCnSELlgeTl1bwJmwlZEMlQdHwF9wsrCtDeOL4Eq');
-- rollback DELETE FROM public.user WHERE birth_date = '2000-01-01' AND email = 'admin@devbridge.com' AND enabled = true AND first_name = 'admin' AND last_name = 'admin' AND locked = false AND password = '$2a$10$8ik5BPs/em0F9BCnSELlgeTl1bwJmwlZEMlQdHwF9wsrCtDeOL4Eq';

--changeset illia:20160303150001-4
INSERT INTO
  public.user (id, birth_date, email, enabled, first_name, last_name, password)
VALUES (2, '2000-01-01', 'manager@devbridge.com', true, 'manager', 'manager', '$2a$10$5QD2a4gHR8kEmfutKr9uuOtBYqtAzpR8KmTv2NNOSREub7LE95nee');
-- rollback DELETE FROM public.user WHERE birth_date = '2000-01-01' AND email = 'manager@devbridge.com' AND enabled = true AND first_name = 'manager' AND last_name = 'manager' AND locked = false AND password = '$2a$10$5QD2a4gHR8kEmfutKr9uuOtBYqtAzpR8KmTv2NNOSREub7LE95nee';

--changeset illia:20160303150001-5
INSERT INTO
  public.user (id, birth_date, email, enabled, first_name, last_name, password)
VALUES (3, '2000-01-01', 'gusfring@devbridge.com', true, 'Gustavo', 'Fring', '$2a$10$3bdImFS4A5lQ8AwUBR/gvefWGLM0Swnyf7CxGw09xEweLcC2gDWOW');
-- rollback DELETE FROM public.user WHERE birth_date = '2000-01-01' AND email = 'gusfring@devbridge.com' AND enabled = true AND first_name = 'Gustavo' AND last_name = 'Fring' AND locked = false AND password = '$2a$10$3bdImFS4A5lQ8AwUBR/gvefWGLM0Swnyf7CxGw09xEweLcC2gDWOW';

-- changeset viktorija:20160303150000
INSERT INTO
  public.timeslots (id, start_time, end_time, service_provider_id)
VALUES (1, '2022-07-01 9:00:00', '2022-07-01 9:30:00', 1);
-- rollback DELETE FROM public.timeslots WHERE start_time = '2022-07-01 9:00:00' AND end_time = '2022-07-01 9:30:00' AND service_provider_id = 1;

-- changeset viktorija:20160303150001
INSERT INTO
  public.timeslots (id, start_time, end_time, service_provider_id)
VALUES (2, '2022-07-01 9:30:00', '2022-07-01 10:00:00', 1);
-- rollback DELETE FROM public.timeslots WHERE start_time = '2022-07-01 9:30:00' AND end_time = '2022-07-01 10:00:00' AND service_provider_id = 1;

-- changeset viktorija:20160303150002
INSERT INTO
  public.timeslots (id, start_time, end_time, service_provider_id)
VALUES (3, '2022-07-01 10:00:00', '2022-07-01 10:30:00', 1);
-- rollback DELETE FROM public.timeslots WHERE start_time = '2022-07-01 10:00:00' AND end_time = '2022-07-01 10:30:00' AND service_provider_id = 1;

-- changeset viktorija:20160303150003
INSERT INTO
  public.timeslots (id, start_time, end_time, service_provider_id)
VALUES (4, '2022-07-02 10:30:00', '2022-07-01 11:00:00', 1);
-- rollback DELETE FROM public.timeslots WHERE start_time = '2022-07-02 10:30:00' AND end_time = '2022-07-01 11:00:00' AND service_provider_id = 1;

-- changeset viktorija:20160303150004
INSERT INTO
  public.timeslots (id, start_time, end_time, service_provider_id)
VALUES (5, '2022-07-02 11:00:00', '2022-07-01 11:30:00', 1);
-- rollback DELETE FROM public.timeslots WHERE start_time = '2022-07-02 11:00:00' AND end_time = '2022-07-01 11:30:00' AND service_provider_id = 1 AND user_id = 1;

-- changeset illia:20160303150001-6
INSERT INTO
  public.roles (id, role)
VALUES (1, 0);
-- rollback DELETE FROM public.role WHERE role = '0';

-- changeset illia:20160303150001-7
INSERT INTO
  public.roles (id, role)
VALUES (2, 1);
-- rollback DELETE FROM public.role WHERE role = '1';

-- changeset illia:20160303150001-8
INSERT INTO
  public.roles (id, role)
VALUES (3, 2);
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
  public.procedure (id, description, price, procedure_name, service_provider_id)
VALUES (1, 'Small amount of blood taken', 1.75, 'Blood Sample', 1);
-- rollback DELETE FROM public.procedure WHERE description = 'Small amount of blood taken' AND price = 1.75 AND procedure_name = 'Blood Sample' AND service_provider_id = 1;

-- changeset illia:20160303150001-15
INSERT INTO
  public.procedure (id, description, price, procedure_name, service_provider_id)
VALUES (2, 'One shot', 1.2, 'Injection', 1);
-- rollback DELETE FROM public.procedure WHERE description = 'One shot' AND price = 1.2 AND procedure_name = 'Injection' AND service_provider_id = 1;

-- changeset illia:20160303150001-16
INSERT INTO
  public.procedure (id, description, price, procedure_name, service_provider_id)
VALUES (3, 'Double shot', 2.15, 'Vaccine', 1);
-- rollback DELETE FROM public.procedure WHERE description = 'Double shot' AND price = 2.15 AND procedure_name = 'Vaccine' AND service_provider_id = 1;

-- changeset illia:20160303150001-21
INSERT INTO
  public.timeslots (id, start_time, end_time, service_provider_id)
VALUES (6, '2022-07-02 12:00:00', '2022-07-01 12:30:00', 2);
-- rollback DELETE FROM public.timeslots WHERE start_time = '2022-07-02 12:00:00' AND end_time = '2022-07-01 12:30:00';

-- changeset illia:20160303150001-24
INSERT INTO
  public.appointment(timeslot_id, comment, user_id)
VALUES (1, 'this is a test comment', 3);

-- changeset illia:20160303150001-25
INSERT INTO
  public.appointment_procedures(appointment_id, procedure_id)
VALUES (1, 1);

-- changeset illia:20160303150001-26
INSERT INTO
  public.appointment_procedures(appointment_id, procedure_id)
VALUES (1, 3);

