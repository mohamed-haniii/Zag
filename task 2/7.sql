select first_name + ' '+ last_name as Full_name , order_id ,amount 

from Customers full join Orders 

on(Customers.customer_id=Orders.customer_id)