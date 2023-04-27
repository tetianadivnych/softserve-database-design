CREATE TABLE "departments" (
                               "department_id" serial PRIMARY KEY,
                               "department_name" varchar not null,
                               "department_head_id" integer unique
);

CREATE TABLE "doctors" (
                           "doctor_id" serial PRIMARY KEY,
                           "first_name" varchar not null,
                           "last_name" varchar not null,
                           "specialization" varchar not null,
                           "phone_number" varchar,
                           "department_id" integer
);

CREATE TABLE "examinations" (
                                "examination_id" serial PRIMARY KEY,
                                "symptoms_description" text,
                                "diagnosis" varchar not null,
                                "diagnosis_date" date not null,
                                "doctor_id" integer not null,
                                "hospitalization_id" integer not null
);

CREATE TABLE "hospitalizations" (
                                    "hospitalization_id" serial PRIMARY KEY,
                                    "initial_diagnosis" varchar,
                                    "start_date" date not null,
                                    "end_date" date,
                                    "doctor_id" integer,
                                    "patient_id" integer not null,
                                    "placement_id" integer
);

CREATE TABLE "placements" (
                              "placement_id" serial PRIMARY KEY,
                              "room_number" integer not null,
                              "unit" varchar not null,
                              "floor" integer not null
);

CREATE TABLE "patients" (
                            "patient_id" serial PRIMARY KEY,
                            "first_name" varchar not null,
                            "last_name" varchar not null,
                            "birth_date" date not null,
                            "phone_number" varchar,
                            "email" varchar unique not null
);


CREATE TABLE department_heads_audit
(
    department_name      varchar not null,
    department_head_id   integer,
    audit_date           timestamp  default now(),
    department_head_name varchar,
    action               varchar(1)
);

CREATE TABLE placements_audit
(
    placement_id integer,
    action       varchar(1),
    audit_date   timestamp  default now(),
    room_number  integer,
    unit         varchar,
    floor        integer
);


ALTER TABLE "departments" ADD FOREIGN KEY ("department_head_id") REFERENCES "doctors" ("doctor_id");

ALTER TABLE "doctors" ADD FOREIGN KEY ("department_id") REFERENCES "departments" ("department_id");

ALTER TABLE "examinations" ADD FOREIGN KEY ("doctor_id") REFERENCES "doctors" ("doctor_id");

ALTER TABLE "examinations" ADD FOREIGN KEY ("hospitalization_id") REFERENCES "hospitalizations" ("hospitalization_id");

ALTER TABLE "hospitalizations" ADD FOREIGN KEY ("doctor_id") REFERENCES "doctors" ("doctor_id");

ALTER TABLE "hospitalizations" ADD FOREIGN KEY ("patient_id") REFERENCES "patients" ("patient_id");

ALTER TABLE "hospitalizations" ADD FOREIGN KEY ("placement_id") REFERENCES "placements" ("placement_id");

ALTER TABLE department_heads_audit owner to postgres;

ALTER TABLE placements_audit owner to postgres;
