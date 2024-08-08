-- This view 'need_meeting' selects the names of students from the 'students' 
-- table who have a score less than 80 and either have not had a meeting 
-- or had their last meeting more than one month ago. This view can be used 
-- to identify students who may need to be scheduled for a meeting to address 
-- their performance issues.

CREATE VIEW need_meeting AS
SELECT name
FROM students
WHERE score < 80
AND (last_meeting IS NULL OR last_meeting < DATE_SUB(NOW(), INTERVAL 1 MONTH));
