"# MYSQL-Comprehensive-Assessment" 

Introduction:
The Library Management System is designed to efficiently manage the operations and information of a library. It helps in keeping track of all aspects related to books, customers, employees, and branches.

Database Schema:

Branch:

Branch_no: Primary key, unique identifier for each branch.
Manager_Id: Identifier for the manager of the branch.
Branch_address: Address of the branch.
Contact_no: Contact number of the branch.

Employee:

Emp_Id: Primary key, unique identifier for each employee.
Emp_name: Name of the employee.
Position: Job position or role of the employee.
Salary: Salary of the employee.
Branch_no: Foreign key referencing Branch_no in the Branch table, indicates the branch where the employee works.

Books:

ISBN: Primary key, unique identifier for each book.
Book_title: Title of the book.
Category: Category or genre of the book.
Rental_Price: Rental price of the book.
Status: Indicates if the book is available ('yes') or not available ('no').
Author: Author of the book.
Publisher: Publisher of the book.

Customer:

Customer_Id: Primary key, unique identifier for each customer.
Customer_name: Name of the customer.
Customer_address: Address of the customer.
Reg_date: Registration date of the customer.

IssueStatus:

Issue_Id: Primary key, unique identifier for each issued book.
Issued_cust: Foreign key referencing Customer_Id in the Customer table, indicates the customer who issued the book.
Issued_book_name: Name of the book issued.
Issue_date: Date when the book was issued.
Isbn_book: Foreign key referencing ISBN in the Books table, indicates the book that was issued.

ReturnStatus:

Return_Id: Primary key, unique identifier for each returned book.
Return_cust: Identifier for the customer who returned the book.
Return_book_name: Name of the book returned.
Return_date: Date when the book was returned.
Isbn_book2: Foreign key referencing ISBN in the Books table, indicates the book that was returned.

This database schema facilitates the organization and management of library-related data, allowing for efficient tracking of books, customers, employees, and branches.
Here's a list of queries with explanations for the Library Management System:

1.Retrieve the book title, category, and rental price of all available books:
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';
Retrieve the book title, category, and rental price of all available books:

2.List the employee names and their respective salaries in descending order of salary:

SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;
This query retrieves the names and salaries of employees, sorted in descending order of salary.

3.Retrieve the book titles and the corresponding customers who have issued those books:

SELECT i.Issued_book_name, c.Customer_name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id;
This query retrieves the book titles and the corresponding customers who have issued those books.

4.Display the total count of books in each category:

SELECT Category, COUNT(*) AS Total_Count
FROM Books
GROUP BY Category;
This query displays the total count of books in each category.

5.Retrieve the employee names and their positions for employees whose salaries are above Rs. 50,000:

SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;
This query retrieves the names and positions of employees whose salaries are above Rs. 50,000.

6.List the customer names who registered before 2022-01-01 and have not issued any books yet:


SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);
This query lists the customer names who registered before January 1, 2022, and have not issued any books yet.

7.Display the branch numbers and the total count of employees in each branch:

SELECT e.Branch_no, COUNT(*) AS Total_Employees
FROM Employee e
GROUP BY e.Branch_no;
This query displays the branch numbers and the total count of employees in each branch.

8.Display the names of customers who have issued books in the month of June 2023:

SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE YEAR(i.Issue_date) = 2023 AND MONTH(i.Issue_date) = 6;
This query displays the names of customers who have issued books in June 2023.

9.Retrieve book titles from the book table containing history:

SELECT Book_title
FROM Books
WHERE Category = 'History';
This query retrieves book titles from the Books table containing the category 'History'.

10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees:

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;
This query retrieves the branch numbers along with the count of employees for branches having more than 5 employees.

11.Retrieve the names of employees who manage branches and their respective branch addresses:

SELECT e.Emp_name, b.Branch_address
FROM Employee e
JOIN Branch b ON e.Branch_no = b.Branch_no
WHERE e.Position = 'Manager';
This query retrieves the names of employees who manage branches and their respective branch addresses.

12.Display the names of customers who have issued books with a rental price higher than Rs. 25:

SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
JOIN Books b ON i.Isbn_book = b.ISBN
WHERE b.Rental_Price > 25;
This query displays the names of customers who have issued books with a rental price higher than Rs. 25.

These queries provide insights and facilitate various operations in the Library Management System, such as book management, employee management, customer interactions, and branch management.

conclusion:
The Library Management System is an essential tool for libraries to streamline operations, enhance user experience, and maintain an efficient workflow. It offers features like book, customer, employee, and branch management to meet diverse needs. By investing in this system, libraries can optimize resource utilization and continue serving as valuable repositories of knowledge and culture in their communities.














