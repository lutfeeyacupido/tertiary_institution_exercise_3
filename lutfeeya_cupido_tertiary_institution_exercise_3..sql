CREATE SCHEMA `exercise3_week2` ;

CREATE TABLE `exercise3_week2`.`students` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `major` VARCHAR(100) NOT NULL,
  `year_of_study` INT NOT NULL,
  PRIMARY KEY (`student_id`));

INSERT INTO `exercise3_week2`.`students` (`student_id`, `name`, `major`, `year_of_study`) VALUES ('1', 'Alice Johnson', 'Computer Scienc', '2');
INSERT INTO `exercise3_week2`.`students` (`student_id`, `name`, `major`, `year_of_study`) VALUES ('2', 'Bob Smith', 'Mechanical Engineering', '3');
INSERT INTO `exercise3_week2`.`students` (`student_id`, `name`, `major`, `year_of_study`) VALUES ('3', 'Charlie Brown', 'Business Adminstration', '3');

CREATE TABLE `exercise3_week2`.`courses` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(100) NOT NULL,
  `department` VARCHAR(100) NOT NULL,
  `credits` INT NOT NULL,
  PRIMARY KEY (`course_id`));
  
  INSERT INTO `exercise3_week2`.`courses` (`course_id`, `course_name`, `department`, `credits`) VALUES ('101', 'Introduction to Programming', 'Computer Science', '3');
INSERT INTO `exercise3_week2`.`courses` (`course_id`, `course_name`, `department`, `credits`) VALUES ('102', 'Thermodynamics', 'Mechanical Engineering', '4');
INSERT INTO `exercise3_week2`.`courses` (`course_id`, `course_name`, `department`, `credits`) VALUES ('103', 'Marketing 101', 'Business Adminstration', '3');

CREATE TABLE `exercise3_week2`.`enrollments` (
  `enrollment_id` INT NOT NULL AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `enrollment_date` DATE NULL,
  PRIMARY KEY (`enrollment_id`));

INSERT INTO `exercise3_week2`.`enrollments` (`enrollment_id`, `student_id`, `course_id`, `enrollment_date`) VALUES ('1', '1', '101', '2023-09-01');
INSERT INTO `exercise3_week2`.`enrollments` (`enrollment_id`, `student_id`, `course_id`, `enrollment_date`) VALUES ('2', '2', '102', '2023-09-01');
INSERT INTO `exercise3_week2`.`enrollments` (`enrollment_id`, `student_id`, `course_id`, `enrollment_date`) VALUES ('3', '3', '103', '2023-09-01');
INSERT INTO `exercise3_week2`.`enrollments` (`enrollment_id`, `student_id`, `course_id`, `enrollment_date`) VALUES ('4', '1', '103', '2023-09-01');

-- write query that joins students, enrollments and courses tables --
SELECT students.student_id, 
	   students.name,
       students.major,
       students.year_of_study
FROM students INNER JOIN enrollments 
	ON students.student_id = enrollments.student_id
INNER JOIN courses
	ON enrollments.course_id = courses_course_id;
    
-- select student name, course names, and enrollment dates --
SELECT students.name, 
	   courses.course_name,
       enrollments.enrollment_date
FROM students INNER JOIN enrollments
	ON students.student_id = enrollments.student_id 
INNER JOIN courses
	ON enrollments.course_id = courses.course_id;
    
-- sort the results by enrollment_date in decending order --
SELECT students.name AS student_name
	   courses.course_name,
       enrollments.enrollment_date
FROM students INNER JOIN enrollments
	ON students.student_id =enrollments.student_id
INNER JOIN courses 
	ON enrollments.course_id = courses.course_id
ORDER BY enrollments.enrollment_date DESC;

-- use both INNER JOIN and LEFT JOIN as needed to connect the table --
SELECT students.name AS student_name,
	   courses.course_name,
       enrollments.enrollment_date
FROM students INNER JOIN enrollments
	ON students.student_id = enrollments.student_id
LEFT JOIN courses
	ON enrollments.course_id = courses.course_id
ORDER BY enrollments.enrollment_date DESC;
