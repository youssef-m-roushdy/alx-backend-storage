-- This stored procedure 'ComputeAverageWeightedScoreForUser' calculates the 
-- weighted average score for a specific user based on their scores in various 
-- projects. It takes one input parameter: user_id, representing the user's ID. 
-- The procedure calculates the weighted average score by multiplying each score 
-- by its associated project's weight, dividing by the total weight, and updates 
-- the 'average_score' column in the 'users' table with this computed value.

DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN

    DECLARE weighted_avg_score FLOAT;

    SELECT 
        SUM(c.score * p.weight) / SUM(p.weight) INTO weighted_avg_score
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = user_id;

    UPDATE users
    SET average_score = weighted_avg_score
    WHERE id = user_id;
END //

DELIMITER ;
