-- This statement creates an index named 'idx_name_first_score' on the 
-- 'name' and 'score' columns in the 'names' table. The index uses only 
-- the first character of the 'name' and 'score' columns. This type of 
-- index can be useful for optimizing queries that filter or sort based 
-- on the initial character of these columns.
CREATE INDEX idx_name_first_score ON names(name(1), score);
