-- 1. 직급테이블의 모든 정보를 조회해주세요.
SELECT *
FROM titles
;
    
-- 2. 급여가 60,000,000 이하인 사원의 사번을 조회해 주세요.
   
SELECT DISTINCT 
	emp_id
FROM salaries 
WHERE salary <= 60000000
;  

-- 3. 급여가 60,000,000에서 70,000,000인 사원의 사번을 조회해 주세요.
SELECT emp_id
FROM salaries 
WHERE 
	salary BETWEEN 60000000	AND 70000000
;

/*and로 하는 방법 *
SELECT emp_id
FROM salaries 
WHERE 
	salary >= 60000000
	and salary <= 70000000;
*/ 


-- 4. 사원번호가 10001, 10005인 사원의 사원테이블의 모든 정보를 조회해 주세요.
SELECT *
FROM employees
WHERE 
	emp_id = 10001 
or emp_id = 10005
;

-- IN 연산자 하는 방법 
SELECT *
FROM employees
WHERE 
	emp_id IN (10001, 10005)
;

-- 5. 직급에 '사'가 포함된 직급코드와 직급명을 조회해 주세요.
SELECT title_code, title
FROM titles
WHERE
	title LIKE '%사%'
;
-- '%사%' ()없어도됩니다.

-- 6. 사원 이름 오름차순으로 정렬해서 조회해 주세요.
SELECT name
FROM employees
ORDER BY name ASC 
;

-- 7. 사원별 전체 급여의 평균을 조회해 주세요.
SELECT 
   emp_id
   ,AVG(salary) avg_sal
   FROM salaries 
   GROUP BY emp_id 
;
    
-- 8. 사원별 전체 급여의 평균이 30,000,000 ~ 50,000,000인, 사원번호와 평균급여를 조회해 주세요.
SELECT 
   emp_id
   ,AVG(salary) avg_sal
   FROM salaries
   GROUP BY emp_id
	HAVING avg_sal BETWEEN 30000000 AND 50000000
;

-- 9. 사원별 전체 급여 평균이 70,000,000이상인, 사원의 사번, 이름, 성별을 조회해 주세요.
SELECT 
	employees.emp_id
	,employees.name
	,employees.gender
FROM employees
WHERE employees.emp_id IN (
	SELECT salaries.emp_id 
	FROM salaries
	GROUP BY salaries.emp_id HAVING AVG(salary) >= 70000000
);
-- 사원별 할때는 GROUP by 사용 
-- 동일한 내용은 (사번) 그래서 사번을 가져올건데  샐러리에서 사번가져오면됨  


-- 10. 현재 직급이 'T005'인, 사원의 사원번호와 이름을 조회해 주세요. (편집됨) 
SELECT 
	employees.emp_id
	,employees.NAME
FROM employees
WHERE 
	employees.emp_id IN (
	SELECT 	title_emps.emp_id
	FROM title_emps
	WHERE 
 		title_emps.end_at IS NULL
 	AND title_emps.title_code = 'T005'
	)
;




















