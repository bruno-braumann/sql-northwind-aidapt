# SQL Server — Northwind Database Exercises

A collection of SQL exercises based on the **Northwind** database, from the **Databases SQL** module of the AiDAPT course at Cegid Academy.
All scripts were developed and tested in **SQL Server (T-SQL)**.

---

## Repository Structure

| File | Content |
|---|---|
| `Northwind_Bruno_Braumann.sql` | 15 practical exercises on SELECT, WHERE, CASE, and JOINs |

---

## About the Database

Northwind is a sample database provided by Microsoft, simulating a fictional trading company that imports and exports specialty foods. It includes tables for customers, suppliers, products, orders, employees, and shippers.

---

## Exercises

### Exercise 1
Show the first name, last name, and birth date of employees who are Sales Managers, ordered by birth date.

### Exercise 2
Create a list of employees with the full name in uppercase in a single column, and create an output column called Gender, based on the Title of Courtesy field (Mrs. and Ms. are female, Mr. is male). Employees without a defined gender should appear as Unknown.

### Exercise 3
Select all supplier companies and their contact person from Germany.

### Exercise 4
Create a list of supplier companies and their contact person that are not from the United States.

### Exercise 5
Select all customer IDs and names from the United Kingdom and London.

### Exercise 6
Identify customers from the United Kingdom who are not based in London.

### Exercise 7
Select the contact persons of suppliers whose contact title starts with "Marketing" or ends with "Marketing".

### Exercise 8
Show all suppliers that are Japanese and work in marketing, or all suppliers that are business owners.

### Exercise 9
Create a list of customers with the customer name, country, region, and city. When the region field is null, show "Region not defined".

### Exercise 10
Identify suppliers with whom we work that have no website or fax number.

### Exercise 11
Select all customers that are not from Italy, France, or Spain.

### Exercise 12
Show the supplier company name, contact person name, and contact title, where those who are Owners should appear as "Owner - Not specified".

### Exercise 13
Show all orders where the Freight value is between 5 and 10, shipped to the United States, and for which the shipping date is known.

### Exercise 14
Select orders for which the shipping date is unknown and the region is also unknown.

### Exercise 15
Create a list of orders shipped to the United Kingdom with Freight below 40, or orders whose CustomerID is "ALFKI" with Freight also below 40.

---

## Topics Covered

- `SELECT`, `DISTINCT`, `TOP`, `ORDER BY`
- `WHERE`, `LIKE`, `AND`, `OR`, `NOT IN`, `BETWEEN`, `IS NULL`
- `CASE WHEN` with multiple conditions
- String functions: `UPPER()`

---

## Technologies

![SQL Server](https://img.shields.io/badge/SQL%20Server-T--SQL-CC2927?style=flat&logo=microsoftsqlserver&logoColor=white)

---

*AiDAPT Course — Cegid Academy | Module: Databases SQL*
