--Procedura dla zwracania ilosci visytow klienta
CREATE OR REPLACE PROCEDURE countVisitOfKliet(v_name VARCHAR, v_surname VARCHAR, v_visitId OUT NUMBER)
IS
BEGIN
  SELECT count(*) INTO v_visitId
  FROM OSOBA, VISIT
  WHERE OSOBA.OSOBA_ID = VISIT.OSOBA_ID;
  dbms_output.put_line('Kilent ' || v_name || ' ' || v_surname || ' był w hotelu ' ||  '"' || v_return || '" raz(y)');
END;

Set Serveroutput on;
DECLARE
    V_return NUMBER;
BEGIN
    countVisitOfKliet('Den', 'Kowalski', v_return);
END;

--Zmiena status pokoju jeżeli wizyty już skonczywy
CREATE OR REPLACE PROCEDURE UpdateRoomStatusIfVisitDone
IS
v_date VISIT.DATETO%type;
v_roomid VISIT.Room_id%type;
CURSOR CursorVisit IS SELECT DateTo, ROOM_ID FROM VISIT;
BEGIN
  OPEN CursorVisit;
  LOOP
    FETCH CursorVisit INTO v_date, v_roomid;
    EXIT WHEN CursorVisit%NOTFOUND;
      IF v_date < CURRENT_DATE THEN
        UPDATE ROOM
        SET STATUS = 'wolny'
        WHERE ROOM.ROOM_ID = v_roomid;
      ELSE
        UPDATE ROOM
        SET STATUS = 'zajęty'
        WHERE ROOM.ROOM_ID = v_roomid;
      END IF;
  END LOOP;
  CLOSE CursorVisit;
END;
BEGIN
UpdateRoomStatusIfVisitDone;
END;
--check
SELECT * FROM ROOM; --1
ROLLBACK;           --2
SELECT * FROM ROOM; --3

--Za kazdym razem kiedy zmienie się order, wypisze ile zapłaciw kazdy klient
CREATE OR REPLACE TRIGGER costOfOrdersAllKlient
AFTER INSERT OR UPDATE OR DELETE
ON "ORDER"
DECLARE
  x NUMBER := 0;
  v_osobaid NUMBER;
  v_mealid NUMBER;
  v_orderid NUMBER;
  v_name OSOBA.name%type;
  v_surname OSOBA.surname%type;
  v_cost meal.cost%TYPE;
  CURSOR CursorOrder IS SELECT OSOBA_ID, MEAL_ID, ORDER_ID FROM "ORDER";
  BEGIN
  OPEN CursorOrder;
  LOOP
    FETCH CursorOrder INTO v_osobaid, v_mealid, v_orderid;
    EXIT WHEN CursorOrder%NOTFOUND;

    SELECT name, surname INTO v_name, v_surname
    FROM OSOBA
    WHERE OSOBA.OSOBA_ID = v_osobaid;

    SELECT sum(cost) INTO v_cost
    FROM meal, "ORDER"
    WHERE MEAL.MEAL_ID = v_mealid AND "ORDER".MEAL_ID = v_mealid AND "ORDER".ORDER_ID = v_orderid AND OSOBA_ID = v_osobaid;

    dbms_output.put_line('Klient ' || v_name || ' ' || v_surname || ' stracił: ' || v_cost || 'zł w zamowienu ' || v_orderid );
  END LOOP;
  CLOSE CursorOrder;
END;

Set Serveroutput on;
UPDATE "ORDER"
SET MEAL_ID = 2
WHERE OSOBA_ID = 1;

--Sprawdza czy Activity idzie dobrze 
CREATE OR REPLACE TRIGGER ActivityChekingTrigger
BEFORE DELETE OR INSERT OR UPDATE ON Activity
FOR EACH ROW
DECLARE
  v_zm NUMBER;
BEGIN
  IF :new.ROOM_ID = :old.ROOM_ID AND :new."DATE" = :old."DATE" AND :new.name = :old.name THEN
    dbms_output.put_line('Nie można robić odnakowe activity w jeden dzień!');
    --ROLLBACK;
  ELSIF :new.ROOM_ID = :old.ROOM_ID AND :new."DATE" = :old."DATE" AND :new.OSOBA_ID = :old.OSOBA_ID   THEN
    dbms_output.put_line('jedno activity na dzień!');
    --ROLLBACK;
  END IF;
END;

UPDATE ACTIVITY
SET ROOM_ID = 1
WHERE OSOBA_ID = 5;