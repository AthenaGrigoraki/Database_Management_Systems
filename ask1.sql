USE hy460;

DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts (
 accId INTEGER NOT NULL PRIMARY KEY,
 balance DECIMAL(11,2) NOT NULL,
 CONSTRAINT empty_account CHECK (balance >= 0.00)
);

INSERT INTO accounts (accId, balance) VALUES (1, 10.99);
INSERT INTO accounts (accId, balance) VALUES (2, 150);
INSERT INTO accounts (accId, balance) VALUES (3, 2789);
INSERT INTO accounts (accId, balance) VALUES (4, 34.6);
INSERT INTO accounts (accId, balance) VALUES (5, 0);
INSERT INTO accounts (accId, balance) VALUES (6, 0.01);
INSERT INTO accounts (accId, balance) VALUES (7, 999999999.99);
COMMIT;


/*START TRANSACTION;
UPDATE accounts SET balance = balance - 300 WHERE accId=3; 
UPDATE accounts SET balance = balance + 300 WHERE accId=7; 
*/

DROP PROCEDURE IF EXISTS hy460.transfer_money;

DELIMITER //
CREATE PROCEDURE hy460.transfer_money(IN accid_give INT,IN accid_receive INT)

BEGIN
DECLARE new_error BOOLEAN;
DECLARE balance_of_sender DECIMAL(11,2);
DECLARE balance_of_receiver DECIMAL(11,2);
DECLARE CONTINUE HANDLER FOR 3819
		BEGIN
        SET new_error=TRUE;
		SELECT 'constraint is violated, sender has less than 300.';
		ROLLBACK;
		END;
        
DECLARE CONTINUE HANDLER FOR 1264
		BEGIN
        SET new_error=TRUE;
		SELECT 'out of range -> value at maximum, receiver cannot get 300.';
		ROLLBACK;
		END;
        
DECLARE CONTINUE HANDLER FOR NOT FOUND
		BEGIN
        SET new_error=TRUE;
		SELECT 'Account does not exist, invalid ID';
		ROLLBACK;
		END;


SELECT balance INTO balance_of_sender FROM accounts WHERE accId=accid_give;
SELECT balance INTO balance_of_receiver FROM accounts WHERE accId=accid_receive;
UPDATE accounts SET balance = balance - 300 WHERE accId=accid_give; 
UPDATE accounts SET balance = balance + 300 WHERE accId=accid_receive;
COMMIT;

IF accid_give=accid_receive THEN
SET new_error=true;
SELECT 'sender cannot be the same as receiver';
ROLLBACK;
END IF;




END//





CREATE FUNCTION hy460.row_lock(accid_give INT,accid_receive INT)
RETURNS BOOLEAN
BEGIN
DECLARE balance_of_locked DECIMAL(11,2);
DECLARE lock0 BOOLEAN;
DECLARE CONTINUE HANDLER FOR NOT FOUND
		BEGIN
        SET lock0=FALSE;
		SELECT 'Account does not exist, invalid ID';
		RETURN lock0;
		END;
SELECT balance INTO balance_of_locked FROM accounts WHERE (accId=accid_receive OR accId=accid_give) FOR UPDATE NOWAIT;
SET lock0=TRUE;
RETURN lock0;

END;




BEGIN
DECLARE x BOOLEAN;

SET x=hy460.row_lock(3,1);
IF x=TRUE THEN CALL hy460.transfer_money(3,1);
COMMIT;
ELSE SELECT 'Locking failed';
END IF;


END;
SELECT * FROM accounts;

DELIMITER ;