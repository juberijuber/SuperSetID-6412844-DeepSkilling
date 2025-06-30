--SCENARIO 1 – Show Discount Applied to Loans
DO $$
DECLARE
    cust_id INT;
BEGIN
    FOR cust_id IN
        SELECT CustomerID
        FROM Customers
        WHERE EXTRACT(YEAR FROM age(CURRENT_DATE, DOB)) > 60
    LOOP
        UPDATE Loans
        SET InterestRate = InterestRate - 1
        WHERE CustomerID = cust_id;
    END LOOP;
END $$;

SELECT C.CustomerID, C.Name, EXTRACT(YEAR FROM age(CURRENT_DATE, DOB)) AS Age,
       L.LoanID, L.InterestRate
FROM Customers C
JOIN Loans L ON C.CustomerID = L.CustomerID;
-- SCENARIO 2 – Show VIP Customers
ALTER TABLE Customers ADD COLUMN IsVIP BOOLEAN DEFAULT FALSE;
DO $$
DECLARE
    cust_id INT;
BEGIN
    FOR cust_id IN
        SELECT CustomerID FROM Customers WHERE Balance > 10000
    LOOP
        UPDATE Customers SET IsVIP = TRUE WHERE CustomerID = cust_id;SELECT CustomerID, Name, Balance, IsVIP FROM Customers;
    END LOOP;
END $$;

-- SCENARIO 3 – Show Reminders for Loans Due in 30 Days
DO $$
DECLARE
    loan_rec RECORD;
BEGIN
    FOR loan_rec IN
        SELECT L.LoanID, C.Name, L.EndDate
        FROM Loans L
        JOIN Customers C ON C.CustomerID = L.CustomerID
        WHERE L.EndDate BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '30 days'
    LOOP
        RAISE NOTICE 'Reminder: Loan ID % for customer % is due on %', loan_rec.LoanID, loan_rec.Name, loan_rec.EndDate;
    END LOOP;
END $$;

