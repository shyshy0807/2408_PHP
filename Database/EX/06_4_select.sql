-- UPDATE문 : 기존 데이터를 수정

-- 기본 구조
-- UPDATE 테이블명
-- SET 컬럼1=값1, 컬럼2=값2...
-- WHERE 조건 

UPDATE employees
SET 
	gender = 'F'
	,updated_at = NOW()
WHERE emp_id = 100002
;
-- 실수를 줄이는 방법은 WHERE절을 먼저 적어야 한다. 
-- NOW()는 현재시간 
-- at 데이터의 약자

-- 나의 직급을 'T002'로 변경해주세요. 

SELECT * FROM title_emps WHERE emp_id = 100002 AND end_at IS NULL;

UPDATE title_emps
SET 
	title_code = 't002'
WHERE emp_id = 100002 AND end_at IS null;
;

SELECT * FROM title_emps WHERE emp_id = 100002 AND end_at IS null;


-- 현재 급여가 26,000,000만원 이하인 직원의 급여를  50,000,000만원 수정해주세요. 
SELECT * FROM salaries 
WHERE end_at IS NULL AND salary <=26000000;

UPDATE salaries 
SET salary=50000000, updated_at = NOW()
WHERE end_at IS NULL AND salary <=26000000;

SELECT * FROM salaries 
WHERE end_at IS NULL AND salary =50000000;

/*
처음에 SELECT로 조건을 넣어서 검색하고 
UPDATE로 입력해서 업데이트 시킨뒤
잘 넣었는지 SELECT로 확인  
/*

