-- This stored procedure 'AddBonus' adds a bonus score for a user based on 
-- a specific project. It takes three input parameters: user_id, project_name, 
-- and score. The procedure first retrieves the project_id based on the 
-- project_name. If the project does not exist, it inserts a new record 
-- into the 'projects' table and uses the last inserted ID. Finally, it 
-- inserts the user_id, project_id, and score into the 'corrections' table.
DROP PROCEDURE IF EXISTS AddBonus;
DELIMITER //

CREATE PROCEDURE AddBonus(IN user_id INT, IN project_name VARCHAR(255), IN score INT)
BEGIN
    DECLARE project_id INT;

    SELECT id INTO project_id
    FROM projects
    WHERE name = project_name
    LIMIT 1;

    IF project_id IS NULL THEN
        INSERT INTO projects (name) VALUES (project_name);
        SET project_id = LAST_INSERT_ID();
    END IF;

    INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, project_id, score);
END //

DELIMITER ;