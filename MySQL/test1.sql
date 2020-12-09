# 来源 https://www.cnblogs.com/believepd/p/10434768.html
-- 1、查询所有的课程的名称以及对应的任课老师姓名
SELECT course.name as CourseName, teacher.name as TeacherName FROM course LEFT JOIN teacher on course.teacher_id = teacher.id

-- 2、查询学习课程"python"比课程"java"成绩低的学生的学号
SELECT tb_python_course.student_id FROM
# 查出所有学生课程"python"的成绩
(SELECT * FROM score WHERE course_id IN (SELECT id FROM course WHERE name = 'python')) AS tb_python_course
INNER JOIN
# 查出所有学生课程"java"的成绩
(SELECT * FROM score WHERE course_id IN (SELECT id FROM course WHERE name = 'java')) AS tb_java_course
ON tb_python_course.student_id = tb_java_course.student_id
WHERE tb_python_course.mark < tb_java_course.mark

-- 3、查询平均成绩大于65分的同学的id和平均成绩(保留两位小数)
SELECT student_id, round(avg(mark), 2) as avg FROM score GROUP BY student_id HAVING avg > 65

-- 4、查询平均成绩大于65分的同学的姓名和平均成绩(保留两位小数);
SELECT student.name as name, tb_avg.avg as avg FROM 
(SELECT student_id, round(avg(mark), 2) as avg FROM score GROUP BY student_id) AS tb_avg
INNER JOIN
student
on tb_avg.student_id = student.id
WHERE tb_avg.avg > 65

-- 5、查询所有同学的姓名、选课数、总成绩
SELECT student.id, student.name, count, avg FROM student
INNER JOIN
(SELECT student_id, count(course_id) as count, avg(mark) as avg FROM score WHERE student_id in (SELECT id FROM student) GROUP BY student_id) as tb_avg
ON student.id = tb_avg.student_id
-- 6、查询没学过"路飞"老师课的同学的姓名
SELECT id FROM teacher WHERE name='路飞' # 找到路飞老师的ID
SELECT id FROM course WHERE teacher_id in (SELECT id FROM teacher WHERE name='路飞') # 找到路飞老师教的课程ID
SELECT course.id FROM teacher INNER JOIN course ON course.teacher_id = teacher.id WHERE teacher.name = '路飞' # 找到路飞老师教的课程ID

# 找到学了路飞老师课程的学生ID
SELECT score.student_id FROM score
INNER JOIN 
(SELECT course.id FROM teacher INNER JOIN course ON course.teacher_id = teacher.id WHERE teacher.name = '路飞') AS tb_couse
WHERE score.course_id = tb_couse.id


SELECT name FROM student
WHERE id NOT IN (
	SELECT score.student_id FROM score
	INNER JOIN 
	(SELECT course.id FROM teacher INNER JOIN course ON course.teacher_id = teacher.id WHERE teacher.name = '路飞') AS tb_couse
	WHERE score.course_id = tb_couse.id
)


-- 7、查询学过"python"并且也学过"java"课程的同学的姓名
# 查找学过 python 的同学
SELECT * FROM score WHERE course_id IN (SELECT id FROM course WHERE name = 'python')
# 查找学过 java 的同学
SELECT * FROM score WHERE course_id IN (SELECT id FROM course WHERE name = 'java')
# 查找两门都学过的同学的ID
SELECT tb_python.student_id FROM 
(SELECT * FROM score WHERE course_id IN (SELECT id FROM course WHERE name = 'python')) as tb_python
INNER JOIN
(SELECT * FROM score WHERE course_id IN (SELECT id FROM course WHERE name = 'java')) as tb_java
ON tb_python.student_id = tb_java.student_id
# 查找同学的姓名
SELECT name FROM student WHERE id in 
(
	SELECT tb_python.student_id FROM 
	(SELECT * FROM score WHERE course_id IN (SELECT id FROM course WHERE name = 'python')) as tb_python
	INNER JOIN
	(SELECT * FROM score WHERE course_id IN (SELECT id FROM course WHERE name = 'java')) as tb_java
	ON tb_python.student_id = tb_java.student_id
)

-- 8、查询学过"路飞"老师所教的全部课程的同学的姓名
SELECT name FROM student
WHERE id IN (
	SELECT score.student_id FROM score
	INNER JOIN 
	(SELECT course.id FROM teacher INNER JOIN course ON course.teacher_id = teacher.id WHERE teacher.name = '路飞') AS tb_couse
	WHERE score.course_id = tb_couse.id
)


-- 9、查询有课程成绩小于60分的同学的姓名
SELECT name FROM student WHERE id IN (SELECT DISTINCT student_id FROM score WHERE mark<60)

-- 10、查询挂科超过两门(包括两门)的学生姓名
SELECT name FROM student
INNER JOIN
(
	SELECT student_id, COUNT(student_id) AS count FROM 
	(SELECT student_id FROM score WHERE mark<60) AS tb
	GROUP BY student_id HAVING count > 1
) AS tb_count
ON tb_count.student_id = student.id

-- 11、查询选修了全部课程的学生姓名
SELECT COUNT(id) FROM course # 课程数量
SELECT student_id, COUNT(student_id) FROM score GROUP BY student_id # 查询学生的课程数量

SELECT name FROM student
INNER JOIN
(
	SELECT student_id, COUNT(student_id) AS count FROM score
	GROUP BY student_id
	HAVING count = (SELECT COUNT(id) FROM course)
) AS tb_count
ON student.id = tb_count.student_id

-- 12、查询至少有一门课程与"卡牌"同学所学课程相同的同学姓名
# 查询‘卡牌’同学的课程
SELECT id FROM student WHERE name = '卡牌'
SELECT course_id FROM score WHERE student_id = (SELECT id FROM student WHERE name = '卡牌')

SELECT student.name FROM student
INNER JOIN
(
	SELECT student_id, COUNT(student_id) as count FROM SCORE
	WHERE course_id IN (SELECT course_id FROM score WHERE student_id = (SELECT id FROM student WHERE name = '卡牌'))
	GROUP BY student_id
	HAVING count > 0
) as tb_count
ON student.id = tb_count.student_id
WHERE student.name!="卡牌"

-- 13、查询学过"蜘蛛"同学全部课程的其他同学姓名
# 学过的课程ID
SELECT course_id FROM score WHERE student_id = (SELECT id FROM student WHERE name = '蜘蛛')
# 学过的课程数量
SELECT COUNT(course_id) FROM score WHERE student_id = (SELECT id FROM student WHERE name = '蜘蛛')

SELECT student.name FROM student
INNER JOIN
(
	SELECT student_id, COUNT(student_id) AS count FROM score
	WHERE course_id IN
	(
		SELECT course_id FROM score
		WHERE student_id = (SELECT id FROM student WHERE name = '蜘蛛')
	) 
	GROUP BY student_id
	HAVING count = (
		SELECT COUNT(course_id) FROM score
		WHERE student_id = (SELECT id FROM student WHERE name = '蜘蛛')
	)
) AS tb_count
on student.id = tb_count.student_id
HAVING name != '蜘蛛'


-- 14、查询和"蜘蛛"同学学习的课程完全相同的其他同学姓名；

-- 15、按平均成绩倒序显示所有学生的"python"、"java"、"php"三门的课程成绩，按如下形式显示： 学生id,python,java,php,课程数,平均分

SELECT student.id, tb_statistics.count, tb_statistics.avg FROM student
INNER JOIN
(SELECT student_id, COUNT(student_id) AS count, avg(mark) AS avg FROM score GROUP BY student_id) AS tb_statistics
ON student.id = tb_statistics.student_id

SELECT student_id,
(SELECT mark FROM score as dscore WHERE score.student_id = dscore.student_id and dscore.course_id
= (SELECT id FROM course WHERE name = 'python')) as 'python',
(SELECT mark FROM score as dscore WHERE score.student_id = dscore.student_id and dscore.course_id
= (SELECT id FROM course WHERE name = 'java')) as 'java',
(SELECT mark FROM score as dscore WHERE score.student_id = dscore.student_id and dscore.course_id
= (SELECT id FROM course WHERE name = 'php')) as 'php',
COUNT(student_id) as '课程数',
AVG(mark) as '平均分'
FROM score
GROUP BY student_id;

-- 16、查询各科成绩最高和最低的分：以如下形式显示：课程id，最高分，最低分
SELECT course_id, MAX(mark), MIN(mark) FROM score GROUP BY course_id
-- 17、统计各科各分数段人数，显示格式：课程id,课程名称,[100-85],[85-70],[70-60],[<60]
SELECT score.course_id, course.name,
(
	SELECT COUNT(mark) FROM
	(SELECT * FROM score as dscore WHERE mark BETWEEN 85 AND 100) AS tb_tmp
	WHERE tb_tmp.course_id = score.course_id
) as `[100-85]`,
(
	SELECT COUNT(mark) FROM
	(SELECT * FROM score as dscore WHERE mark BETWEEN 70 AND 85) AS tb_tmp
	WHERE tb_tmp.course_id = score.course_id
) as `[85-70]`,
(
	SELECT COUNT(mark) FROM
	(SELECT * FROM score as dscore WHERE mark BETWEEN 60 AND 70) AS tb_tmp
	WHERE tb_tmp.course_id = score.course_id
) as `[70-60]`,
(
	SELECT COUNT(mark) FROM
	(SELECT * FROM score as dscore WHERE mark < 60) AS tb_tmp
	WHERE tb_tmp.course_id = score.course_id
) as `[<60]`
FROM score
INNER JOIN
course
ON
course.id = score.course_id
GROUP BY score.course_id

-- 18、查询每门课程名字及其被选修的次数

SELECT course.name, COUNT(course.name) FROM course
LEFT JOIN
score
ON course.id = score.course_id
GROUP BY course.name

-- 19、查询只选修了一门课程的学生的学号和姓名

# student.id, student.name, COUNT(1)
SELECT student.id, student.name, COUNT(1) as count FROM student
INNER JOIN score
ON student.id = score.student_id
GROUP BY student.id
HAVING count = 1

-- 20、查询学生表中男生、女生各有多少人
SELECT 
(
	SELECT COUNT(1) FROM student WHERE gender = '男'
) as '男',
(
	SELECT COUNT(1) FROM student WHERE gender = '女'
) as '女'
FROM DUAL


-- 21、查询每门课程的平均成绩，结果按平均成绩升序排列，平均成绩相同时，按课程id降序排列
SELECT course_id, AVG(mark) AS avg FROM score GROUP BY course_id ORDER BY avg ASC, course_id DESC

-- 22、查询课程名称为"python"且分数低于60的学生姓名和分数

SELECT student.name, tb_score.mark FROM student
LEFT JOIN 
(
	SELECT * FROM score WHERE course_id = (SELECT id FROM course WHERE name = 'python')
) AS tb_score
ON student.id = tb_score.student_id
WHERE tb_score.mark < 60

select student.name,mark from score
inner join student on score.student_id=student.id
where mark<60 and course_id=(select id from course where name="python");

-- 23、求选了课程的学生人数

SELECT id FROM student WHERE id IN (SELECT student_id FROM score GROUP BY student_id);
