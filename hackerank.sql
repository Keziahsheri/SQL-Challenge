DROP TABLE IF EXISTS lux_dev.hackers;
DROP TABLE IF EXISTS lux_dev.submissions;
CREATE TABLE hackers(
Hacker_id INT PRIMARY KEY,
Name VARCHAR (14)
);


CREATE TABLE Submissions(submission_date DATE,
submission_id INT,
Hacker_id INT,
Score INT,
FOREIGN KEY(Hacker_id)  REFERENCES hackers(Hacker_id)
);


INSERT INTO hackers VALUES(15758, 'Rose');
INSERT INTO hackers VALUES(20703, 'Angela');
INSERT INTO hackers VALUES(36396, 'Frank');
INSERT INTO hackers VALUES(38289, 'Patrick');
INSERT INTO hackers VALUES(44065, 'Lisa');
INSERT INTO hackers VALUES(53473, 'Kimberly');
INSERT INTO hackers VALUES(62529, 'Bonnie');
INSERT INTO hackers VALUES(79722, 'Michael');


INSERT INTO Submissions VALUES('2016-03-01', 8494, 20703,0);
INSERT INTO Submissions VALUES('2016-03-01', 22403,53473,15);
INSERT INTO Submissions VALUES('2016-03-01', 23965, 79722,60);
INSERT INTO Submissions VALUES('2016-03-01', 30173, 36396,70);
INSERT INTO Submissions VALUES('2016-03-01', 34928, 20703,0);
INSERT INTO Submissions VALUES('2016-03-02', 38740, 15758,60);
INSERT INTO Submissions VALUES('2016-03-02', 42769, 79722,25);
INSERT INTO Submissions VALUES('2016-03-02', 44364, 79722,60);
INSERT INTO Submissions VALUES('2016-03-03', 45440, 20703,0);
INSERT INTO Submissions VALUES('2016-03-03', 49050, 20703,70);
INSERT INTO Submissions VALUES('2016-03-03', 50273,79722,5);
INSERT INTO Submissions VALUES('2016-03-04', 50344, 20703,0);
INSERT INTO Submissions VALUES('2016-03-04', 51360, 44065,90);
INSERT INTO Submissions VALUES('2016-03-04', 54404, 53473,65);
INSERT INTO Submissions VALUES('2016-03-04', 61533, 79722,45);
INSERT INTO Submissions VALUES('2016-03-05', 72852, 20703,0);
INSERT INTO Submissions VALUES('2016-03-05', 74546, 38289,0);
INSERT INTO Submissions VALUES('2016-03-05', 76487, 62529,0);
INSERT INTO Submissions VALUES('2016-03-05', 82439, 36396,10);
INSERT INTO Submissions VALUES('2016-03-05', 90006, 36396,40);
INSERT INTO Submissions VALUES('2016-03-06', 90404, 20703,0);




SELECT *FROM hackers;


SELECT * FROM Submissions;



SELECT
  submission_date AS day,
  COUNT(DISTINCT hacker_id) AS num_unique_hackers,
  MIN(hacker_id) AS hacker_id_with_min_submissions,
  MAX(name) AS name_of_hacker_with_max_submissions
FROM
  Submissions
  JOIN Hackers ON Submissions.hacker_id = Hackers.hacker_id
WHERE
  submission_date >= '2016-03-01' AND submission_date <= '2016-03-15'
GROUP BY
  submission_date
HAVING
  COUNT(DISTINCT hacker_id) > 0
ORDER BY
  submission_date;


