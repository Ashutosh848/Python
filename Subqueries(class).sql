select name,salary from emp where salary>(select avg(salary) from emp);

select name from emp where department_id in(select dept_id from dept where dept_id in(101,102));

select name
from emp e
where exists (select 1 from emp where department_id = e.department_id and salary>60000);

select name
from emp e
where name in (select name from emp where department_id = e.department_id and salary>60000);

select name,salary,
(select avg(salary) from emp where department_id = e.department_id) as Avg_Salary
from emp e;

select e.name,d.name
from emp e inner join dept d
on e.department_id = d.dept_id
where e.salary>(select avg(salary) from emp where department_id = e.department_id);

select name,salary 
from emp e 
where salary>(select avg(salary) from emp where department_id = e.department_id );

select name 
from emp
where salary = (select max(salary) from emp);

select d.name from dept d where dept_id = 
(select department_id from emp
group by department_id order by count(*) desc limit 1);

select * from emp where department_id not in (select department_id from emp where department_id = 102);



#new Assignment
#Q1.
select name,salary from emp where salary>(select avg(salary) from emp);

#Q2.
select name from emp where department_id = (select department_id from emp
group by department_id order by count(*) desc limit 1);

#Q3
select department_id,avg(salary) from emp group by department_id;

#Q4
select d.dept_id
from dept d inner join emp e
on d.dept_id = e.department_id group by d.dept_id order by max(e.salary) desc limit 1;

select * from emp;

select name,salary from emp e
where department_id = (select d.dept_id
from dept d inner join emp e
on d.dept_id = e.department_id where d.name = 'hr' group by d.dept_id ) order by salary;


select name from emp where department_id = (select department_id from emp
                                                       where emp_id = 5);
													
select department_id,max(salary) from emp group by department_id;


select name,department_id,max(salary) over(partition by department_id) from emp; 


select name from emp where department_id = (select dept_id from dept group by dept_id order by count(*) desc limit 1);

select department_id from emp group by department_id having count(*)>2;

select name from emp where salary>(select avg(salary) from emp where
                                                department_id in(select department_id from emp 
												group by department_id having count(*)>2)) and 
												department_id in (select department_id from emp 
												group by department_id having count(*)>2);
                                                














