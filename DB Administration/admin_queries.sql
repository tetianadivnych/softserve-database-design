--query statements for creation of 2 roles;
create role manager;
create role doctor;
create role username1 login password 'pass1' ;
create role username2 login password 'pass2';

--queries to grant access
grant all on schema public to manager;
grant update on examinations to doctor;
grant insert on examinations to doctor;
grant update on hospitalizations to doctor;
grant insert on hospitalizations to doctor;

--query statements for assignment users to this roles;
grant manager to username1;
grant doctor to username2;

--queries for creation of DML triggers

--function1
create or replace function department_head_update_audit()
    returns trigger as
$$
begin
    insert into department_heads_audit (department_name,
                                        department_head_id,
                                        department_head_name,
                                        action)
    select new.department_name,
           new.department_head_id,
           concat(doc.first_name, ' ', doc.last_name),
           'U'
    from doctors doc
    where doc.doctor_id = new.department_head_id;
    return new;
end;
$$ language plpgsql;

--trigger1
create or replace trigger department_head_update_audit
    after update
    on departments
    for each row
    when (old.department_head_id is distinct from new.department_head_id)
execute function department_head_update_audit();

--function2
create or replace function placements_delete_audit()
    returns trigger as
$$
begin
    insert into placements_audit(placement_id, room_number, unit, floor, action)
    values (old.placement_id,
            old.room_number,
            old.unit,
            old.floor,
            'D');
    return old;
end;
$$ language plpgsql;

--trigger2
create or replace trigger placements_delete_audit
    before delete
    on placements
    for each row
execute function placements_delete_audit();
