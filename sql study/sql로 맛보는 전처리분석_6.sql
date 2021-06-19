-- 매출TOP5국가 및 매출
SELECT C.country COUNTRY, ROUND(SUM(B.priceEach*B.quantityOrdered),1) SALES,
DENSE_RANK() OVER(ORDER BY SUM(B.priceEach*B.quantityOrdered) DESC) RNK
FROM orders A LEFT JOIN orderdetails B ON
A.ordernumber = B.ordernumber
LEFT JOIN customers C ON
A.customernumber = C.customernumber
group by 1
LIMIT 5;


-- BEST SELLER
SELECT D.productName PRODUCTNAME, sum(C.priceEach*C.quantityOrdered) SALES, 
RANK() OVER(ORDER BY sum(C.priceEach*C.quantityOrdered) DESC) RNK
FROM orders A LEFT JOIN customers B  ON
A.customernumber = B.customernumber
LEFT JOIN orderdetails C ON 
A.orderNumber = C.orderNumber
LEFT JOIN products D ON
C.productCode = D.productCode
GROUP BY 1
LIMIT 5;

-- CHURN RATE(%) : 일정기간 고객이 비활동적이로 전환되었는지 나타내는 지표
SELECT customernumber, MAX(ORDERDATE) MX_ORDER,'2005-06-01',
datediff('2005-06-01',MAX(ORDERDATE)) DIFF,
CASE WHEN datediff('2005-06-01',MAX(ORDERDATE)) >= 90 THEN 'CHURN' ELSE 'NON-CHURN' END CHURN_TYPE
FROM orders
group by 1
LIMIT 10;



-- CHURN 고객이 가장 많이 구매한 productline

SELECT CASE WHEN DATEDIFF('2005-06-01',MAX(ORDERDATE)) >=90 THEN 'CHURN' ELSE 'NON-CHURN' END CHUNR_TYPE,
C.productline , COUNT(DISTINCT B.customerNumber) BU
FROM orderdetails A LEFT JOIN orders B ON
A.ordernumber = B.ordernumber
LEFT JOIN products C ON
A.productcode = C.productcode
LEFT JOIN customers D ON
B.customerNumber = D.customerNumber
GROUP BY 1