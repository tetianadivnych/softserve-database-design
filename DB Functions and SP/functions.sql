--create 3 functions;

--function1
create or replace function public.countpatients()
    returns integer as
$$
begin
    return (
        select count(p.patient_id)
        from patients p
    );
end;
$$ language plpgsql;

--function2
create or replace function public.countdoctors()
    returns integer as
$$
begin
    return (
        select count(d.doctor_id)
        from doctors d
    );
end;
$$ language plpgsql;

--function3
create or replace function public.countdepartments()
    returns integer as
$$
begin
    return (
        select count(d.department_id)
        from departments d
    );
end;
$$ language plpgsql;

--create 2 stored procedures with select statement;

--with select statement1
create or replace function get_patients_from_hospitalizations()
    returns table (
                      patient_id integer,
                      first_name varchar,
                      last_name varchar,
                      birth_date date,
                      phone_number varchar,
                      email varchar
                  ) as $$
begin
    return query
        select patients.patient_id,
               patients.first_name,
               patients.last_name,
               patients.birth_date,
               patients.phone_number,
               patients.email
        from hospitalizations
                 join patients on hospitalizations.patient_id = patients.patient_id;
end;
$$ language plpgsql;

--with select statement2
create or replace function get_doctors_with_patients()
    returns table (
                      doctor_id integer,
                      first_name varchar,
                      last_name varchar,
                      specialization varchar,
                      phone_number varchar,
                      department_id integer,
                      patient_id integer,
                      patient_first_name varchar,
                      patient_last_name varchar,
                      patient_birth_date date,
                      patient_phone_number varchar,
                      patient_email varchar
                  ) as $$
begin
    return query
        select doctors.doctor_id,
               doctors.first_name,
               doctors.last_name,
               doctors.specialization,
               doctors.phone_number,
               doctors.department_id,
               patients.patient_id,
               patients.first_name as patient_first_name,
               patients.last_name as patient_last_name,
               patients.birth_date as patient_birth_date,
               patients.phone_number as patient_phone_number,
               patients.email as patient_email
        from doctors
                 join hospitalizations on hospitalizations.doctor_id = doctors.doctor_id
                 join patients on hospitalizations.patient_id = patients.patient_id;
end;
$$ language plpgsql;

select * from get_doctors_with_patients();
select * from get_patients_from_hospitalizations();

--create 2 stored procedures with insert statement;

--with insert statement1
create or replace procedure insert_placement(
    p_room_number integer,
    p_unit varchar,
    p_floor integer
)
as $$
begin
    insert into placements (room_number, unit, floor)
    values (p_room_number, p_unit, p_floor);
end;
$$ language plpgsql;

call insert_placement(101, 'icu', 5);

--with insert statement2
create or replace procedure insert_department(
d_department_name varchar
)
as $$begin
    insert into departments(department_name)
    values (d_department_name);
end;
$$ language plpgsql;

call insert_department('radiotherapy');
