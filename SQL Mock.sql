/*Mock Test*/
-- No.1 
Select ORDERS.ORDER_ID, ORDERS.STORE_ID, ORDERS.USER_ID
From ORDERS
    Inner Join USERS
    On USERS.USER_ID = ORDERS.USER_ID
Where FIRST_NAME = 'Marion';

-- No.2
Select * 
From USERS
Where USER_ID not in 
      (Select USER_ID
      From ORDERS);
      
-- No.3
Select ITEMS.NAME, ITEMS.PRICE
From ITEMS
      Inner Join ORDER_ITEMS
      On ITEMS.ITEM_ID = ORDER_ITEMS.ITEM_ID
Where Order_Items.ORDER_ID In 
      (Select ORDER_ITEMS.ORDER_ID
        From ORDER_ITEMS
        Group by Order_Items.ORDER_ID
        Having Count(Order_Items.ORDER_ID)> 1)
Group By ITEMS.NAME,ITEMS.PRICE;

-- No. 4
Select ORDERS.Order_Id, ITEMS.Name, ITEMS.Price, ORDER_ITEMS.Quantity 
from ORDER_ITEMS
      Inner Join ITEMS
      On ORDER_ITEMS.ITEM_ID = ITEMS.ITEM_ID
      Inner Join ORDERS
      On ORDER_ITEMS.ORDER_ID = ORDERS.ORDER_ID
      Inner Join STORES
      On ORDERS.STORE_ID = STORES.STORE_ID
Where STORES.CITY In 'New York'
Order By ORDERS.ORDER_ID ASC;

-- No. 5
Select Name AS "ITEM_NAME", SUM(ITEMS.Price*ORDER_ITEMS.Quantity) AS "REVENUE"
From ITEMS
      Inner Join ORDER_ITEMS
      On ITEMS.ITEM_ID = ORDER_ITEMS.ITEM_ID
Group By ITEMS.NAME
Order By REVENUE DESC;

-- No. 6
Select STORES.Name, Count(ORDERS.ORDER_ID) AS "Order_Quantity", 
      (CASE 
          When Count(ORDERS.ORDER_ID) > 3 then 'High'
          --When Count(ORDERS.ORDER_ID) < 3 and Count(ORDERS.ORDER_ID) >1 then 'Medium'
          When Count(ORDERS.ORDER_ID) <= 1 then 'Low'
        Else 'Medium'
        End) AS "Sales Figure"
From STORES
      Inner Join ORDERS
      On STORES.STORE_ID = ORDERS.STORE_ID
Group By STORES.Name
Order By Count(ORDERS.ORDER_ID) DESC;
