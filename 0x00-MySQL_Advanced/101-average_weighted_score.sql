-- This stored procedure 'ComputeAverageWeightedScoreForUsers' calculates and 
-- updates the weighted average score for all users based on their scores in 
-- various projects. It performs the following steps:
-- 
-- 1. Joins the 'users' table with a subquery that calculates the weighted 
--    average score for each user by multiplying each score by its associated 
--    project's weight, then dividing by the total weight.
-- 2. Updates the 'average_score' column in the 'users' table with the computed 
--    weighted average score for each user.

DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    UPDATE users u
    JOIN (
        SELECT 
            c.user_id,
            SUM(c.score * p.weight) / SUM(p.weight) AS weighted_avg_score
        FROM corrections c
        JOIN projects p ON c.project_id = p.id
        GROUP BY c.user_id
    ) avg_scores ON u.id = avg_scores.user_id
    SET u.average_score = avg_scores.weighted_avg_score;
END //

DELIMITER ;
