CREATE OR REPLACE PROCEDURE "ADD_NEW_FREE_SERVICE"(HID IN NUMBER, FAC IN VARCHAR2,EXISTING OUT NUMBER) AS
	
BEGIN
	SELECT COUNT(*) INTO EXISTING FROM HOTEL_FACILITY WHERE HOTELID = HID AND FACILITIES = INITCAP(FAC);
	IF EXISTING = 0 THEN
		INSERT INTO HOTEL_FACILITY VALUES(HID, INITCAP(FAC));
	END IF;
END;