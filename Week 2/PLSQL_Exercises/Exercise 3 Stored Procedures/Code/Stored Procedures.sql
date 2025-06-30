-- Scenario 1: ProcessMonthlyInterest Procedure
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest()
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE accounts
    SET balance = balance + (balance * 0.01)
    WHERE accounttype = 'Savings';
END;
$$;
SELECT accountid, accounttype, balance FROM accounts WHERE accounttype = 'Savings';
CALL ProcessMonthlyInterest();
SELECT accountid, accounttype, balance FROM accounts WHERE accounttype = 'Savings';

-- Scenario 2: UpdateEmployeeBonus Procedure
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(dept TEXT, bonus_percent NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE employees
    SET salary = salary + (salary * (bonus_percent / 100))
    WHERE department = dept;
END;
$$;
SELECT name, department, salary FROM employees WHERE department = 'IT';
CALL UpdateEmployeeBonus('IT', 10);
SELECT name, department, salary FROM employees WHERE department = 'IT';


-- Scenario 3: TransferFunds Procedure
CREATE OR REPLACE PROCEDURE TransferFunds(from_acc INT, to_acc INT, amt NUMERIC)
LANGUAGE plpgsql
AS $$
DECLARE
    source_balance NUMERIC;
BEGIN
    SELECT balance INTO source_balance FROM accounts WHERE accountid = from_acc;

    IF source_balance IS NULL THEN
        RAISE EXCEPTION 'Source account not found.';
    ELSIF source_balance < amt THEN
        RAISE EXCEPTION 'Insufficient balance.';
    END IF;


    UPDATE accounts
    SET balance = balance - amt
    WHERE accountid = from_acc;

    UPDATE accounts
    SET balance = balance + amt
    WHERE accountid = to_acc;
END;
$$;
SELECT accountid, balance FROM accounts WHERE accountid IN (1, 2);
CALL TransferFunds(1, 2, 200);
SELECT accountid, balance FROM accounts WHERE accountid IN (1, 2);