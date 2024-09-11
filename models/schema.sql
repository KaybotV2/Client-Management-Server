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
