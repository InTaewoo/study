-- 일자별 매출액조회

SELECT A.ORDERDATE, sum(B.priceEach*quantityOrdered) As SALES
FROM orders A LEFT JOIN orderdetails B ON
A.orderNumber = B.orderNumber
GROUP BY 1
ORDER BY 1;

-- 월별 매출액 조회
SELECT SUBSTR(A.ORDERDATE,1,7) MM, sum(B.priceEach*quantityOrdered) SALES
FROM orders A left join orderdetails B ON
A.orderNumber = B.orderNumber
GROUP BY 1
ORDER BY 1;
 
-- 연도별 매출액 조회
SELECT SUBSTR(A.ORDERDATE,1,4) MM, truncate(sum(B.priceEach*quantityOrdered),0) SALES
FROM orders A left join orderdetails B ON
A.orderNumber = B.orderNumber
GROUP BY 1
ORDER BY 1;
