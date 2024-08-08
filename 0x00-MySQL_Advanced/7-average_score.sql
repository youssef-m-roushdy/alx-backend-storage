-- This stored procedure 'ComputeAverageScoreForUser' calculates the average 
-- score for a specific user based on the 'corrections' table. It takes one 
-- input parameter: p_user_id, which represents the user's ID. The procedure 
-- calculates the average score and updates the 'average_score' column in 
-- the 'users' table with the computed value for the corresponding user.
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;

DELIMITER //
CREATE PROCEDURE ComputeAverageScoreForUser(IN p_user_id INT)
BEGIN
    DECLARE avg_score DECIMAL(5,2);

    SELECT AVG(score) INTO avg_score
    FROM corrections
    WHERE user_id = p_user_id;

    UPDATE users
    SET average_score = avg_score
    WHERE id = p_user_id;

END //
DELIMITER ;
