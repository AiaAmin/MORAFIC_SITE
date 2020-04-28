CREATE USER morafik909 WITH SUPERUSER PASSWORD 'morafik909';
CREATE  DATABASE  MorafikSite WITH OWNER =morafik909;
DROP TABLE IF EXISTS sighted_languages;
DROP TABLE IF EXISTS services_sighted;
DROP TABLE IF EXISTS sighted_skills;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS meetings;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS districts;
DROP TABLE IF EXISTS service_times;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS languages;
DROP TABLE IF EXISTS services;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS sighted_people;
DROP TABLE IF EXISTS blinds;
DROP TABLE IF EXISTS cities;
------------------------------------------------
CREATE TABLE cities(
    creation_user INT NOT NULL ,
    creation_date date,
    modify_user INT ,
    modify_date date,
    city_id INT PRIMARY KEY NOT NULL,
    city_name VARCHAR(50)
);
CREATE TABLE blinds(
    creation_user INT NOT NULL,
    creation_date date,
    modify_user INT ,
    modify_date date,
    blind_id INT PRIMARY KEY,
    medical_report VARCHAR(450)
--     user_id INT REFERENCES users(users_id)--one to one
);
CREATE TABLE sighted_people(
    creation_user INT NOT NULL ,
    creation_date date,
    modify_user INT ,
    modify_date date,
    sighted_id INT PRIMARY KEY NOT NULL,
    vehicle_type INT,
    plat_num VARCHAR(45),
    treat_or_not BOOLEAN
--     user_id INT REFERENCES users(users_id) --one to one
);
CREATE TABLE skills(
    creation_user INT NOT NULL ,
    creation_date date,
    modify_user INT ,
    modify_date date,
    id_skills INT PRIMARY KEY NOT NULL,
    name_skills VARCHAR(100)
);
CREATE TABLE services(
    creation_user INT NOT NULL,
    creation_date date,
    modify_user INT ,
    modify_date date,
    id_service INT PRIMARY KEY NOT NULL ,
    name_service VARCHAR(100)
);
CREATE TABLE languages(
    creation_user INT NOT NULL ,
    creation_date date,
    modify_user INT ,
    modify_date date,
    id_language INT PRIMARY KEY NOT NULL ,
    name_language VARCHAR(100)
--     sighted_id INT REFERENCES sighted_people(s)
);
CREATE TABLE jobs(
    creation_user INT NOT NULL,
    creation_date date,
    modify_user INT ,
    modify_date date,
    id_job INT PRIMARY KEY NOT NULL ,
    name_job VARCHAR(100)
);
-----------------------------------
CREATE TABLE service_times(
    creation_user INT NOT NULL,
    creation_date date,
    modify_user INT ,
    modify_date date,
    service_time INT PRIMARY KEY NOT NULL,
    serviceTime_id INT,
    service_from date,
    sighted_id INT REFERENCES sighted_people(sighted_id)
);
CREATE TABLE districts(
    creation_user INT NOT NULL ,
    creation_date date,
    modify_user INT ,
    modify_date date,
    district_id INT PRIMARY KEY NOT NULL ,
    district_name VARCHAR(45),
    city_id INT REFERENCES cities(city_id)
);
CREATE TABLE posts(
    creation_user INT NOT NULL ,
    creation_date date,
    modify_user INT ,
    modify_date date,
    post_id INT PRIMARY KEY NOT NULL ,
    posts_title VARCHAR(45),
    post_content VARCHAR(1000),
    post_link VARCHAR(200),
    status BOOLEAN,
    blind_id INT REFERENCES blinds(blind_id)

);
CREATE TABLE meetings(
    creation_user INT NOT NULL ,
    creation_date date,
    modify_user INT ,
    modify_date date,
    meeting_id INT PRIMARY KEY NOT NULL ,
    blind_rate INT ,
    date_start TIME,--
    date_end TIME,
    place VARCHAR(45),
    blind_comment VARCHAR(450),
    sighted_comment VARCHAR(450),
    blind_id INT REFERENCES blinds(blind_id),
    sighted_id INT REFERENCES sighted_people(sighted_id),
    service_id INT REFERENCES services(id_service),
    cities_id INT REFERENCES cities(city_id)
);
CREATE TABLE users(
    creation_user INT NOT NULL ,
    creation_date date,
    modify_user INT ,
    modify_date date,
    users_id INT PRIMARY KEY NOT NULL ,
    users_name VARCHAR(250),
    users_email VARCHAR(50) UNIQUE NOT NULL ,
    users_phone VARCHAR(20),
    users_photo VARCHAR(300),
    users_gender BOOLEAN,
    user_birthdate date,
    personal_card VARCHAR(1000),
    pasword VARCHAR(30),
    user_type INT,
    ex_address VARCHAR(250),
    job_id INT REFERENCES jobs(id_job),
    district_id  INT REFERENCES districts(district_id),
    city_id INT REFERENCES cities(city_id)

);
----------------------------------------
CREATE TABLE sighted_skills(
    id INT primary key not null,
    sighted_id INT REFERENCES sighted_people(sighted_id),
    skills_id INT REFERENCES  skills(id_skills)
);
CREATE TABLE services_sighted(
    id INT PRIMARY KEY NOT NULL,
    services_id INT REFERENCES services(id_service),
    sighted_id INT REFERENCES sighted_people(sighted_id)
);
CREATE TABLE sighted_languages(
    id INT PRIMARY KEY ,
    sighted_id INT REFERENCES sighted_people(sighted_id),
    languages_id INT REFERENCES languages(id_language)
);


