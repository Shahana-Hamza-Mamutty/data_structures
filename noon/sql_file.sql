select concat('There are total',' ',count(occupation),' ',lower(occupation),'s.') as total
from occupations
group by occupation
order by total

set @r1=0, @r2=0, @r3=0, @r4=0;
select min(Doctor), min(Professor), min(Singer), min(Actor)
from(
  select case when Occupation='Doctor' then (@r1:=@r1+1)
            when Occupation='Professor' then (@r2:=@r2+1)
            when Occupation='Singer' then (@r3:=@r3+1)
            when Occupation='Actor' then (@r4:=@r4+1) end as RowNumber,
    case when Occupation='Doctor' then Name end as Doctor,
    case when Occupation='Professor' then Name end as Professor,
    case when Occupation='Singer' then Name end as Singer,
    case when Occupation='Actor' then Name end as Actor
  from OCCUPATIONS
  order by Name
) Temp
group by RowNumber

SELECT N, IF(P IS NULL,'Root',IF((SELECT COUNT(*) FROM BST WHERE P=B.N)>0,'Inner','Leaf')) FROM BST AS B ORDER BY N;


select c.company_code, c.founder, 
    count(distinct l.lead_manager_code), count(distinct s.senior_manager_code), 
    count(distinct m.manager_code),count(distinct e.employee_code) 
from Company c, Lead_Manager l, Senior_Manager s, Manager m, Employee e 
where c.company_code = l.company_code 
    and l.lead_manager_code=s.lead_manager_code 
    and s.senior_manager_code=m.senior_manager_code 
    and m.manager_code=e.manager_code 
group by c.company_code order by c.company_code;


select round(abs(min(lat_n)-max(lat_n))+abs(min(long_w)-max(long_w)),4) from station;

SELECT NAME, GRADE, MARKS FROM STUDENTS 
JOIN GRADES
ON MARKS BETWEEN MIN_MARK AND MAX_MARK
ORDER BY GRADE DESC, MARKS;


select h.hacker_id, h.name
from hackers h
join submissions s
on h.hacker_id=s.hacker_id
join challenges c
on s.challenge_id=c.challenge_id
join difficulty d
on c.difficulty_level=d.difficulty_level
where s.score=d.score
group by h.hacker_id, h.name
having count(*) > 1
order by count(*) desc, h.hacker_id;


select w.id, p.age, w.coins_needed, w.power 
from Wands as w 
join Wands_Property as p 
on (w.code = p.code) 
where p.is_evil = 0 
and w.coins_needed = (
	select min(coins_needed) 
	from Wands as w1 
	join Wands_Property as p1 
	on (w1.code = p1.code) 
	where w1.power = w.power and p1.age = p.age
	) 
order by w.power desc, p.age desc


SELECT tbl.*
FROM TableName tbl
  INNER JOIN
  (
    SELECT Id, MIN(Point) MinPoint
    FROM TableName
    GROUP BY Id
  ) tbl1
  ON tbl1.id = tbl.id
WHERE tbl1.MinPoint = tbl.Point



select t1.id, t2.age, t2.cn, t2.power
from Wands t1
join
(select  wp.age, w.code,  MIN(w.coins_needed) cn, w.power 
from Wands_Property wp
join Wands w
on wp.code=w.code
 where wp.is_evil=0
GROUP BY w.code, wp.age, w.power 
) t2
on t1.code=t2.code and t2.power=t2.power and t2.cn=t1.coins_needed
order by t2.power desc, t2.age desc


/* these are the columns we want to output */
select c.hacker_id, h.name ,count(c.hacker_id) as c_count

/* this is the join we want to output them from */
from Hackers as h
    inner join Challenges as c on c.hacker_id = h.hacker_id

/* after they have been grouped by hacker */
group by c.hacker_id

/* but we want to be selective about which hackers we output */
/* having is required (instead of where) for filtering on groups */
having 

    /* output anyone with a count that is equal to... */
    c_count = 
        /* the max count that anyone has */
        (SELECT MAX(temp1.cnt)
        from (SELECT COUNT(hacker_id) as cnt
             from Challenges
             group by hacker_id
             order by hacker_id) temp1)

    /* or anyone who's count is in... */
    or c_count in 
        /* the set of counts... */
        (select t.cnt
         from (select count(*) as cnt 
               from challenges
               group by hacker_id) t
         /* who's group of counts... */
         group by t.cnt
         /* has only one element */
         having count(t.cnt) = 1)

/* finally, the order the rows should be output */
order by c_count DESC, c.hacker_id

/* ;) */
;


select s.name
from Students s
join Friends f
on s.id=f.id
join Packages p1
on s.id = p1.id
join Packages p2
on f.Friend_ID = p2.id
where p1.Salary < p2.Salary
order by p2.Salary;



# second highest salary

SELECT (SELECT distinct(Salary) FROM `Employee` order by Salary desc LIMIT 1 OFFSET 1) SecondHighestSalary;
 
 -- nth highest salary
DECLARE M INT;
SET M=N-1;
SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT M, 1

--  rank the scores
select *, rank() over(order by score desc) as 'Rank' from Scores;
select Score, dense_rank() over(order by score desc) as 'Rank' from Scores;

select  Department,Employee, Salary
from (select d.Name as Department, e.Name Employee,e.Salary, dense_rank() over(PARTITION by DepartmentId order by Salary desc) as 'Rank'
from Employee e
join Department d
on e.DepartmentId=d.Id) tmp
where tmp.Rank < 4;