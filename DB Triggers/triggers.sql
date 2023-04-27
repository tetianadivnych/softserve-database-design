--Write script and upload the file with 3 queries for creation of DML triggers.

--function1
create or replace function placements_insert_audit()
returns trigger as
    $$
    begin
        insert into placements_audit(placement_id, room_number, unit, floor, action)
        values (new.placement_id,
                new.room_number,
                new.unit,
                new.floor,
                'I');
        return new;
    end;
    $$ language plpgsql;

--trigger1
create or replace trigger placements_insert_audit
    after insert
    on placements
    for each row
execute function placements_insert_audit();

--function2
create or replace function placements_update_audit()
returns trigger as
    $$
    begin
        insert into placements_audit(placement_id, room_number, unit, floor, action)
        values (new.placement_id,
                new.room_number,
                new.unit,
                new.floor,
                'U');
        return new;
    end;
    $$ language plpgsql;

--trigger2
create or replace trigger placements_update_audit
    after update
    on placements
    for each row
    execute function placements_update_audit();

--function3
create or replace function department_heads_insert_audit()
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
               'I'
        from doctors doc
        where doc.doctor_id = new.department_head_id;
        return new;
    end;
    $$ language plpgsql;

--trigger3
create or replace trigger department_heads_insert_audit
    after insert
    on departments
    for each row
    execute function department_heads_insert_audit();
