-- 建表
-- 学生表
CREATE TABLE `Student`(
`s_id` VARCHAR(20),
`s_name` VARCHAR(20) NOT NULL DEFAULT '',
`s_birth` VARCHAR(20) NOT NULL DEFAULT '',
`s_sex` VARCHAR(10) NOT NULL DEFAULT '',
PRIMARY KEY(`s_id`)
);
-- 课程表
CREATE TABLE `Course`(
`c_id` VARCHAR(20),
`c_name` VARCHAR(20) NOT NULL DEFAULT '',
`t_id` VARCHAR(20) NOT NULL,
PRIMARY KEY(`c_id`)
);
-- 教师表
CREATE TABLE `Teacher`(
`t_id` VARCHAR(20),
`t_name` VARCHAR(20) NOT NULL DEFAULT '',
PRIMARY KEY(`t_id`)
);
-- 成绩表
CREATE TABLE `Score`(
`s_id` VARCHAR(20),
`c_id` VARCHAR(20),
`s_score` INT(3),
PRIMARY KEY(`s_id`,`c_id`)
);
-- 插入学生表测试数据
insert into Student values('01' , '赵雷' , '1990-01-01' , '男');
insert into Student values('02' , '钱电' , '1990-12-21' , '男');
insert into Student values('03' , '孙风' , '1990-05-20' , '男');
insert into Student values('04' , '李云' , '1990-08-06' , '男');
insert into Student values('05' , '周梅' , '1991-12-01' , '女');
insert into Student values('06' , '吴兰' , '1992-03-01' , '女');
insert into Student values('07' , '郑竹' , '1989-07-01' , '女');
insert into Student values('08' , '王菊' , '1990-01-20' , '女');
-- 课程表测试数据
insert into Course values('01' , '语文' , '02');
insert into Course values('02' , '数学' , '01');
insert into Course values('03' , '英语' , '03');

-- 教师表测试数据
insert into Teacher values('01' , '张三');
insert into Teacher values('02' , '李四');
insert into Teacher values('03' , '王五');

-- 成绩表测试数据
insert into Score values('01' , '01' , 80);
insert into Score values('01' , '02' , 90);
insert into Score values('01' , '03' , 99);
insert into Score values('02' , '01' , 70);
insert into Score values('02' , '02' , 60);
insert into Score values('02' , '03' , 80);
insert into Score values('03' , '01' , 80);
insert into Score values('03' , '02' , 80);
insert into Score values('03' , '03' , 80);
insert into Score values('04' , '01' , 50);
insert into Score values('04' , '02' , 30);
insert into Score values('04' , '03' , 20);
insert into Score values('05' , '01' , 76);
insert into Score values('05' , '02' , 87);
insert into Score values('06' , '01' , 31);
insert into Score values('06' , '03' , 34);
insert into Score values('07' , '02' , 89);
insert into Score values('07' , '03' , 98);


-- 01、查询"01"课程比"02"课程成绩高的学生的信息及课程分数 
SELECT tb_01.s_id, tb_01.s_score as `01score`, tb_02.s_score as `02score` FROM
(SELECT * FROM score WHERE c_id = 01) AS tb_01
INNER JOIN
(SELECT * FROM score WHERE c_id = 02) AS tb_02
ON tb_01.s_id = tb_02.s_id
HAVING `01score` > `02score`

select st.*,sc.s_score as '语文' ,sc2.s_score '数学' 
from student st
left join score sc on sc.s_id=st.s_id and sc.c_id='01' 
left join score sc2 on sc2.s_id=st.s_id and sc2.c_id='02'  
where sc.s_score>sc2.s_score

-- 02、查询"01"课程比"02"课程成绩低的学生的信息及课程分数
-- 03、查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
-- 04、查询平均成绩小于60分的同学的学生编号和学生姓名和平均成绩
-- 05、查询所有同学的学生编号、学生姓名、选课总数、所有课程的总成绩
-- 06、查询"李"姓老师的数量 
-- 07、查询学过"张三"老师授课的同学的信息 
-- 08、查询没学过"张三"老师授课的同学的信息 
-- 09、查询学过编号为"01"并且也学过编号为"02"的课程的同学的信息
-- 10、查询学过编号为"01"但是没有学过编号为"02"的课程的同学的信息
-- 11、查询没有学全所有课程的同学的信息
-- 12、查询至少有一门课与学号为"01"的同学所学相同的同学的信息
-- 13、查询和"01"号的同学学习的课程完全相同的其他同学的信息
-- 14、查询没学过"张三"老师讲授的任一门课程的学生姓名
-- 15、查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩
-- 16、检索"01"课程分数小于60，按分数降序排列的学生信息
-- 17、按平均成绩从高到低显示所有学生的所有课程的成绩以及平均成绩
-- 18、查询各科成绩最高分、最低分和平均分：以如下形式显示：课程ID，课程name，最高分，最低分，平均分，及格率，中等率，优良率，优秀率
-- 19、按各科成绩进行排序，并显示排名(实现不完全)
-- 20、查询学生的总成绩并进行排名
-- 21、查询不同老师所教不同课程平均分从高到低显示 
-- 22、查询所有课程的成绩第2名到第3名的学生信息及该课程成绩
-- 23、统计各科成绩各分数段人数：课程编号,课程名称,[100-85],[85-70],[70-60],[0-60]及所占百分比
-- 24、查询学生平均成绩及其名次 
-- 25、查询各科成绩前三名的记录
-- 26、查询每门课程被选修的学生数 
-- 27、查询出只有两门课程的全部学生的学号和姓名
-- 28、查询男生、女生人数
-- 29、查询名字中含有"风"字的学生信息
-- 30、查询同名同性学生名单，并统计同名人数 
-- 31、查询1990年出生的学生名单
-- 32、查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列 
-- 33、查询平均成绩大于等于85的所有学生的学号、姓名和平均成绩
-- 34、查询课程名称为"数学"，且分数低于60的学生姓名和分数 
-- 35、查询所有学生的课程及分数情况；
-- 36、查询任何一门课程成绩在70分以上的姓名、课程名称和分数
-- 37、查询不及格的课程
-- 38、查询课程编号为01且课程成绩在80分以上的学生的学号和姓名
-- 39、求每门课程的学生人数
-- 40、查询选修"张三"老师所授课程的学生中，成绩最高的学生信息及其成绩 
-- 41、查询不同课程成绩相同的学生的学生编号、课程编号、学生成绩 
-- 42、查询每门功成绩最好的前两名 
-- 43、统计每门课程的学生选修人数（超过5人的课程才统计）。要求输出课程号和选修人数，查询结果按人数降序排列，
-- 44、检索至少选修两门课程的学生学号 
-- 45、查询选修了全部课程的学生信息
-- 46、查询各学生的年龄
-- 47、查询本周过生日的学生
-- 48、查询下周过生日的学生
-- 49、查询本月过生日的学生
-- 50、查询下月过生日的学生


















-- 1、查询"01"课程比"02"课程成绩高的学生的信息及课程分数 
select st.*,sc.s_score as '语文' ,sc2.s_score '数学' 
from student st
left join score sc on sc.s_id=st.s_id and sc.c_id='01' 
left join score sc2 on sc2.s_id=st.s_id and sc2.c_id='02'  
where sc.s_score>sc2.s_score

-- 2、查询"01"课程比"02"课程成绩低的学生的信息及课程分数
select st.*,sc.s_score '语文',sc2.s_score '数学' from student st
left join score sc on sc.s_id=st.s_id and sc.c_id='01'
left join score sc2 on sc2.s_id=st.s_id and sc2.c_id='02'
where sc.s_score<sc2.s_score

-- 3、查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select st.s_id,st.s_name,ROUND(AVG(sc.s_score),2) cjScore from student st
left join score sc on sc.s_id=st.s_id
group by st.s_id having AVG(sc.s_score)>=60

-- 4、查询平均成绩小于60分的同学的学生编号和学生姓名和平均成绩
        -- (包括有成绩的和无成绩的)
select st.s_id,st.s_name,(case when ROUND(AVG(sc.s_score),2) is null then 0 else ROUND(AVG(sc.s_score)) end ) cjScore from student st
left join score sc on sc.s_id=st.s_id
group by st.s_id having AVG(sc.s_score)<60 or AVG(sc.s_score) is NULL

-- 5、查询所有同学的学生编号、学生姓名、选课总数、所有课程的总成绩
select st.s_id,st.s_name,count(c.c_id),( case when SUM(sc.s_score) is null or sum(sc.s_score)="" then 0 else SUM(sc.s_score) end) from student st
left join score sc on sc.s_id =st.s_id 
left join course c on c.c_id=sc.c_id
group by st.s_id

-- 6、查询"李"姓老师的数量 
select t.t_name,count(t.t_id) from teacher t
group by t.t_id having t.t_name like "李%"; 

-- 7、查询学过"张三"老师授课的同学的信息 
select st.* from student st 
left join score sc on sc.s_id=st.s_id
left join course c on c.c_id=sc.c_id
left join teacher t on t.t_id=c.t_id
 where t.t_name="张三"

-- 8、查询没学过"张三"老师授课的同学的信息 
 -- 张三老师教的课
 select c.* from course c left join teacher t on t.t_id=c.t_id where  t.t_name="张三"
 -- 有张三老师课成绩的st.s_id
 select sc.s_id from score sc where sc.c_id in (select c.c_id from course c left join teacher t on t.t_id=c.t_id where  t.t_name="张三")
 -- 不在上面查到的st.s_id的学生信息,即没学过张三老师授课的同学信息
 select st.* from student st where st.s_id not in(
  select sc.s_id from score sc where sc.c_id in (select c.c_id from course c left join teacher t on t.t_id=c.t_id where  t.t_name="张三")
  )

-- 9、查询学过编号为"01"并且也学过编号为"02"的课程的同学的信息
select st.* from student st 
inner join score sc on sc.s_id = st.s_id
inner join course c on c.c_id=sc.c_id and c.c_id="01"
where st.s_id in (
select st2.s_id from student st2 
inner join score sc2 on sc2.s_id = st2.s_id
inner join course c2 on c2.c_id=sc2.c_id and c2.c_id="02"
)


网友提供的思路(厉害呦~):
SELECT st.*
FROM student st
INNER JOIN score sc ON sc.`s_id`=st.`s_id`
GROUP BY st.`s_id`
HAVING SUM(IF(sc.`c_id`="01" OR sc.`c_id`="02" ,1,0))>1

-- 10、查询学过编号为"01"但是没有学过编号为"02"的课程的同学的信息
select st.* from student st 
inner join score sc on sc.s_id = st.s_id
inner join course c on c.c_id=sc.c_id and c.c_id="01"
where st.s_id not in (
select st2.s_id from student st2 
inner join score sc2 on sc2.s_id = st2.s_id
inner join course c2 on c2.c_id=sc2.c_id and c2.c_id="02"
)

-- 11、查询没有学全所有课程的同学的信息
 -- 太复杂,下次换一种思路,看有没有简单点方法
 -- 此处思路为查学全所有课程的学生id,再内联取反面
select * from student where s_id not in (
select st.s_id from student st 
inner join score sc on sc.s_id = st.s_id and sc.c_id="01"
where st.s_id  in (
select st2.s_id from student st2 
inner join score sc2 on sc2.s_id = st2.s_id and sc2.c_id="02"
) and st.s_id in (
select st2.s_id from student st2 
inner join score sc2 on sc2.s_id = st2.s_id and sc2.c_id="03"
))
-- 来自一楼网友的思路，左连接，根据学生id分组过滤掉 数量小于 课程表中总课程数量的结果(show me his code),简洁不少。
select st.* from Student st
left join Score S
on st.s_id = S.s_id
group by st.s_id
having count(c_id)<(select count(c_id) from Course)





-- 12、查询至少有一门课与学号为"01"的同学所学相同的同学的信息
select distinct st.* from student st 
left join score sc on sc.s_id=st.s_id
where sc.c_id in (
select sc2.c_id from student st2
left join score sc2 on sc2.s_id=st2.s_id
where st2.s_id ='01'
)

-- 13、查询和"01"号的同学学习的课程完全相同的其他同学的信息
select  st.* from student st 
left join score sc on sc.s_id=st.s_id
group by st.s_id
having group_concat(sc.c_id) = 
(
select  group_concat(sc2.c_id) from student st2
left join score sc2 on sc2.s_id=st2.s_id
where st2.s_id ='01'
)

-- 14、查询没学过"张三"老师讲授的任一门课程的学生姓名
select st.s_name from student st 
where st.s_id not in (
select sc.s_id from score sc 
inner join course c on c.c_id=sc.c_id
inner join teacher t on t.t_id=c.t_id and t.t_name="张三"
)

-- 15、查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩
select st.s_id,st.s_name,avg(sc.s_score) from student st
left join score sc on sc.s_id=st.s_id
where sc.s_id in (
select sc.s_id from score sc 
where sc.s_score<60 or sc.s_score is NULL
group by sc.s_id having COUNT(sc.s_id)>=2
)
group by st.s_id

-- 16、检索"01"课程分数小于60，按分数降序排列的学生信息
select st.*,sc.s_score from student st 
inner join score sc on sc.s_id=st.s_id and sc.c_id="01" and sc.s_score<60
order by sc.s_score desc

-- 17、按平均成绩从高到低显示所有学生的所有课程的成绩以及平均成绩
 -- 可加round,case when then else end 使显示更完美
select st.s_id,st.s_name,avg(sc4.s_score) "平均分",sc.s_score "语文",sc2.s_score "数学",sc3.s_score "英语" from student st
left join score sc  on sc.s_id=st.s_id  and sc.c_id="01"
left join score sc2 on sc2.s_id=st.s_id and sc2.c_id="02"
left join score sc3 on sc3.s_id=st.s_id and sc3.c_id="03"
left join score sc4 on sc4.s_id=st.s_id
group by st.s_id 
order by SUM(sc4.s_score) desc

-- 18.查询各科成绩最高分、最低分和平均分：以如下形式显示：课程ID，课程name，最高分，最低分，平均分，及格率，中等率，优良率，优秀率
-- 及格为>=60，中等为：70-80，优良为：80-90，优秀为：>=90
select c.c_id,c.c_name,max(sc.s_score) "最高分",MIN(sc2.s_score) "最低分",avg(sc3.s_score) "平均分" 
,((select count(s_id) from score where s_score>=60 and c_id=c.c_id )/(select count(s_id) from score where c_id=c.c_id)) "及格率"
,((select count(s_id) from score where s_score>=70 and s_score<80 and c_id=c.c_id )/(select count(s_id) from score where c_id=c.c_id)) "中等率"
,((select count(s_id) from score where s_score>=80 and s_score<90 and c_id=c.c_id )/(select count(s_id) from score where c_id=c.c_id)) "优良率"
,((select count(s_id) from score where s_score>=90 and c_id=c.c_id )/(select count(s_id) from score where c_id=c.c_id)) "优秀率"
from course c
left join score sc on sc.c_id=c.c_id 
left join score sc2 on sc2.c_id=c.c_id 
left join score sc3 on sc3.c_id=c.c_id 
group by c.c_id

-- 19、按各科成绩进行排序，并显示排名(实现不完全)
-- mysql没有rank函数
-- 加@score是为了防止用union all 后打乱了顺序
select c1.s_id,c1.c_id,c1.c_name,@score:=c1.s_score,@i:=@i+1 from (select c.c_name,sc.* from course c 
left join score sc on sc.c_id=c.c_id
where c.c_id="01" order by sc.s_score desc) c1 ,
(select @i:=0) a
union all 
select c2.s_id,c2.c_id,c2.c_name,c2.s_score,@ii:=@ii+1 from (select c.c_name,sc.* from course c 
left join score sc on sc.c_id=c.c_id
where c.c_id="02" order by sc.s_score desc) c2 ,
(select @ii:=0) aa 
union all
select c3.s_id,c3.c_id,c3.c_name,c3.s_score,@iii:=@iii+1 from (select c.c_name,sc.* from course c 
left join score sc on sc.c_id=c.c_id
where c.c_id="03" order by sc.s_score desc) c3;
set @iii=0;


-- 20、查询学生的总成绩并进行排名
select st.s_id,st.s_name
,(case when sum(sc.s_score) is null then 0 else sum(sc.s_score) end)
 from student st
left join score sc on sc.s_id=st.s_id
group by st.s_id order by sum(sc.s_score) desc

-- 21、查询不同老师所教不同课程平均分从高到低显示 
select t.t_id,t.t_name,c.c_name,avg(sc.s_score) from teacher t 
left join course c on c.t_id=t.t_id 
left join score sc on sc.c_id =c.c_id
group by t.t_id
order by avg(sc.s_score) desc

-- 22、查询所有课程的成绩第2名到第3名的学生信息及该课程成绩
select a.* from (
select st.*,c.c_id,c.c_name,sc.s_score from student st
left join score sc on sc.s_id=st.s_id
inner join course c on c.c_id =sc.c_id and c.c_id="01"
order by sc.s_score desc LIMIT 1,2 ) a
union all
select b.* from (
select st.*,c.c_id,c.c_name,sc.s_score from student st
left join score sc on sc.s_id=st.s_id
inner join course c on c.c_id =sc.c_id and c.c_id="02"
order by sc.s_score desc LIMIT 1,2) b
union all
select c.* from (
select st.*,c.c_id,c.c_name,sc.s_score from student st
left join score sc on sc.s_id=st.s_id
inner join course c on c.c_id =sc.c_id and c.c_id="03"
order by sc.s_score desc LIMIT 1,2) c

-- 23、统计各科成绩各分数段人数：课程编号,课程名称,[100-85],[85-70],[70-60],[0-60]及所占百分比
select c.c_id,c.c_name 
,((select count(1) from score sc where sc.c_id=c.c_id and sc.s_score<=100 and sc.s_score>80)/(select count(1) from score sc where sc.c_id=c.c_id )) "100-85"
,((select count(1) from score sc where sc.c_id=c.c_id and sc.s_score<=85 and sc.s_score>70)/(select count(1) from score sc where sc.c_id=c.c_id )) "85-70"
,((select count(1) from score sc where sc.c_id=c.c_id and sc.s_score<=70 and sc.s_score>60)/(select count(1) from score sc where sc.c_id=c.c_id )) "70-60"
,((select count(1) from score sc where sc.c_id=c.c_id and sc.s_score<=60 and sc.s_score>=0)/(select count(1) from score sc where sc.c_id=c.c_id )) "60-0"
from course c order by c.c_id

-- 24、查询学生平均成绩及其名次 
set @i=0;
select a.*,@i:=@i+1 from (
select st.s_id,st.s_name,round((case when avg(sc.s_score) is null then 0 else avg(sc.s_score) end),2) "平均分" from student st
left join score sc on sc.s_id=st.s_id
group by st.s_id order by sc.s_score desc) a

-- 25、查询各科成绩前三名的记录
select a.* from (
 select st.s_id,st.s_name,c.c_id,c.c_name,sc.s_score from student st
 left join score sc on sc.s_id=st.s_id
 inner join course c on c.c_id=sc.c_id and c.c_id='01'
 order by sc.s_score desc LIMIT 0,3) a
union all 
select b.* from (
 select st.s_id,st.s_name,c.c_id,c.c_name,sc.s_score from student st
 left join score sc on sc.s_id=st.s_id
 inner join course c on c.c_id=sc.c_id and c.c_id='02'
 order by sc.s_score desc LIMIT 0,3) b
union all
select c.* from (
 select st.s_id,st.s_name,c.c_id,c.c_name,sc.s_score from student st
 left join score sc on sc.s_id=st.s_id
 inner join course c on c.c_id=sc.c_id and c.c_id='03'
 order by sc.s_score desc LIMIT 0,3) c

-- 26、查询每门课程被选修的学生数 
select c.c_id,c.c_name,count(1) from course c 
left join score sc on sc.c_id=c.c_id
inner join student st on st.s_id=c.c_id
group by st.s_id

-- 27、查询出只有两门课程的全部学生的学号和姓名
select st.s_id,st.s_name from student st 
left join score sc on sc.s_id=st.s_id
inner join course c on c.c_id=sc.c_id 
group by st.s_id having count(1)=2

-- 28、查询男生、女生人数
select st.s_sex,count(1) from student st group by st.s_sex

-- 29、查询名字中含有"风"字的学生信息
select st.* from student st where st.s_name like "%风%";

-- 30、查询同名同性学生名单，并统计同名人数 
select st.*,count(1) from student st group by st.s_name,st.s_sex having count(1)>1

-- 31、查询1990年出生的学生名单
select st.* from student st where st.s_birth like "1990%";

-- 32、查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列 
select c.c_id,c.c_name,avg(sc.s_score) from course c
inner join score sc on sc.c_id=c.c_id  
group by c.c_id order by avg(sc.s_score) desc,c.c_id asc

-- 33、查询平均成绩大于等于85的所有学生的学号、姓名和平均成绩
select st.s_id,st.s_name,avg(sc.s_score) from student st
left join score sc on sc.s_id=st.s_id
group by st.s_id having avg(sc.s_score)>=85

-- 34、查询课程名称为"数学"，且分数低于60的学生姓名和分数 
select st.s_id,st.s_name,sc.s_score from student st
inner join score sc on sc.s_id=st.s_id and sc.s_score<60
inner join course c on c.c_id=sc.c_id and c.c_name ="数学" 

-- 35、查询所有学生的课程及分数情况；
select st.s_id,st.s_name,c.c_name,sc.s_score from student st
left join score sc on sc.s_id=st.s_id
left join course c on c.c_id =sc.c_id
order by st.s_id,c.c_name

-- 36、查询任何一门课程成绩在70分以上的姓名、课程名称和分数
select st2.s_id,st2.s_name,c2.c_name,sc2.s_score from student st2
left join score sc2 on sc2.s_id=st2.s_id
left join course c2 on c2.c_id=sc2.c_id 
where st2.s_id in(
select st.s_id from student st 
left join score sc on sc.s_id=st.s_id 
group by st.s_id having min(sc.s_score)>=70)
order by s_id

-- 37、查询不及格的课程
select st.s_id,c.c_name,st.s_name,sc.s_score from student st
inner join score sc on sc.s_id=st.s_id and  sc.s_score<60
inner join course c on c.c_id=sc.c_id 

-- 38、查询课程编号为01且课程成绩在80分以上的学生的学号和姓名
select st.s_id,st.s_name,sc.s_score from student st
inner join score sc on sc.s_id=st.s_id and sc.c_id="01" and sc.s_score>=80

-- 39、求每门课程的学生人数
select c.c_id,c.c_name,count(1) from course c
inner join score sc on sc.c_id=c.c_id
group by c.c_id

-- 40、查询选修"张三"老师所授课程的学生中，成绩最高的学生信息及其成绩 
select st.*,c.c_name,sc.s_score,t.t_name from student st
inner join score sc on sc.s_id=st.s_id
inner join course c on c.c_id=sc.c_id 
inner join teacher t on t.t_id=c.t_id and  t.t_name="张三"
order by sc.s_score desc
limit 0,1

-- 41、查询不同课程成绩相同的学生的学生编号、课程编号、学生成绩 
select st.s_id,st.s_name,sc.c_id,sc.s_score from student st 
left join score sc on sc.s_id=st.s_id
left join course c on c.c_id=sc.c_id
where (
select count(1) from student st2 
left join score sc2 on sc2.s_id=st2.s_id
left join course c2 on c2.c_id=sc2.c_id
where sc.s_score=sc2.s_score and c.c_id!=c2.c_id 
)>1

-- 42、查询每门功成绩最好的前两名 
select a.* from (select st.s_id,st.s_name,c.c_name,sc.s_score from student st
left join score sc on sc.s_id=st.s_id
inner join course c on c.c_id=sc.c_id and c.c_id="01"
order by sc.s_score desc limit 0,2) a
union all
select b.* from (select st.s_id,st.s_name,c.c_name,sc.s_score from student st
left join score sc on sc.s_id=st.s_id
inner join course c on c.c_id=sc.c_id and c.c_id="02"
order by sc.s_score desc limit 0,2) b
union all
select c.* from (select st.s_id,st.s_name,c.c_name,sc.s_score from student st
left join score sc on sc.s_id=st.s_id
inner join course c on c.c_id=sc.c_id and c.c_id="03"
order by sc.s_score desc limit 0,2) c
 
-- 借鉴(更准确,漂亮):
 select a.s_id,a.c_id,a.s_score from score a
 where (select COUNT(1) from score b where b.c_id=a.c_id and b.s_score>=a.s_score)<=2 order by a.c_id

-- 43、统计每门课程的学生选修人数（超过5人的课程才统计）。要求输出课程号和选修人数，查询结果按人数降序排列，
--     若人数相同，按课程号升序排列  
select sc.c_id,count(1) from score sc
left join course c on c.c_id=sc.c_id
group by c.c_id having count(1)>5
order by count(1) desc,sc.c_id asc

-- 44、检索至少选修两门课程的学生学号 
select st.s_id from student st 
left join score sc on sc.s_id=st.s_id
group by st.s_id having count(1)>=2

-- 45、查询选修了全部课程的学生信息
select st.* from student st 
left join score sc on sc.s_id=st.s_id
group by st.s_id having count(1)=(select count(1) from course)

-- 46、查询各学生的年龄
 select st.*,timestampdiff(year,st.s_birth,now()) from student st

-- 47、查询本周过生日的学生
  -- 此处可能有问题,week函数取的为当前年的第几周,2017-12-12是第50周而2018-12-12是第49周,可以取月份,day,星期几(%w),
  -- 再判断本周是否会持续到下一个月进行判断,太麻烦,不会写
select st.* from student st 
where week(now())=week(date_format(st.s_birth,'%Y%m%d'))

-- 48、查询下周过生日的学生
select st.* from student st 
where week(now())+1=week(date_format(st.s_birth,'%Y%m%d'))

-- 49、查询本月过生日的学生
select st.* from student st 
where month(now())=month(date_format(st.s_birth,'%Y%m%d'))

-- 50、查询下月过生日的学生
 -- 注意:当 当前月为12时,用month(now())+1为13而不是1,可用timestampadd()函数或mod取模
select st.* from student st 
where month(timestampadd(month,1,now()))=month(date_format(st.s_birth,'%Y%m%d'))
-- 或
select st.* from student st where (month(now()) + 1) mod 12 = month(date_format(st.s_birth,'%Y%m%d'))
