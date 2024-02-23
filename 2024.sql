-- Create a table called 'employees'
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Insert sample data into the 'employees' table
INSERT INTO employees (first_name, last_name, department, salary) 
VALUES 
    ('John', 'Doe', 'Finance', 50000.00),
    ('Jane', 'Smith', 'HR', 60000.00),
    ('Michael', 'Johnson', 'IT', 70000.00),
    ('Emily', 'Williams', 'Marketing', 55000.00);
This script creates a table named 'employees' with columns for emp
