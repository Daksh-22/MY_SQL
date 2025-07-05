/* QUES 30
SELECT province_id, SUM(height) AS sum_height
FROM patients
WHERE height IS NOT NULL
GROUP BY province_id
HAVING sum_height >= 7000;
*/


