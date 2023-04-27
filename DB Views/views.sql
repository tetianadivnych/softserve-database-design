--horizontal view
create or replace view doctors_surgeons
as
select *
from doctors d
where lower(d.specialization) like '%surgeon%';

--vertical view
create or replace view diagnosis_by_symptoms
as
select e.symptoms_description,
       e.diagnosis
from examinations e;

--mixed view
create or replace view doctors_from_gastroenterology
as
select d.first_name,
       d.last_name,
       d.specialization,
       d2.department_name
from doctors d
         inner join departments d2 on d.department_id = d2.department_id
where lower(d2.department_name) like 'gastroenterology';

--view with join
create or replace view patient_placement_details
as
select p2.first_name,
       p2.last_name,
       p.unit,
       p.floor,
       p.room_number
from placements p
         inner join hospitalizations h on p.placement_id = h.placement_id
         inner join patients p2 on h.patient_id = p2.patient_id;

--view with join
create or replace view patients_with_asthma
as
select p.first_name,
       p.last_name,
       e.diagnosis
from patients p
         inner join hospitalizations h on p.patient_id = h.patient_id
         inner join examinations e on h.hospitalization_id = e.hospitalization_id
where lower(e.diagnosis) like '%asthma%'
group by p.first_name, p.last_name, e.diagnosis;

--view with subguery
create or replace view leading_doctors_details
as
select d.doctor_id,
       d.first_name,
       d.last_name,
       d.specialization
from doctors d
where d.doctor_id in (select h.doctor_id
                      from hospitalizations h);

--view with union
create or replace view patients_and_doctors_last_names
as
(select p.last_name
 from patients p)
union
(select d.last_name
 from doctors d);

--view on the select from another one view
create or replace view surgeons_names
as
select ds.first_name,
       ds.last_name
from doctors_surgeons ds;

--view with check option
create or replace view examinations_with_gastritis_diagnosis
as
select e.symptoms_description,
       e.diagnosis,
       e.diagnosis_date,
       e.doctor_id,
       e.hospitalization_id
from examinations e
where lower(e.diagnosis) like '%gastritis%'
with check option;
