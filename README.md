# SQL Fundamentals

## Overview

**SQL Fundamentals** is a foundational course focused on learning the basics of SQL through the **T-SQL dialect** used in Microsoft SQL Server. The course includes:

- Core SQL syntax and concepts
- Basic data manipulation (CRUD operations)
- Table creation and relational database design
- Practical work with real SQL queries and structures

## Project Structure

### 1. Introduction to SQL
- **Task 1**: Created a database named `MyDB`.
- **Task 2**: Defined and created three tables:
  1. Stores employee names and phone numbers
  2. Contains salary information and job titles
  3. Includes marital status, date of birth, and place of residence

> 📄 [1. Introduction to SQL.sql](./1.%20Introduction%20to%20SQL.sql)


### 2. T-SQL Queries
- **Task 1**: Created a database named `HomeWork` with a `Product` table. Defined columns: `ProductId`, `Name`, `ProductNumber`, `Cost`, `Count`, `SellStartDate`. Populated the table with 10 sample records.
- **Task 2**:
  - Selected products with a quantity greater than 59
  - Selected products priced above $3 and available since `20/08/2011`
- **Task 3**: Increased the price of **Sviatoch Chocolate** by $0.25

> 📄 [2. T-SQL_Queries.sql](./2.%20T-SQL_Queries.sql)


### 3. DDL Basics
- **Task 1**: Created a database with a maximum size of 100 MB and expected usage around 30 MB. Configured all necessary parameters. The transaction log was assigned to a separate physical disk (if available).
- **Task 2**: Designed a database for a wholesale warehouse with entities including suppliers, staff, and regular customers. Table fields were determined based on logical data modeling.

> 📄 [3. DDL basics.sql](./3.%20DDL%20basics.sql)


### 4. Database Design  
- **Task 2**: Created a database with a maximum size of 100 MB, with expected usage around 30 MB. Configured all required settings. The transaction log was placed on a separate physical disk (if available).  
- **Task 3**: Normalized the provided table to eliminate redundancy and ensure database normalization principles.  

> 📄 [4. Database design.sql](./4.%20Database%20design.sql)


### 5. JOIN-s
- **Task 1**: Created a database named `MyJoinsDB`.
- **Task 2**: Created three tables:
  1. Stores employee names and phone numbers
  2. Contains salary information and job titles (e.g., general director, manager, worker)
  3. Includes marital status, date of birth, and place of residence
- **Task 3**: Performed JOIN operations to:
  1. Retrieve employee contact data (phone numbers, place of residence)
  2. Get birth dates and phone numbers of unmarried employees
  3. Get birth dates and phone numbers of all managers

> 📄 [5. JOIN-s.sql](./5.%20JOIN-s.sql)


### 6. Nested Queries
- **Task 1**: Created a database named `MyJoinsDB`.
- **Task 2**: Created three tables:
  1. Stores employee names and phone numbers
  2. Contains salary information and job titles (e.g., general director, manager, worker)
  3. Includes marital status, date of birth, and place of residence
- **Task 3**: Used nested queries to:
  1. Retrieve employee contact data (phone numbers, place of residence)
  2. Get birth dates and phone numbers of unmarried employees
  3. Get birth dates and phone numbers of all managers

> 📄 [6. Nested queries.sql](./6.%20Nested%20queries.sql)


### 7. Representation. Stored Procedures. User Functions
- **Task 1**: Reviewed existing indexes in the `MyJoinsDB` database created in previous lessons.
- **Task 2**: Designed custom indexes for the previously created tables, providing justification for their necessity.
- **Task 3**: Created views for the following:
  - Employee contact data (phone numbers, place of residence)
  - Birth dates and phone numbers of unmarried employees
  - Birth dates and phone numbers of all managers
- **Task 4**: Created a new database named `MyFunkDB`.
- **Task 5**: Created three tables:
  1. Stores employee names and phone numbers
  2. Contains salary information and job titles (e.g., general director, manager, worker)
  3. Includes marital status, date of birth, and place of residence
- **Task 6**: Developed stored procedures and functions to:
  - Retrieve contact data of employees
  - Get birth dates and phone numbers of unmarried employees
  - Get birth dates and phone numbers of managers

> 📄 [7. Representation. Stored procedures. User functions.sql](./7.%20Representation.%20Stored%20procedures.%20User%20functions.sql)


## How to Use

1. Open the `.sql` file in **SQL Server Management Studio (SSMS)** or any compatible SQL editor.
2. Execute the queries step-by-step to:
   - Create databases
   - Create and populate tables
   - Run SELECT, UPDATE, and other operations

## Prerequisites

- SQL Server installed (any edition)
- Basic understanding of SQL
- SQL client such as SSMS or Azure Data Studio

## License

This project is licensed under the MIT License.