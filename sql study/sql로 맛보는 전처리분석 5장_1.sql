-- 5장_상품 리뷰 데이터를 이용한 리포트 작성
-- DIVISION NAME 별평균 평점
SELECT `DIVISION NAME`, AVG(RATING) AVG_RATE
FROM dataset2
group by 1
order by 2 desc;

-- trend의 평점 3점 이하 리뷰
SELECT * 
FROM MYDATA.DATASET2
WHERE `department name` = 'trend' AND
RATING <= 3
LIMIT 10;

-- case when
SELECT CASE WHEN 
AGE BETWEEN 0 AND 10 THEN '1'
WHEN AGE BETWEEN 10 AND 19 THEN '10'
WHEN AGE BETWEEN 20 AND 29 THEN '20'
WHEN AGE BETWEEN 30 AND 39 THEN '30'
WHEN AGE BETWEEN 40 AND 49 THEN '40'
WHEN AGE BETWEEN 50 AND 59 THEN '50'
WHEN AGE BETWEEN 60 AND 69 THEN '60'
WHEN AGE BETWEEN 70 AND 79 THEN '70'
WHEN AGE BETWEEN 80 AND 89 THEN '80' END AGEBAND, AGE
FROM DATASET2;


-- FLOOR
SELECT FLOOR(AGE/10)*10 AGEBAND, AGE
FROM DATASET2
WHERE `DEPARTMENT NAME` = 'TREND'
AND RATING <= 3;

-- Trend의 평점 3점 이하 리뷰의 연령 분포
SELECT FLOOR(AGE/10)*10, COUNT(*) CNT
FROM DATASET2
WHERE `DEPARTMENT NAME` = 'TREND' AND
RATING <= 3
GROUP BY 1
ORDER BY 2 DESC
;
-- DEPARTMENT별 연령별 리뷰 수
SELECT FLOOR(AGE/10)*10 AGEBAND, COUNT(*) CNT
FROM DATASET2
WHERE `DEPARTMENT NAME` = 'TREND'
GROUP BY 1
ORDER BY 2 DESC
;
-- 50대 3점 이하 trend 리뷰
SELECT * FROM DATASET2
WHERE `DEPARTMENT NAME` = 'TREND' AND
(AGE BETWEEN 50 AND 59) AND
RATING <= 3
LIMIT 10;




