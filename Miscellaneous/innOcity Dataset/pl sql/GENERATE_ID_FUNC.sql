CREATE OR REPLACE FUNCTION "GENERATE_ID"(TABLE_NAME IN VARCHAR2, COLUMN_NAME IN VARCHAR2) RETURN NUMBER
AS
	ID NUMBER;
	EXISTING NUMBER;
	SQ VARCHAR2(100);
BEGIN
	LOOP 
		ID := ROUND(10000000 + DBMS_RANDOM.VALUE() * (99999999-10000000));
		SQ := 'SELECT COUNT(*) FROM ' || TABLE_NAME || ' WHERE ' || COLUMN_NAME || ' = :1';
		EXECUTE IMMEDIATE SQ INTO EXISTING USING ID;
		EXIT WHEN (EXISTING = 0);
	END LOOP;
	RETURN ID;
END;