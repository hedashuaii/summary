来源 https://www.cnblogs.com/believepd/p/10434768.html
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
-- 7、查询学过"python"并且也学过"java"课程的同学的姓名
-- 8、查询学过"路飞"老师所教的全部课程的同学的姓名
-- 9、查询有课程成绩小于60分的同学的姓名
-- 10、查询挂科超过两门(包括两门)的学生姓名
-- 11、查询选修了全部课程的学生姓名
-- 12、查询至少有一门课程与"卡牌"同学所学课程相同的同学姓名
-- 13、查询学过"蜘蛛"同学全部课程的其他同学姓名
-- 14、查询和"蜘蛛"同学学习的课程完全相同的其他同学姓名；
-- 15、按平均成绩倒序显示所有学生的"python"、"java"、"php"三门的课程成绩，按如下形式显示： 学生id,python,java,php,课程数,平均分
-- 16、查询各科成绩最高和最低的分：以如下形式显示：课程id，最高分，最低分
-- 17、统计各科各分数段人数，显示格式：课程id,课程名称,[100-85],[85-70],[70-60],[<60]
-- 18、查询每门课程名字及其被选修的次数
-- 19、查询只选修了一门课程的学生的学号和姓名
-- 20、查询学生表中男生、女生各有多少人
-- 21、查询每门课程的平均成绩，结果按平均成绩升序排列，平均成绩相同时，按课程id降序排列
-- 22、查询课程名称为"python"且分数低于60的学生姓名和分数
-- 23、求选了课程的学生人数