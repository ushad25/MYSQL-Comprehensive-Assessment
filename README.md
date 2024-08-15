# Library Management System

## Introduction
The Library Management System is designed to efficiently manage the operations and information of a library. It helps in keeping track of all aspects related to books, customers, employees, and branches.

## Database Schema

### Branch
- **Branch_no:** Primary key, unique identifier for each branch.
- **Manager_Id:** Identifier for the manager of the branch.
- **Branch_address:** Address of the branch.
- **Contact_no:** Contact number of the branch.

### Employee
- **Emp_Id:** Primary key, unique identifier for each employee.
- **Emp_name:** Name of the employee.
- **Position:** Job position or role of the employee.
- **Salary:** Salary of the employee.
- **Branch_no:** Foreign key referencing `Branch_no` in the Branch table, indicating the branch where the employee works.

### Books
- **ISBN:** Primary key, unique identifier for each book.
- **Book_title:** Title of the book.
- **Category:** Category or genre of the book.
- **Rental_Price:** Rental price of the book.
- **Status:** Indicates if the book is available ('yes') or not available ('no').
- **Author:** Author of the book.
- **Publisher:** Publisher of the book.

### Customer
- **Customer_Id:** Primary key, unique identifier for each customer.
- **Customer_name:** Name of the customer.
- **Customer_address:** Address of the customer.
- **Reg_date:** Registration date of the customer.

### IssueStatus
- **Issue_Id:** Primary key, unique identifier for each issued book.
- **Issued_cust:** Foreign key referencing `Customer_Id` in the Customer table, indicating the customer who issued the book.
- **Issued_book_name:** Name of the book issued.
- **Issue_date:** Date when the book was issued.
- **Isbn_book:** Foreign key referencing `ISBN` in the Books table, indicating the book that was issued.

### ReturnStatus
- **Return_Id:** Primary key, unique identifier for each returned book.
- **Return_cust:** Identifier for the customer who returned the book.
- **Return_book_name:** Name of the book returned.
- **Return_date:** Date when the book was returned.
- **Isbn_book2:** Foreign key referencing `ISBN` in the Books table, indicating the book that was returned.



## Conclusion

The Library Management System is an essential tool designed to streamline library operations, enhance user experience, and maintain an efficient workflow. By incorporating features such as book management, customer management, employee management, and branch management, this system meets a wide range of needs within a library setting. Implementing this system enables libraries to optimize resource utilization, improve operational efficiency, and continue serving as valuable repositories of knowledge and culture in their communities.

