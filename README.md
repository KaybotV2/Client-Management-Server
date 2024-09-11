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