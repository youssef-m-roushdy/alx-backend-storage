-- This trigger resets the 'valid_email' flag to 0 in the 'users' table
-- whenever an email address is updated. It checks if the old email 
-- address is different from the new one; if so, it sets the 
-- 'valid_email' column to 0 before the update is completed.

DROP TRIGGER IF EXISTS reset_valid_email;

DELIMITER //
CREATE TRIGGER reset_valid_email 
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF OLD.email <> NEW.email THEN
        SET NEW.valid_email = 0;
    END IF;
END//
DELIMITER ;
