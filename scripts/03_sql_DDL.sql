/* Create a New table called persons
With Columns: id, person_name, birth_date and Phone */
CREATE TABLE persons(
id INT NOT NULL,
person_name VARCHAR(50) NOT NULL,
birth_date DATE,
phone VARCHAR(15) NOT NULL,
CONSTRAINT pk_persons PRIMARY KEY (id)
);

SELECT * FROM persons

-- Add a new column called email to the persons table
ALTER TABLE persons 
ADD email VARCHAR(50) not null

-- Remove the column phone from the persons table
ALTER TABLE persons 
DROP COLUMN phone

-- Delet the table persons from the database 

DROP TABLE persons
