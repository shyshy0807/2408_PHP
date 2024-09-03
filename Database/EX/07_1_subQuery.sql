-- WHERE 절 사용하는 subQuery
-- D001부서장의 사번과 이름을 출력

SELECT 
	employees.emp_id
	,employees.NAME
FROM employees
WHERE 
	employees.emp_id = (
	SELECT 
	department_managers.emp_id
	FROM department_managers
	WHERE 
 	department_managers.end_at IS NULL
 	AND department_managers.dept_code = 'D001'
	)
;
/*
emp_id가 누군건지 구분해줘야됨 
사번을 알고 그걸 괄호안에 넣어서 이름을 구해야되
*/
-- 서버쿼리가 그 결과가 SELECT랑 같은 같으니 
-- WHERE절 쿼리랑 일치해야됩니다. 

-- 전체부서장의 사번과 이름 출력
SELECT 
	employees.emp_id
	,employees.name
FROM employees
WHERE 
	employees.emp_id IN (
	SELECT department_managers.emp_id
	FROM department_managers
	WHERE 
 	department_managers.end_at IS NULL
	)
;
-- 이럴때 IN 연산자 쓰면 다중행 조회됩니다.

-- 현재 직책이 T006 사원의 사번과 이름, 생일을 출력해주세요. 
SELECT 
	employees.emp_id
	,employees.NAME
	,employees.birth
FROM employees
WHERE 
	employees.emp_id IN (
	SELECT 	title_emps.emp_id
	FROM title_emps
	WHERE 
 		title_emps.end_at IS NULL
 	AND title_emps.title_code = 'T006'
	)
;

-- 현재 D002의 부서장이 해당 부서에 소속된 날짜 출력 

SELECT 
	department_emps.*
FROM department_emps
WHERE 
	(department_emps.emp_id, department_emps.dept_code) IN (
		SELECT 
			department_managers.emp_id
			, department_managers.dept_code
		FROM department_managers
		WHERE
		 		department_managers.end_at IS NULL
		  AND department_managers.dept_code = 'D002'
 	)
;


-- 연관서브쿼리
SELECT 
	employees.*
FROM employees
WHERE 
	employees.emp_id IN(
	SELECT department_managers.emp_id
	FROM department_managers
	WHERE 
		department_managers.emp_id=employees.emp_id
		)
;


-- select절에서 사용되는 sub query
-- 사원별 평균 연봉과 사번, 이름을 출력 

SELECT
	employees.emp_id
	,employees.name
	,( 
	SELECT AVG(salaries.salary)
	FROM salaries 
	WHERE 
		employees.emp_id=salaries.emp_id
	) AS avg_sal
FROM employees
;

-- FORM 절에 사용되는 sub Query
SELECT
tmp.*
FROM (
	SELECT 
	employees.emp_id
	, employees.name
	FROM employees
	) AS tmp
;

-- INSERT 절에 사용되는 sub Query
INSERT INTO employees (
name
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
 (SELECT emp.NAME FROM employees emp WHERE emp.emp_id = 1000)
,'2000-01-01'
,'M'
,DATE(NOW())
,NULL
,NULL
,NOW()
,NOW()
,NULL
);

--  !!(SELECT emp.NAME FROM employees emp WHERE emp.emp_id = 1000)만 검색해서 
-- 값을 확인하고  조건넣자!!

-- update 절에 사용되는 sub Query
UPDATE employees
SET
	employees.gender = ( 
	SELECT emp.gender
	FROM employees emp
	WHERE emp.emp_id = 10000
	)
WHERE
	employees.emp_id =  (
	SELECT MAX(emp2.emp_id)
	FROM employees emp2
	)
;
 