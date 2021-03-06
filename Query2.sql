
SELECT * FROM CUST;
SELECT * FROM PROD;
SELECT * FROM ORD;

SELECT ALL PROD_CMP FROM PROD;

SELECT PROD_NM, PROD_AV, PRICE
FROM PROD
WHERE PROD_CMP='한빛제과';

SELECT CUST_NM, AGE, CUST_QF, CUST_POINT
FROM CUST
WHERE CUST_NM LIKE '김%';

SELECT CUST_ID, CUST_NM
FROM CUST
WHERE AGE IS NULL;

SELECT ORD_CUST_NM, ORD_PROD_ID, QNT, ORD_DATE
FROM ORD
WHERE QNT>=10
ORDER BY ORD_PROD_ID ASC, QNT DESC;

SELECT COUNT(CUST_ID) AS CUST_COUNT
FROM CUST;

SELECT COUNT(DISTINCT PROD_CMP) AS CMP_COUNT
FROM PROD;

SELECT DISTINCT PROD_CMP, COUNT(DISTINCT PROD_NM) AS PROD_COUNT, MAX(PRICE) AS MAX_PRICE
FROM PROD
GROUP BY PROD_CMP;

SELECT ORD_PROD_ID, ORD_CUST_NM, SUM(QNT) AS TOTAL_QNT
FROM ORD
GROUP BY ORD_PROD_ID, ORD_CUST_NM;

SELECT  ORD_CUST_NM,COUNT(ORD_PROD_ID), SUM(QNT) AS TOTAL_QNT
FROM ORD
GROUP BY ORD_CUST_NM;

SELECT P.PROD_NM
FROM PROD P, CUST C, ORD O
WHERE C.CUST_NM='고명석' AND C.CUST_ID=O.ORD_CUST_NM AND P.PROD_ID=O.ORD_PROD_ID;

SELECT PROD_NM, PRICE
FROM PROD
WHERE PROD_CMP=(SELECT PROD_CMP FROM PROD WHERE PROD_NM='달콤비스킷');

SELECT PROD_NM, PROD_CMP
FROM PROD P
WHERE PROD_ID NOT IN (SELECT ORD_PROD_ID FROM ORD WHERE ORD_CUST_NM='banana');

SELECT CUST_NM
FROM CUST
WHERE NOT EXISTS (SELECT * FROM ORD WHERE ORD_DATE='2019-03-15' AND ORD.ORD_CUST_NM=CUST.CUST_ID) ORDER BY CUST_NM DESC;

UPDATE ORD
SET QNT=5
WHERE ORD_CUST_NM IN (SELECT CUST_ID FROM CUST WHERE CUST_NM='정소화');
SELECT * FROM ORD;
SELECT * FROM PROD;
SELECT * FROM CUST;
UPDATE ORD
SET QNT=5000
WHERE ORD_CUST_NM='banana';

DELETE FROM ORD WHERE ORD_CUST_NM='melon';
DELETE FROM CUST WHERE CUST_ID='melon';

SELECT CUST_ID, CUST_NM
FROM CUST
WHERE AGE IS NULL;

DELETE FROM ORD WHERE ORD_PROD_ID IN ('p01','p02','p03');

DELETE FROM ORD WHERE EXISTS (SELECT PROD_ID FROM PROD WHERE ORD_PROD_ID IN ('p04', 'p05', 'p06'));
DELETE FROM PROD WHERE PROD_ID IN ('p04', 'p05', 'p06');

DELETE FROM ORD WHERE ORD_CUST_NM='banana';
DELETE FROM CUST WHERE CUST_NM='banana';

DELETE FROM ORD;
DROP TABLE ORD;
DROP TABLE PROD;
DELETE FROM CUST;
DROP TABLE CUST;

DROP DATABASE SAP_TEST;
