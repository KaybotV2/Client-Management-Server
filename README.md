# Node.js and Express.js REST API with PostgreSQL

This project demonstrates how to create a REST API using Node.js and Express.js, which interacts with a PostgreSQL database to perform basic CRUD operations.

## Install PostgreSQL

1. **Download and install PostgreSQL**:
   - Download PostgreSQL from the [official PostgreSQL website](https://www.postgresql.org/download/).
   - Follow the installation instructions for your operating system.

## Configure PostgreSQL

1. **Ensure PostgreSQL service is running**:
   - After installation, make sure the PostgreSQL service is running.

2. **Connect to the PostgreSQL server**:
   - Use the default user (`postgres`) and the password you set during installation to connect to the PostgreSQL server.

## Create a Database

1. **Open PostgreSQL command line tool (psql)**:
   - You can also use a graphical tool like pgAdmin (refer to the next section).

2. **Create a new database for the project**:
   ```sql
   CREATE DATABASE client_management;

## Download pgAdmin 4

1. **Download pgAdmin 4**:
   - Download pgAdmin 4 from the [official pgAdmin website](https://www.pgadmin.org/download/).

2. **Install pgAdmin 4**:
   - Follow the installation instructions for your operating system.

## Configure pgAdmin 4

1. **Open pgAdmin 4**:
   - Launch pgAdmin 4 on your system.

2. **Connect to your PostgreSQL server**:
   - Use the default user (`postgres`) and password to connect to your PostgreSQL server.

3. **Add the `client_management` database**:
   - Locate and add the `client_management` database you created earlier.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- **Node.js**: Ensure you have Node.js installed. [Download Node.js](https://nodejs.org/) if you haven't already.
- **npm**: Comes with Node.js. Alternatively, you can use Yarn as a package manager.

## Installation

1. **Clone the repository**

   Open your terminal and run the following command to clone the repository:

   ```bash
   git clone https://github.com/KaybotV2/Client-Management-Server.git

2. **Navigate to the Project Directory**

    ```bash
    cd client-management-Server

3. **Install dependencies**
    Use npm to install the required dependencies:
    ```bash
    npm install

4. **Execute SQL Script from `schema.sql`**

   - **Load the schema**: Execute the SQL script contained in `schema.sql` to set up the database schema. This script includes commands to create necessary tables and define their structure.
   - **Command-line execution**:
     - If using `psql`, run the following command:
       ```bash
       psql -U postgres -d client_management -f path/to/schema.sql
       ```
     - Ensure to replace `path/to/schema.sql` with the actual path to your `schema.sql` file.
   - **Using pgAdmin 4**:
     - Open pgAdmin 4, navigate to the `client_management` database, and use the query tool to load and execute the `schema.sql` script.



## Running the Application

1. **Start the development server**
    ```bash
    npm run dev

This will run the app in development mode. Open your browser and visit http://localhost:3000 to see the application.

# Clients API Documentation

This documentation provides details about the API endpoints for managing clients.

## Endpoints

### 1. Retrieve All Clients

- **Endpoint**: `GET /clients`
- **Description**: Retrieves a list of all clients.
- **Response**:
  - **Status Code**: `200 OK`
  - **Body**: An array of client objects. Each object contains the following fields:
    - `id`: UUID of the client
    - `name`: Name of the client
    - `date_of_birth`: Date of birth of the client
    - `main_language`: Main language spoken by the client
    - `secondary_language`: Secondary language spoken by the client (optional)
    - `funding_source_id`: ID of the funding source associated with the client

  ```json
  [
    {
      "id": "uuid",
      "name": "John Doe",
      "date_of_birth": "YYYY-MM-DD",
      "main_language": "English",
      "secondary_language": "Spanish",
      "funding_source_id": 1
    }
    // More client objects...
  ]

### 2. Retrieve Client by ID
- **Endpoint**: GET /clients/:id
- **Description**: Retrieves a single client by its ID.
- **Parameters**: id (path parameter): UUID of the client to retrieve.
- **Response**: 
   - Status Code: 200 OK (if client found)
   - Status Code: 404 Not Found (if client not found)
- **Body**: A client object with the following fields:
   - `id`: UUID of the client
   - `name`: Name of the client
   - `date_of_birth`: Date of birth of the client
   - `main_language`: Main language spoken by the client
   - `secondary_language`: Secondary language spoken by the client (optional)
   - `funding_source_id`: ID of the funding source associated with the client

   ```json
   {
   "id": "uuid",
   "name": "John Doe",
   "date_of_birth": "YYYY-MM-DD",
   "main_language": "English",
   "secondary_language": "Spanish",
   "funding_source_id": 1
   }

## 3. Create a New Client

- **Endpoint**: `POST /clients`
- **Description**: Creates a new client.

### Request Body
- **Content-Type**: `application/json`
- **Body**: A client object with the following fields:
  - `name`: Name of the client (required)
  - `date_of_birth`: Date of birth of the client (required, format: YYYY-MM-DD)
  - `main_language`: Main language spoken by the client (required)
  - `secondary_language`: Secondary language spoken by the client (optional)
  - `funding_source_id`: ID of the funding source associated with the client (optional)

### Response
- **Status Code**: `201 Created`
- **Body**: The created client object with an additional `id` field.

  ```json
  {
    "id": "uuid",
    "name": "John Doe",
    "date_of_birth": "YYYY-MM-DD",
    "main_language": "English",
    "secondary_language": "Spanish",
    "funding_source_id": 1
  }



### 4. Update an Existing Client

- **Endpoint**: `PUT /clients/:id`
- **Description**: Updates an existing client by its ID.

#### Parameters
- `id` (path parameter): UUID of the client to update.

#### Request Body
- **Content-Type**: `application/json`
- **Body**: A client object with the fields to be updated. Fields are optional:
  - `name`: Name of the client
  - `date_of_birth`: Date of birth of the client (format: YYYY-MM-DD)
  - `main_language`: Main language spoken by the client
  - `secondary_language`: Secondary language spoken by the client (optional)
  - `funding_source_id`: ID of the funding source associated with the client (optional)

#### Response
- **Status Code**: `200 OK` (if client updated successfully)
- **Status Code**: `404 Not Found` (if client not found)
- **Body**: The updated client object.

  ```json
  {
    "id": "uuid",
    "name": "John Doe",
    "date_of_birth": "YYYY-MM-DD",
    "main_language": "English",
    "secondary_language": "Spanish",
    "funding_source_id": 1
  }


### 5. Delete a Client

- **Endpoint**: `DELETE /clients/:id`
- **Description**: Deletes a client by its ID.

#### Parameters
- `id` (path parameter): UUID of the client to delete.

#### Response
- **Status Code**: `204 No Content` (if client deleted successfully)
- **Status Code**: `404 Not Found` (if client not found)
