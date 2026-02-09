select * from Sales


CREATE SEQUENCE seq_sale_txn
    AS INT
    START WITH 1000
    INCREMENT BY 1;

CREATE TABLE sales_transaction (
    txn_id INT PRIMARY KEY,
    sale_id INT,
    txn_date DATETIME DEFAULT GETDATE(),
    total_amount DECIMAL(10,2)
);

CREATE TABLE sales_audit (
    audit_id INT IDENTITY(1,1) PRIMARY KEY,
    txn_id INT,
    action_type VARCHAR(20),
    action_date DATETIME DEFAULT GETDATE(),
    remarks VARCHAR(100)
);

CREATE PROCEDURE sp_process_sale
    @sale_id INT
AS
BEGIN
    DECLARE @txn_id INT;
    DECLARE @amount DECIMAL(10,2);

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Generate transaction number
        SET @txn_id = NEXT VALUE FOR seq_sale_txn;

        -- Get sale amount
        SELECT @amount = amount
        FROM sales
        WHERE sale_id = @sale_id;

        IF @amount IS NULL
            THROW 50001, 'Invalid sale_id', 1;

        -- Insert into transaction table
        INSERT INTO sales_transaction (txn_id, sale_id, total_amount)
        VALUES (@txn_id, @sale_id, @amount);

        -- Insert into audit table
        INSERT INTO sales_audit (txn_id, action_type, remarks)
        VALUES (@txn_id, 'INSERT', 'Sale processed successfully');

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
            ROLLBACK TRANSACTION;

            PRINT 'Transaction failed and rolled back';

            -- Optional: error details
            SELECT 
                ERROR_NUMBER()   AS ErrorNumber,
                ERROR_MESSAGE()  AS ErrorMessage,
                ERROR_LINE()     AS ErrorLine;
    END CATCH
END;

EXEC sp_process_sale @sale_id = 1

SELECT * FROM sales_transaction;
SELECT * FROM sales_audit;


