-- 1. Contare quanti iscritti ci sono stati ogni anno;
SELECT
    COUNT(`id`) AS "studenti_iscritti",
    `students`.`enrolment_date`
FROM
    `students`
GROUP BY
    `enrolment_date`;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT
    COUNT(`teachers`.`id`) AS "docenti_stesso_indirizzo",
    `teachers`.`office_address`
FROM
    `teachers`
GROUP BY
    `teachers`.`office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT
    COUNT(`exams`.id) AS "numero_di_appelli",
    `exams`.date,
    AVG(`exam_student`.`vote`) AS "media"
FROM
    `exam_student`
    JOIN `exams` ON `exam_student`.`exam_id` = `exams`.`id`
GROUP BY
    `exams`.`date`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT
    COUNT(`degrees`.`id`) AS "numero_di_corsi",
    `departments`.`name`
FROM
    `degrees`
    JOIN `departments` ON `degrees`.`department_id` = `departments`.id
GROUP BY
    `departments`.`name`;