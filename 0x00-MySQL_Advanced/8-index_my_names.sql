-- This statement creates an index named 'idx_name_first' on the 'name' 
-- column in the 'names' table. Indexing the 'name' column will improve 
-- the performance of queries that filter or sort data based on this column.

CREATE INDEX idx_name_first ON names(name(1));
