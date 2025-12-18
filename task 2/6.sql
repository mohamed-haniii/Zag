select product_name,supplier_name 

from Products left join Suppliers 

on(products.supplier_id=suppliers.supplier_id)

where product_name like '%Phone%'