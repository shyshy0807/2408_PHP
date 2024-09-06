-- INDEX 확인
SHOW INDEX FROM employees;


SELECT * 
FROM employees 
WHERE NAME = '주정웅';

-- index 생성
ALTER TABLE employees ADD INDEX idx_employees_name (NAME);

SELECT * FROM employees WHERE NAME = '주정웅';

-- INDEX 제거 
DROP INDEX idx_employees_name ON employees;