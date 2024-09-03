-- 내장함수 : 데이터를 처리하고 분석하는데 사용하는 프로그램
-- 데이터 타입 변환 함수
1 = '1'
-- 데이터 타입 변환 함수
-- CAST(값 AS 데이터타입)
-- CONVERT(값, 데이터타입)

SELECT 
	1234
	,CAST(1234 AS CHAR(4)) 
	,CONVERT(1234, CHAR(4))
;


-- 제어 흐름 함수
-- IF(수식, 참일때, 거짓일 때)
-- 수식의 참 또는 거짓에 따라 결과를 분기하는 함수
SELECT 
	emp_id
	,gender
	,IF(gender = 'M', '남자', '여자') AS ko_gender
FROM employees
;


-- IFNULL(수식1, 수식2)
-- 수식1이 NULL이면 수시2를 반환
-- 수식1이 NULL이 아니면 수식1을 반환


SELECT *
	emp_id
	,fire_at
	IFNULL(fire_at, '9999-01-01') AS fire_at_not_null
FROM employees
-- AS 별칭 생략가능

-- NULLIF(수식1, 수식2)
-- 수식1과 수식2가 일치하는지 체크를 하고
-- 참으면 NULL울 반환, 거짓이면 수식1을 반환 
SELECT
	emp_id
	,gender
	,NULLIF(gender, 'F')
FROM employees
;

-- NIULLIF는 수식1과 수식2가 일치하는지 체크 하는!
-- 
-- CASE문
-- CASE 체크하려는 수식
-- WHEN 분기수식 1 THEN 결과1
-- WHEN 분기수식 2 THEN 결과2
-- ELSE 결과 4
-- END

SELECT
emp_id
, CASE gender
WHEN 'M' THEN '남자'
WHEN 'F' THEN '여자'
ELSE '모름' 
END AS ko_gender
FROM employees
;


-- ----------------------
-- 문자열 함수
-- ----------------------
CONCAT(문자열1, 문자열2...sal_id)
-- 문자열을 연결하는 함수 
SELECT CONCAT('안녕하세요.',' ','DB입니다.');
-- CONCAT_WS(구부낮, 문자열1, 문자열2...sal_id)
-- 문자열 사이에 구분자를 넣어 연결하는 함수
SELECT CONCAT_WS(',', '딸기', '바나나', '수박', '자두');


-- FORMAT(숫자, 소수점 자릿수)
SELECT FORMAT (50000, 0)
SELECT FORMAT (50000, 2)


-- LEFT(문자열, 숫자)
-- 문자열을 왼쪽부터 숫자길이 만큼 잘라 반환
SELECT LEFT('ABCDE', 2);


-- 문자열을 오른쪽부터 숫자길이 만큼 잘라 반환
SELECT RIGHT('ABCDE', 2);

-- UPPER(문자열)
-- 소문자를 대문자로 변경
SELECT UPPER('abcdE')

-- LOWER(문자열)
-- 대문자를 소문자로 변경

-- LPAD(문자열, 길이, 채울 문자열)
-- 문자열을 포함해 길이만큼 채울 문자열을 왼쪽에 삽입해 반환
SELECT LPAD('321', 5, '0');
-- ->00321

SELECT RPAD('321', 5, '0');
-- ->32100

SELECT LPAD(emp_id, 10, '0') FROM employees;
-- ->0000098887

-- TRIM(문자열)
-- 좌우 공백을 제거 
SELECT TRIM('    sdsd  ');

-- RTRIM(문자열) 우 공백을 제거 
-- LTRIM(문자열) 좌 공백을 제거 

-- TRIM(방향 문자열1 FROM문자열2)
-- 방향을 지정해서 문자열 2에서 문자열 1을 제거하여 반환
-- 방향은 LEADING(좌), BOTH(좌우), TRAILING(우) 지정 가능 
SELECT 
TRIM(LEADING 'ab' FROM 'abcdeab');
,TRIM(BOTH 'ab' FROM 'abcdeab');
,TRIM(TRAILING 'ab' FROM 'abcdeab');

SELECT
	SUBSTRING( 'abcdef', 3, 2) ->cd
;

-- SUBSTRING_INDEX(문자열, 국분자, 횟수)
-- 왼쪽부터 구분자가 횟수번째가 나오면 그 이후 버림 
SELECT SUBSTRING_INDEX('미어캣_그린_테스트', '_', 1);
-- > 미어캣
SELECT SUBSTRING_INDEX('미어캣_그린_테스트', '_', 2);
-- > 미어캣_그린
SELECT SUBSTRING_INDEX('미어캣_그린_테스트', '_', -1);
-- > 테스트

-- ----------------------
-- 수학 함수
-- ----------------------
-- CEILING(값) : 올림
-- FLOOR(값) : 버림
-- ROUNG(값) : 반올림

SELECT CEILING(1.2), FLOOR(1.9), ROUND(1.5)
-- -> 2 1 2 

-- TRUNCATE(값, 정수)
-- 소수점 기준으로 정수위치까지 구하고 나머지는 버림
SELECT TRUNCATE(1.2345, 2);

-- ----------------------
-- 날짜 및 시간 함수 
-- ----------------------
-- NOW() : 현재 날짜  및 시간을 반환(YYYY-MM-DD htt:mi:ss)
SELECT NOW();

-- DATE(데이트형식의 값)
--해당 값을 YYYY-MM-DD 형식으로 변환
SELECT DATE(NOW());
-- ADDDATE(날짜1, INTERVAL 날짜2)

SELECT ADDDATE('2024-01-01', INTERVAL 1 YEAR);   
SELECT ADDDATE('2024-01-01', INTERVAL -1 YEAR); 
SELECT ADDDATE('2024-01-01', INTERVAL 1 MONTH);   
SELECT ADDDATE('2024-01-01', INTERVAL -1 MONTH); 
SELECT ADDDATE('2024-01-01', INTERVAL 1 DAY);   
SELECT ADDDATE('2024-01-01', INTERVAL -1 DAY); 
SELECT ADDDATE('2024-01-01', INTERVAL 1 WEEK);   
SELECT ADDDATE('2024-01-01', INTERVAL -1 WEEK); 
SELECT ADDDATE('2024-01-01', INTERVAL 1 HOUR);   
SELECT ADDDATE('2024-01-01', INTERVAL -1 HOUR);   
SELECT ADDDATE('2024-01-01', INTERVAL 1 MINUTE); 
SELECT ADDDATE('2024-01-01', INTERVAL -1 MINUTE); 
SELECT ADDDATE('2024-01-01', INTERVAL 1 SECOND); 
SELECT ADDDATE('2024-01-01', INTERVAL -1 SECOND); 



-- ----------------------
-- 집계함수 
-- ----------------------
-- SUM(컬럼): 해당 컬럼의 합계 출력
-- MAX(컬럼): 해당 컬럼의 최대값  출력
-- MIN(컬럼): 해당 컬럼의 최소값  출력
-- AVG(컬럼): 해당 컬럼의 평균  출력
-- COUNT(컬럼): 해당 컬럼의 총개수  출력

SELECT
SUM(salary)
,MAX(salary)
,MIN(salary)
,AVG(salary)
FROM salaries;

SELECT 
	COUNT(fire_at)-- NULL아닌 개수를 가져온다 
  ,COUNT(*)-- 전체
FROM employees;


-- ----------------------
--순위함수 
-- ----------------------
SELECT
	emp_id
	, salary
	,RANK() OVER(ORDER BY salary DESC) AS sal_rank
	FROM salaries 
LIMIT 5;


-- ROW_NUMBER() OVER(ORDER BY 속성명 DESC/ASC)
-- 레코드에 순위를 매겨 반환
-- 동일한 값이 있는 경우에도 각 행에 고유한 번호를 부여
SELECT
	emp_id
	,salary
	,ROW_NUMBER() OVER(ORDER BY salary DESC) AS sal_rank
FROM salaries
LIMIT 5;

