CREATE DATABASE db_name;

USE db_name;

CREATE TABLE EmpTbl (
	EmpId INT,
    DeptId INT,
    SubDeptId VARCHAR(50)
);

INSERT INTO EmpTbl (EmpId, DeptId, SubDeptId)
VALUES  
    (1001, 1, 'A'),
    (1002, 2, 'X'),
    (1003, 3, 'A'),
    (1004, 4, 'A'),
    (1005, 5, 'A');

CREATE TABLE DeptTbl (
	DeptId INT,
    SubDeptId VARCHAR(50)
);

INSERT INTO DeptTbl (DeptId, SubDeptId)
VALUES  
    (1, 'A'),
    (2, 'A'),
    (3, 'B'),
    (4, 'A');
INSERT INTO DeptTbl (DeptId, SubDeptId)
VALUES (NULL, NULL);


SELECT EmpId
FROM EmpTbl
WHERE DeptId NOT IN (2,3); /* VO SAARI ID's jinki DeptNo. "2" ya "3" nahi h */
 
SELECT EmpId
FROM EmpTbl
WHERE DeptId NOT IN (SELECT DeptId FROM DeptTbl);
/* Ideally isa answer "1005" aana chayiye tha but 0rows aaya kyuki "NULL" ke case "NOT IN" sahin kaam nhi krta */

SELECT EmpId
FROM EmpTbl
WHERE NOT EXISTS (
    SELECT DeptId
    FROM DeptTbl
    WHERE DeptTbl.DeptId = EmpTbl.DeptId
);
/* "NOT EXISTS" se desired answer milega kyuki humne 2 tables ko join krdia hai