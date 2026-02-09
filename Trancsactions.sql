select * from parent
select * from parent_event
select * from fees_schedule


-- TRANSEACTIONS

select * from fees_schedule

BEGIN TRANSACTION

UPDATE fees_schedule
SET payment_date = '2026-02-09',
	payment_amount = amount_due
WHERE fees_schedule_id = 5 and fees_schedule_id = 8;

COMMIT;

select * from fees_schedule;

-- TRANSACTION FOR INSERTING VALUES
BEGIN TRANSACTION;
	INSERT INTO parent_event (
		event_type_id,
		parent_id,
		timing
	) VALUES(
		2,11,'2025-02-01 10:00:00.000'
	)

	INSERT INTO fees_schedule (
		parent_id,
		payment_due,
		amount_due,
		payment_date,
		payment_amount
	) VALUES (
		11,
		'2026-02-10',
		100,
		'2026-02-11',
		500
	)
COMMIT;


-- TRANSACTION FOR UPDATING IN MULTIPLE TABLES USING TRY-CATCH
BEGIN TRY
	BEGIN TRANSACTION
		
		UPDATE fees_schedule
		SET 
			payment_date = '2026-02-01',
			payment_amount = 400
		WHERE fees_schedule_id = 5;

		UPDATE fees_schedule
		SET 
			payment_date = '2026-02-01',
			payment_amount = 260
		WHERE fees_schedule_id = 8;

		INSERT INTO fees_schedule (fees_schedule_id)
		VALUES (5)
		
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
END CATCH;


	
SELECT * FROM child


-- SEQUENCE
CREATE SEQUENCE seq_child_id
	AS INT
	START WITH 18
	INCREMENT BY 1;


CREATE PROCEDURE ups_AddChild
	@parent_id INT,
    @gender CHAR(1),
    @first_name VARCHAR(100),
    @last_name VARCHAR(100),
    @date_of_birth DATE,
    @height_cm INT
AS 
BEGIN
		
		DECLARE @child_id INT;

		BEGIN TRY
			BEGIN TRANSACTION;
			
				SET @child_id = NEXT VALUE FOR seq_child_id;

				INSERT INTO child (
					child_id,
					parent_id,
					gender,
					first_name,
					last_name,
					date_of_birth,
					height_cm
				) VALUES (
					@child_id,
					@parent_id,
					@gender,
					@first_name	,
					@last_name,
					@date_of_birth,
					@height_cm
				)
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
		END CATCH;
END;

EXEC  ups_AddChild
	@parent_id = 1,
	@gender = 'M',
	@first_name = 'Chirayu'	,
	@last_name = 'Singh',
	@date_of_birth = '2003-03-15',
	@height_cm = 186


