create database if not exists library;
use library;

-- create brach table
create table if not exists Branch (
    Branch_no int primary key,
    Manager_Id int,
    Branch_address varchar(255),
    Contact_no varchar(20)
);



-- Create  Employee table
create table if not exists Employee (
    Emp_Id int primary key,
    Emp_name varchar(100),
    Position varchar(100),
    Salary decimal(10, 2),
    Branch_no int,
    foreign key (Branch_no) references Branch(Branch_no)
);
select * from Employee;

-- Create the Books table
create table if not exists Books (
    ISBN varchar(20) primary key,
    Book_title varchar(255),
    Category varchar(100),
    Rental_Price decimal(10, 2),
    status enum('yes', 'no'),
    Author varchar(100),
    Publisher varchar(100)
);
select * from Books;


-- Create  Customer table
create table if not exists Customer (
    Customer_Id int primary key,
    Customer_name varchar(100),
    Customer_address varchar(255),
    Reg_date date
);
select * from Customer;

-- Create  IssueStatus table
create table if not exists  IssueStatus (
    Issue_Id int primary key,
    Issued_cust int,
    Issued_book_name varchar(255),
    Issue_date date,
    Isbn_book varchar(20),
    foreign key (Issued_cust) references Customer(Customer_Id),
    foreign key (Isbn_book) references Books(ISBN)
);
select * from IssueStatus;

-- Create  ReturnStatus table
create table if not exists  ReturnStatus (
    Return_Id int primary key,
    Return_cust int,
    Return_book_name varchar(255),
    Return_date date,
    Isbn_book2 varchar(20),
    foreign key (Return_cust) references Customer(Customer_Id),
	foreign key (Isbn_book2) references Books(ISBN)
);
select * from ReturnStatus;

show tables;

-- insert 10 elements to each table

insert into Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
values
(200, 101, '123  Street', '123-456-7890'),
(201, 102, '456  Street', '987-654-3210'),
(202, 103, '789  Street', '555-555-5555'),
(203, 104, '321  Street', '111-222-3333'),
(204, 105, '567  Street', '444-333-2222'),
(205, 107, '234  Street', '999-888-7777'),
(206, 108, '876  Street', '333-222-1111'),
(207, 109, '432  Street', '777-999-1111'),
(208, 110, '678 Street', '111-222-3333');
select * from Branch;

insert into Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
values
(20, 'Usha', 'Manager', 60000, 200),
(21, 'sannitha k', 'Assistant Manager', 45000, 200),
(22, 'rahul tv', 'Librarian', 40000, 201),
(23, 'lekha ck', 'Clerk', 35000, 202),
(24, 'biju nair', 'Clerk', 30000, 203),
(25, 'shivanand kb', 'Manager', 58000, 204),
(26, 'devakrishnan', 'Assistant Manager', 42000, 205),
(27, 'devananda', 'Librarian', 38000, 206),
(28, 'Sophia ', 'Clerk', 32000, 207),
(29, 'alice', 'Clerk', 28000, 208);
select * from Employee;


insert into Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
values
('978-0143126560', '1984', 'Fiction', 10.99, 'yes', 'George Orwell', 'Penguin Books'),
('978-1400079983', 'The Kite Runner', 'Fiction', 12.99, 'yes', 'Khaled Hosseini', 'Riverhead Books'),
('978-0143038254', 'To Kill a Mockingbird', 'Fiction', 9.99, 'no', 'Harper Lee', 'Harper Perennial'),
('978-0743273565', 'The Catcher in the Rye', 'Fiction', 11.99, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0446310789', 'To Kill a Mockingbird', 'Fiction', 9.99, 'yes', 'Harper Lee', 'Harper Perennial'),
('978-0670020553', 'The Goldfinch', 'Fiction', 14.99, 'yes', 'Donna Tartt', 'Little, Brown and Company'),
('978-0385537858', 'All the Light We Cannot See', 'Fiction', 13.99, 'yes', 'Anthony Doerr', 'Scribner'),
('978-0316769174', 'The Bell Jar', 'Fiction', 10.99, 'yes', 'Sylvia Plath', 'Harper Perennial Modern Classics'),
('978-0061120080', 'To Kill a Mockingbird', 'Fiction', 9.99, 'yes', 'Harper Lee', 'Harper Perennial'),
('978-0735219090', 'Where the Crawdads Sing', 'Fiction', 15.99, 'yes', 'Delia Owens', 'G.P. Putnam\'s Sons');
select * from Books;

insert into Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
values
(201, 'arun', '1234 Park Ave', '2021-12-15'),
(202, 'Sarah ', '5678 Elm St', '2020-11-20'),
(203, 'David ', '9876 Pine St', '2022-01-05'),
(204, 'nike', '5432 Oak St', '2023-03-10'),
(205, 'albart', '8765 Maple St', '2022-05-25'),
(206, 'jane', '234 Cedar St', '2022-08-15'),
(207, 'Jessica ', '890 Rose St', '2021-06-30');
select * from Customer;


insert into  IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
values
(501, 201, '1984', '2023-05-20', '978-0143126560'),
(502, 202, 'The Kite Runner', '2022-12-25', '978-1400079983'),
(503, 203, 'To Kill a Mockingbird', '2022-09-30', '978-0143038254'),
(504, 204, 'The Catcher in the Rye', '2023-06-15', '978-0743273565'),
(505, 205, 'The Goldfinch', '2022-11-20', '978-0670020553'),
(506, 206, 'Where the Crawdads Sing', '2023-01-25', '978-0735219090'),
(507, 207, 'All the Light We Cannot See', '2022-08-20', '978-0385537858'),
(508, 201, 'The Bell Jar', '2023-04-30', '978-0316769174'),
(509, 202, 'To Kill a Mockingbird', '2022-11-05', '978-0061120080'),
(510, 203, 'To Kill a Mockingbird', '2023-04-10', '978-0061120080');
select * from IssueStatus;
insert into ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
values
(601, 201, '1984', '2023-06-10', '978-0143126560'),
(602, 202, 'The Kite Runner', '2023-01-05', '978-1400079983'),
(603, 203, 'To Kill a Mockingbird', '2022-10-10', '978-0143038254'),
(604, 204, 'The Catcher in the Rye', '2023-06-05', '978-0743273565'),
(605, 205, 'The Goldfinch', '2023-01-30', '978-0670020553'),
(606, 206, 'Where the Crawdads Sing', '2023-06-05', '978-0735219090'),
(607, 207, 'All the Light We Cannot See', '2022-09-05', '978-0385537858'),
(608, 201, 'The Bell Jar', '2023-05-15', '978-0316769174'),
(609, 202, 'To Kill a Mockingbird', '2023-01-20', '978-0061120080'),
(610, 203, 'To Kill a Mockingbird', '2023-05-25', '978-0061120080');
select * from ReturnStatus;




#1

select Book_title, Category, Rental_Price
from Books
where status = 'yes';

#2

select emp_name, salary
from employee
order by salary desc;

#3
select b.book_title, c.customer_name
from issuestatus i
join books b on i.isbn_book = b.isbn
join customer c on i.issued_cust = c.customer_id;

#4
select Category, COUNT(*) as Total_Count
from Books
group by Category;


#5
select emp_name, position
from employee
where salary > 50000;

#6
select customer_name
from customer
where reg_date < '2022-01-01'
and customer_id not in (select issued_cust from issuestatus);

#7

select branch_no, count(*) as total_employees
from employee
group by branch_no;

#8
select distinct c.customer_name
from customer c
join issuestatus i on c.customer_id = i.issued_cust
where year(i.issue_date) = 2023 and month(i.issue_date) = 6;

#9
insert into Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
values('978-0735219097',' Gandhi','history',10.99, 'yes', 'Mahatma Gandhi.', 'Penguin Books');
select book_title
from books
where category = 'history';

#10
select branch_no, count(*) as total_employees
from employee
group by branch_no
having count(*) > 5;

#11
select e.emp_name, b.branch_address
from employee e
join branch b on e.branch_no = b.branch_no
where e.position = 'manager';

#12
select distinct c.customer_name
from customer c
join issuestatus i on c.customer_id = i.issued_cust
join books b on i.isbn_book = b.isbn
where b.rental_price > 25;

select distinct c.customer_name
from customer c
join issuestatus i on c.customer_id = i.issued_cust
join books b on i.isbn_book = b.isbn
where b.rental_price > 25;












