CREATE TRIGGER "INNOCITY"."RATING_TRIGGER" AFTER UPDATE OF "RATING" ON "INNOCITY"."RESERVATION" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
	HOTEL_RATING NUMBER;
	RATING_COUNT NUMBER;
BEGIN
	SELECT RATING, RATINGCOUNT INTO HOTEL_RATING, RATING_COUNT FROM HOTEL WHERE HOTELID = :OLD.HOTELID;
  IF :OLD.RATING IS NULL THEN
		
		HOTEL_RATING := (HOTEL_RATING * RATING_COUNT + :NEW.RATING)/(RATING_COUNT + 1);
		RATING_COUNT := RATING_COUNT + 1;
		
	ELSE 
		HOTEL_RATING := (HOTEL_RATING * RATING_COUNT - :OLD.RATING + :NEW.RATING )/RATING_COUNT;
		
	END IF;
	UPDATE HOTEL SET RATING = HOTEL_RATING, RATINGCOUNT = RATING_COUNT WHERE HOTELID = :OLD.HOTELID;
END;