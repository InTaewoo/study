-- 건당 구매 금액(연도별)

SELECT SUBSTR(A.ORDERDATE,1,4)YY,
COUNT(DISTINCT A.ORDERNUMBER) N_PURCHASER,
ROUND(SUM(B.quantityOrdered*B.priceEach)) SALES,
ROUND(SUM(B.quantityOrdered*B.priceEach) /COUNT(DISTINCT A.ORDERNUMBER ),2) ATV
FROM ORDERS A LEFT JOIN orderdetails B ON
A.orderNumber = B.orderNumber
GROUP BY 1;

-- 국가별 도시별 매출액
SELECT C.country, C.city,SUM(B.priceEach*B.quantityOrdered) SALES
FROM orders A LEFT JOIN orderdetails B ON
A.ordernumber = B.ordernumber
LEFT JOIN customers C ON
A.customerNumber = C.customerNumber 
group by 1,2
ORDER BY 1,2;

-- 북미(USA,CANADA)
SELECT CASE WHEN C.country IN ('USA','canada') THEN 'North America' ELSE 'Others' END AS COUNTRY_GRP
FROM customers c;

-- 국가별, 도시별 매출액
SELECT CASE WHEN C.COUNTRY IN ('USA','CANADA') THEN 'North America' ELSE 'Others' END COUNTRY_GRP,
ROUND(SUM(B.priceEach*B.quantityOrdered)) SALES
FROM orders A LEFT JOIN orderdetails B ON
A.ordernumber = B.ordernumber
LEFT JOIN customers C ON
A.customernumber = C.customernumber
GROUP BY 1;
