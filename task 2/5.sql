select isnull (employees.name,'Unassigned"' ), department.name 

from employees left join department 

on department.id = employees.dept_id
--توضيح في الصوره الي بعدها