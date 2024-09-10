-- 1. 사원 정보테이블에 자신의 정보를 적절하게 넣어주세요.
INSERT INTO employees(
	NAME
	,birth
	,gender
	,hire_at
)
VALUES (
	'강태희'
	,'1988-08-07'
	,'F'
	,date(NOW())
);

-- 2. 월급, 직급, 소속부서 테이블에 자신의 정보를 적절하게 넣어주세요.
INSERT INTO salaries(
	emp_id
	,salary
	,start_at
)
VALUES (
	100001
	,50000000
	,date(NOW())
);
	
INSERT INTO title_emps(
	emp_id
	,title_code
	,start_at
)
VALUES (
	100001
	,'t005'
	,date(NOW())
);

INSERT INTO department_emps(
	emp_id
	,dept_code
	,start_at
)
VALUES (
	100001
	,'d003'
	,date(NOW())
);

-- 3. 짝궁의 것도 넣어주세요.
INSERT INTO employees(
	NAME
	,birth
	,gender
	,hire_at
	,fire_at
	,sup_id
	,created_at
	,updated_at
	,deleted_at
)
VALUES (
	'최시나'
	,'1985-12-24'
	,'F'
	,date(NOW())
	,NULL
	,NULL
	,NOW()
	,NOW()
	,NULL
	);

INSERT INTO salaries(
	emp_id
	,salary
	,start_at
)
VALUES (
	100002
	,55000000
	,date(NOW())
);
	
INSERT INTO title_emps(
	emp_id
	,title_code
	,start_at
	,end_at
)
VALUES (
	100002
	,'t006'
	,date(NOW())
	,NULL
);

INSERT INTO department_emps(
	emp_id
	,dept_code
	,start_at
	,end_at
)
VALUES (
	100002
	,'d007'
	,date(NOW())
	,NULL
);

-- 4. 나와 짝궁의 소속 부서를 D009로 변경해 주세요.
UPDATE department_emps
SET 
	end_at = date(NOW())
	 ,updated_at = NOW()
WHERE emp_id IN (100001)
	AND end_at IS NULL 
;
	
INSERT INTO department_emps(
	emp_id 
	,dept_code
	,start_at
)
VALUES (
	100002
	,'d009'
	,date(NOW())
);

-- 5. 짝궁의 모든 정보를 삭제해 주세요.
DELETE FROM salaries WHERE emp_id = 100002;
DELETE FROM department_emps WHERE emp_id = 100002;
DELETE FROM title_emps WHERE emp_id = 100002;
DELETE FROM employees WHERE emp_id = 100002;
-- 하위테이블부터 삭제해야된다. 

-- 6. 'D009'부서의 관리자를 나로 변경해 주세요.
UPDATE department_managers
SET 
	end_at = date(NOW())
	 ,updated_at = NOW()
WHERE 
	dept_code = 'D009'
		AND end_at IS NULL 
;
	
INSERT INTO department_managers(
	emp_id 
	,dept_code
	,start_at
)
VALUES (
	100001
	,'D009'
	,date(NOW())
);

-- 7. 오늘 날짜부로 나의 직책을 '대리'로 변경해 주세요.
UPDATE title_emps
SET end_at = DATE(NOW())
WHERE emp_id = 100001
AND end_at IS NULL;

INSERT INTO title_emps(
	emp_id,
	title_code,
	start_at,
	created_at,
	updated_at
)
VALUES(
	100001,
	'T002',
	DATE(NOW()),
	NOW(),
	NOW()
);
-- 8. 최저 연봉 사원의 사번과 이름, 연봉을 출력해 주세요.
SELECT 
	employees.emp_id
	, employees.name
	, salaries.salary
	from employees
	JOIN salaries
	ON employees.emp_id=salaries.emp_id
	AND salaries.end_at IS null
	AND salaries.salary = (
		SELECT 
		MIN(salary) 
		FROM salaries 
		WHERE 
		end_at IS NULL 
	)
;


-- 9. 전체 사원의 평균 연봉을 출력해 주세요.
SELECT
	avg(salaries.salary)
FROM salaries
WHERE 
	end_at IS NULL 
;
-- 10. 사번이 54321인 사원의 지금까지 평균 연봉을 출력해 주세요.
SELECT 
	avg(salaries.salary) avg_sal
	FROM salaries
	WHERE 
	emp_id = 54321
	GROUP BY salaries.emp_id
	;
	
	
	- 11.
CREATE DATABASE examDB;
USE examdb;

CREATE TABLE users(
	userid INT(10) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(30) NOT NULL,
	authflg CHAR(1) DEFAULT '0',
	birthday DATE NOT NULL,
	created_at DATETIME DEFAULT CURRENT_DATE()
);

-- 12.
INSERT INTO users (
	username,
	birthday
)
VALUES(
	'그린',
	'2024-01-26'
);

-- 13. 
UPDATE users
SET username = '테스터',
	authflg = '1',
	birthday = '2007-03-01'
WHERE userid = 1
;

-- 14.
DELETE FROM users
WHERE userid = 1
;

-- 15.
ALTER TABLE users ADD COLUMN 
	addr VARCHAR(100) NOT NULL DEFAULT '-'
;

-- 16.
DROP TABLE users;

-- 17.

SELECT users.username, users.birthday, rankmanagement.rankname
FROM users
	JOIN rankmanagement
	ON users.userid = rankmanagement.userid
;