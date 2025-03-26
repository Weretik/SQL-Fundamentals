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