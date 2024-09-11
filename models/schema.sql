-- Drop the clients table if it exists
DROP TABLE IF EXISTS clients;

-- Create the funding_sources table
CREATE TABLE funding_sources (
    id SERIAL PRIMARY KEY,
    source_name VARCHAR(50) NOT NULL
);

-- Create the clients table
CREATE TABLE clients (
    id UUID PRIMARY KEY,  -- The id is of type UUID, provided by the Express app
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    main_language VARCHAR(50) NOT NULL,
    secondary_language VARCHAR(50),
    funding_source_id INT,
    FOREIGN KEY (funding_source_id) REFERENCES funding_sources(id)
);

-- Insert data into funding_sources table
INSERT INTO funding_sources (source_name) 
VALUES 
    ('NDIS'), 
    ('HCP'), 
    ('CHSP'), 
    ('DVA'), 
    ('HACC');

-- Insert 50 records into the clients table
INSERT INTO clients (id, name, date_of_birth, main_language, secondary_language, funding_source_id)
VALUES 
    (gen_random_uuid(), 'John Doe', '1985-01-01', 'English', 'Spanish', 1),
    (gen_random_uuid(), 'Jane Smith', '1990-02-15', 'English', 'French', 2),
    (gen_random_uuid(), 'Alice Johnson', '1978-03-30', 'English', NULL, 3),
    (gen_random_uuid(), 'Bob Brown', '2000-04-22', 'English', 'German', 4),
    (gen_random_uuid(), 'Carol White', '1982-05-05', 'English', 'Italian', 5),
    (gen_random_uuid(), 'David Green', '1995-06-12', 'French', 'English', 1),
    (gen_random_uuid(), 'Eva Black', '1988-07-07', 'Spanish', 'English', 2),
    (gen_random_uuid(), 'Frank Harris', '1980-08-19', 'German', 'English', 3),
    (gen_random_uuid(), 'Grace Lee', '1975-09-25', 'Italian', 'French', 4),
    (gen_random_uuid(), 'Henry Wilson', '2001-10-14', 'English', 'Spanish', 5),
    (gen_random_uuid(), 'Ivy Young', '1993-11-09', 'English', NULL, 1),
    (gen_random_uuid(), 'Jack Allen', '1986-12-17', 'French', 'Spanish', 2),
    (gen_random_uuid(), 'Kimberly Scott', '1999-01-24', 'German', 'English', 3),
    (gen_random_uuid(), 'Liam Turner', '1983-02-19', 'English', 'Italian', 4),
    (gen_random_uuid(), 'Mona Adams', '1987-03-30', 'Spanish', 'French', 5),
    (gen_random_uuid(), 'Nina Baker', '1992-04-18', 'English', 'German', 1),
    (gen_random_uuid(), 'Oliver Carter', '1981-05-27', 'French', 'English', 2),
    (gen_random_uuid(), 'Pamela Evans', '1997-06-05', 'Italian', 'Spanish', 3),
    (gen_random_uuid(), 'Quinn Foster', '1989-07-13', 'English', 'French', 4),
    (gen_random_uuid(), 'Rachel Gray', '1994-08-22', 'German', NULL, 5),
    (gen_random_uuid(), 'Samuel Harris', '2002-09-01', 'English', 'Italian', 1),
    (gen_random_uuid(), 'Tina Clark', '1991-10-14', 'French', 'Spanish', 2),
    (gen_random_uuid(), 'Ulysses Lewis', '1984-11-09', 'Spanish', 'German', 3),
    (gen_random_uuid(), 'Victoria Nelson', '1996-12-20', 'English', 'French', 4),
    (gen_random_uuid(), 'William Mitchell', '1980-01-30', 'Italian', 'English', 5),
    (gen_random_uuid(), 'Xena Reed', '1985-02-28', 'German', 'French', 1),
    (gen_random_uuid(), 'Yvonne Morgan', '1990-03-17', 'Spanish', 'English', 2),
    (gen_random_uuid(), 'Zachary Ward', '2000-04-25', 'French', NULL, 3),
    (gen_random_uuid(), 'Angela Ross', '1987-05-12', 'English', 'Spanish', 4),
    (gen_random_uuid(), 'Brian Cooper', '1992-06-08', 'Italian', 'French', 5),
    (gen_random_uuid(), 'Catherine Bell', '1994-07-21', 'English', 'German', 1),
    (gen_random_uuid(), 'Daniel Morgan', '1989-08-16', 'Spanish', 'English', 2),
    (gen_random_uuid(), 'Evelyn Harris', '1998-09-30', 'French', 'Spanish', 3),
    (gen_random_uuid(), 'Freddie King', '1981-10-05', 'Italian', 'German', 4),
    (gen_random_uuid(), 'Gloria Adams', '1997-11-14', 'English', 'French', 5),
    (gen_random_uuid(), 'Henry Turner', '1990-12-23', 'Spanish', 'English', 1),
    (gen_random_uuid(), 'Isabella Davis', '1985-01-11', 'German', 'French', 2),
    (gen_random_uuid(), 'James White', '1993-02-19', 'English', 'Italian', 3),
    (gen_random_uuid(), 'Katherine Scott', '1996-03-12', 'Spanish', 'German', 4),
    (gen_random_uuid(), 'Liam Young', '2002-04-24', 'French', 'English', 5),
    (gen_random_uuid(), 'Monica Lewis', '1991-05-19', 'Italian', 'Spanish', 1),
    (gen_random_uuid(), 'Nathaniel Clark', '1988-06-06', 'German', 'English', 2),
    (gen_random_uuid(), 'Olivia Martinez', '2000-07-14', 'French', 'Spanish', 3),
    (gen_random_uuid(), 'Paul King', '1984-08-28', 'English', 'Italian', 4),
    (gen_random_uuid(), 'Quinn Nelson', '1999-09-22', 'Spanish', 'German', 5),
    (gen_random_uuid(), 'Rebecca Carter', '1992-10-16', 'English', NULL, 1),
    (gen_random_uuid(), 'Samantha Harris', '1995-11-01', 'French', 'Spanish', 2),
    (gen_random_uuid(), 'Thomas Evans', '1987-12-12', 'Italian', 'English', 3),
    (gen_random_uuid(), 'Ursula Gray', '2001-01-29', 'German', 'French', 4),
    (gen_random_uuid(), 'Victor Roberts', '1994-02-24', 'English', 'Spanish', 5),
    (gen_random_uuid(), 'Wendy Mitchell', '1983-03-17', 'Spanish', 'French', 1),
    (gen_random_uuid(), 'Xander Wilson', '1989-04-21', 'French', 'German', 2),
    (gen_random_uuid(), 'Yasmine Baker', '1996-05-12', 'English', 'Italian', 3),
    (gen_random_uuid(), 'Zane Adams', '2000-06-15', 'German', 'English', 4);    
