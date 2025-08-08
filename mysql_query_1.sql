-- 1. Combine the menu_items and order_details tables into a single table.
select * from menu_items;
select * from order_details;
     select * 
   from order_details 
od LEFT JOIN menu_items mi 
	 ON od.item_id = mi.menu_item_id;

-- 2. What were the least and most ordered items? What categories were they in?
select item_name, COUNT(order_details_id) AS num_purchases
from order_details od LEFT JOIN menu_items mi 
	 ON od.item_id = mi.menu_item_id
GROUP BY item_name
ORDER BY num_purchases;

select item_name, COUNT(order_details_id) AS num_purchases
from order_details od LEFT JOIN menu_items mi 
	 ON od.item_id = mi.menu_item_id
GROUP BY item_name
ORDER BY num_purchases DESC;


-- 3. What were the top 5 orders that spent the most money?
select order_id, SUM(price) AS total_spend
from order_details od LEFT JOIN menu_items mi 
	 ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;

-- 4. View the details of the hightest spend order. What insights can you gather from the table ?
select category, COUNT(item_id) AS num_items
from order_details od LEFT JOIN menu_items mi 
	 ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;
     
-- 5. View the details of the top 5 highest spend orders. What insights can you gather from the table ?
select order_id, category, COUNT(item_id) AS num_items
from order_details od LEFT JOIN menu_items mi 
	 ON od.item_id = mi.menu_item_id
WHERE order_id in (440 , 2075, 1957, 330, 2675)
GROUP BY order_id,category;  