-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT
    *
FROM
    `students`
    JOIN `degrees` ON `students`.`degree_id` = `degrees`.`id`
WHERE
    `degrees`.`name` = "Corso di Laurea in Economia";

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT
    *
FROM
    `degrees`
    JOIN `departments` ON `degrees`.`department_id` = `departments`.`id`
WHERE
    `departments`.`name` = "Dipartimento di Neuroscienze"
    AND `degrees`.`level` = "Magistrale";

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT
    `courses`.`id`,
    `courses`.`name`,
    `teachers`.`name`,
    `teachers`.`surname`
FROM
    `courses`
    JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id`
    JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.id
WHERE
    `teachers`.`id` = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT
    *
FROM
    `students`
    JOIN `degrees` ON `students`.`degree_id` = `degrees`.`id`
    JOIN `departments` ON `degrees`.`department_id` = `departments`.id
ORDER BY
    `students`.`surname`,
    `students`.`name`;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT
    *
FROM
    `degrees`
    JOIN `courses` ON `degrees`.`id` = `courses`.`degree_id`
    JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id`
    JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`;

--- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT
    DISTINCT `teachers`.`name`,
    `teachers`.`surname`
FROM
    `teachers`
    JOIN `course_teacher` ON `teachers`.`id` = `course_teacher`.`teacher_id`
    JOIN `courses` ON `course_teacher`.`course_id` = `courses`.id
    JOIN `degrees` ON `courses`.`degree_id` = `degrees`.`id`
    JOIN `departments` ON `degrees`.`department_id` = `departments`.`id`
WHERE
    `departments`.`name` = "Dipartimento di Matematica";

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
SELECT
    `students`.`name` AS "nome_studenti",
    `students`.`surname` AS "cognome",
    `courses`.`name`,
    `exam_student`.`vote`
FROM
    `students`
    JOIN `exam_student` ON `students`.`id` = `exam_student`.`student_id`
    JOIN `exams` ON `exam_student`.`exam_id` = `exams`.`id`
    JOIN `courses` ON `exams`.`course_id` = `courses`.`id`
GROUP BY
    `students`.`name`,
    `students`.`surname`,
    `courses`.`name`,
    `exam_student`.`vote`
HAVING
    `exam_student`.`vote` >= 18;