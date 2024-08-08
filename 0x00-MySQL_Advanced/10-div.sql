-- This function 'SafeDiv' performs a division operation with two integer 
-- inputs: 'a' and 'b'. It returns the result as a decimal value with 
-- two decimal places. If the divisor 'b' is zero, the function returns 0 
-- to prevent division by zero errors.

DROP FUNCTION IF EXISTS SafeDiv;
DELIMITER //

CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE result DECIMAL(10, 2);

    IF b = 0 THEN
        RETURN 0;
    ELSE
        SET result = a / b;
        RETURN result;
    END IF;
END //

DELIMITER ;
