-- INSERT 문 : 신규 데이터를 저장

-- 기본구조
-- INSERT INTO 테이블명 (컬럼1, 컬럼2...)
-- VALUES (값1, 값2...);

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
	'강태희'
	,'1988-08-07'
	,'F'
	,'2024-09-02'
	,NULL
	,NULL
	,'2024-09-02 00:00:00'
	,updated_at
	,NULL
	);

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
	
SELECT 
NAME
	,birth
	,gender
	,hire_at
	,fire_at
	,sup_id
	,created_at
	,updated_at
	,deleted_at
FROM employees
WHERE emp_id IN (1, 2)
;


-- 자신의 직급 정보 삽입
INSERT INTO title_emps(
	emp_id
	,title_code
	,start_at
	,end_at
	,created_at
	,updated_at
	,deleted_at
)
VALUES (
	100002
	,'t003'
	,'2024-09-02'
	,NULL 
	,'2024-09-02 00:00:00'
	,'2024-09-02 00:00:00'
	,NULL 
);
-- 따옴표 꼭 넣기, 열쇠모양쓰지 않기, 숫자는 ''쓰지않기

-- 자신의 급여정보 삽입
INSERT INTO salaries (
 	emp_id
 	,salary
	,start_at
	,end_at
	,created_at
	,updated_at
	,deleted_at
)
VALUES (
 	100002
 	,51538607
	,'2024-09-02'
	,NULL 
	,'2024-09-02 00:00:00'
	,'2024-09-02 00:00:00'
	,NULL 
);

-- 자신의 소속부서 삽입 
INSERT INTO department_emps(
	emp_id
	,dept_code
 	,start_at
	,end_at
	,created_at
	,updated_at
	,deleted_at
)
VALUES (
	100002
	,'d008'
	,'2024-09-02'
	,NULL 
	,'2024-09-02 00:00:00'
	,'2024-09-02 00:00:00'
	,NULL 
);

-- 내가 넣은내용 확인하는법
SELECT * FROM title_emps WHERE emp_id = 100002;

-- 여러개 넣는 방법은 
VALUES 
('강태희','1988-08-07','F','2024-09-02','2024-09-02 00:00:00');
('강샤샤','1988-08-07','F','2024-09-02','2024-09-02 00:00:00');
('강민지','1988-08-07','F','2024-09-02','2024-09-02 00:00:00');