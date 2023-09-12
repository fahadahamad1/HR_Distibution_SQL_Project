SELECT * FROM hr;

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

DESCRIBE hr;

SELECT birthdate
FROM hr;

UPDATE hr 
SET birthdate = CASE
					WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
					WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
                ELSE NULL 
END;  

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

SELECT birthdate
FROM hr;

UPDATE hr 
SET hire_date = CASE 
				    WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
				    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
				ELSE NULL
END;  

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

SELECT hire_date
FROM hr;

SELECT termdate
FROM hr;

UPDATE hr
SET termdate = '0000-00-00'
WHERE termdate = '00-00-0000';

UPDATE hr
SET termdate = CASE
				   WHEN termdate = '0000-00-00' THEN NULL
               ELSE STR_TO_DATE(termdate, '%Y-%m-%d')
  END;

alter table hr
modify column termdate date;

update hr
set termdate = '0000-00-00'
where termdate is null;

ALTER TABLE hr MODIFY termdate DATE NULL;

UPDATE hr
SET termdate = NULL
WHERE termdate IS NULL;

UPDATE hr
SET termdate = '9999-12-31'
WHERE termdate IS NULL;

ALTER TABLE hr ADD COLUMN age INT;

UPDATE hr
SET age = TIMESTAMPDIFF(YEAR,birthdate,CURDATE());

SELECT 
min(age) AS youngest,
max(age) AS oldest
FROM hr;

SELECT count(*) FROM hr
WHERE age < 18;

SELECT * FROM hr;

