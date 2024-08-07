-- This trigger updates the quantity of an item in the 'items' table
-- after a new row is inserted into the 'orders' table. It decreases
-- the quantity of the item specified in the 'orders' table by the 
-- number of units ordered.

DELIMITER //

CREATE TRIGGER update_item_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items
    SET quantity = quantity - NEW.number
    WHERE name = NEW.item_name;
END//

DELIMITER ;
