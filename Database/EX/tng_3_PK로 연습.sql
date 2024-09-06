-- 99964번 사원의 연봉을 4000만원으로 변경해주세요. 
-- -PK로 하면 절때 안겹친서 WHERE 조건에 PK값으로 하겠다 
UPDATE salaries
SET updated_at = NOW()
	 ,end_at = date(NOW())
WHERE sal_id = 990015
;

INSERT INTO salaries(
	emp_id
	,salary
	,start_at 	
)
VALUES (
	99964
	,2000000
	,date(NOW())
);

SELECT * 
FROM salaries
WHERE emp_id = 99964
ORDER BY start_at DESC
;





-- 10000번 사원의 연봉을 4000만원으로 변경해주세요. (서브 쿼리 이용해서 하는 방법) 
UPDATE salaries
SET updated_at = NOW()
	 ,end_at = date(NOW())
WHERE sal_id = (
		SELECT sal_id
		FROM salaries
		WHERE emp_id = 99972
		ORDER BY start_at DESC
		LIMIT 1
		)
;

INSERT INTO salaries(
	emp_id
	,salary
	,start_at 	
)
VALUES (
	99972
	,20000000
	,date(NOW())
);

SELECT *
		FROM salaries
		WHERE emp_id = 99972
		ORDER BY start_at DESC
		;
		
/*1차 있는지 확인
1) 일단 SELECT * 
FROM salaries
WHERE emp_id = 990339
; 

2) 기존을 있던 이력 남겨놓기 위해서 이것만 선택실행
UPDATE salaries
SET salaries.updated_at = NOW()
	 ,salaries.end_at = date(NOW())
WHERE sal_id = 990339
	AND end_at IS NULL 
;

3) 맨 밑에 가서 SELECT 이번호 날짜 바꼈는지 확인하고 
4) 마지막으로 INSERT INTO salaries(
	emp_id
	,salary
	,start_at 
	,end_at
	,created_at
	,updated_at
	,deleted_at
	
)
VALUES (
	990339
	,40000000
	,date(NOW())
	,NULL 
	,NOW()
	,NOW()
	,NULL 
);

date(now):연월일까지  (now):timestamp는 연월일시분초까지 나옵니다. 
*/

