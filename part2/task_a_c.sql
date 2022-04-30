 SELECT table_name, blocks, empty_blocks 
 FROM user_tables
 WHERE table_name not like '%$%';