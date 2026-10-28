
DROP ROLE IF EXISTS teacher_role;
DROP ROLE IF EXISTS student_role;
DROP USER IF EXISTS teacher_ivanov;
DROP USER IF EXISTS student_petrov;


CREATE ROLE teacher_role;
CREATE ROLE student_role;
CREATE USER teacher_ivanov WITH PASSWORD 'secure_password_1';
CREATE USER student_petrov WITH PASSWORD 'secure_password_2';


GRANT teacher_role TO teacher_ivanov;
GRANT student_role TO student_petrov;


GRANT SELECT ON students TO teacher_role;
GRANT SELECT ON lessons TO teacher_role;
GRANT SELECT ON groups TO teacher_role;
GRANT SELECT ON disciplines TO teacher_role;


CREATE OR REPLACE VIEW v_my_grades AS 
SELECT 
    gr.grade_id,
    s.student_id,
    d.discipline_name,
    gr.grade,
    gr.grade_date
FROM grades gr
JOIN students s ON gr.student_id = s.student_id
JOIN disciplines d ON gr.discipline_id = d.discipline_id;

GRANT SELECT ON v_my_grades TO student_role;