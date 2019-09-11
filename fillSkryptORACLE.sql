INSERT INTO Osoba (OSOBA_ID, Name, Surname) SELECT NVL(Max(OSOBA_ID), 0) + 1,'Den', 'Kowalski' FROM OSOBA;
INSERT INTO Osoba (OSOBA_ID, Name, Surname) SELECT NVL(Max(OSOBA_ID), 0) + 1, 'Ivan', 'Kowal' FROM OSOBA;
INSERT INTO Osoba (OSOBA_ID, Name, Surname) SELECT NVL(Max(OSOBA_ID), 0) + 1,'Piotr', 'Malin' FROM OSOBA;
INSERT INTO Osoba (OSOBA_ID, Name, Surname) SELECT NVL(Max(OSOBA_ID), 0) + 1,'Lolin', 'Kolin' FROM OSOBA;
INSERT INTO Osoba (OSOBA_ID, Name, Surname) SELECT NVL(Max(OSOBA_ID), 0) + 1,'Tata', 'Rata' FROM OSOBA;


INSERT INTO Klient(Osoba_Id, Phone_number, Email, Adress) VALUES(1, '111111111111', 'Den@gmail.com', 'Populara 62a');
INSERT INTO Klient(Osoba_Id, Phone_number, Email, Adress) VALUES(2, '222222222222', 'Ivan@gmail.com', 'Populara 63a');
INSERT INTO Klient(Osoba_Id, Phone_number, Email, Adress) VALUES(3, '333333333333', 'Piotr@gmail.com', 'Populara 64a');

INSERT INTO Worker(Osoba_Id, Position, Salary) VALUES (4, 'pokojowka', 1234);
INSERT INTO Worker(Osoba_Id, Position, Salary) VALUES (5, 'recepcion', 2345);

INSERT INTO Meal (MEAL_ID, Name, Cost) SELECT NVL(Max(MEAL_ID), 0) + 1, 'Kurczak', 20 FROM MEAL;
INSERT INTO Meal (MEAL_ID, Name, Cost) SELECT NVL(Max(MEAL_ID), 0) + 1, 'Frytki', 5 FROM MEAL;
INSERT INTO Meal (MEAL_ID, Name, Cost) SELECT NVL(Max(MEAL_ID), 0) + 1, 'Beaf', 25 FROM MEAL;
INSERT INTO Meal (MEAL_ID, Name, Cost) SELECT NVL(Max(MEAL_ID), 0) + 1, 'lody', 10 FROM MEAL;

INSERT INTO Room (ROOM_ID, NUMBERS, Status) SELECT NVL(MAX(ROOM_ID),0) + 1, 1, 'wolny' FROM ROOM;
INSERT INTO Room (ROOM_ID, NUMBERS, Status) SELECT NVL(MAX(ROOM_ID),0) +1, 2, 'zajęty' FROM ROOM;
INSERT INTO Room (ROOM_ID, NUMBERS, Status) SELECT NVL(MAX(ROOM_ID),0)+1, 3, 'wolny' FROM ROOM;
INSERT INTO Room (ROOM_ID, NUMBERS, Status) SELECT NVL(MAX(ROOM_ID),0)+1, 4, 'wolny' FROM ROOM;
INSERT INTO Room (ROOM_ID, NUMBERS, Status) SELECT NVL(MAX(ROOM_ID),0)+1, 5, 'przgotuje sie' FROM ROOM;

INSERT INTO Visit (VISIT_ID, DateFrom, DateTo, Cost, Osoba_Id, Room_id)
  SELECT NVL(MAX(VISIT_ID),0) + 1, TO_DATE('2017/12/31', 'YYYY/MM/DD'), TO_DATE('2018/01/31', 'YYYY/MM/DD'), '1234', 1, 1 FROM VISIT;
INSERT INTO Visit (VISIT_ID, DateFrom, DateTo, Cost, Osoba_Id, Room_id)
  SELECT NVL(MAX(VISIT_ID),0) + 1, TO_DATE('2017/12/30', 'YYYY/MM/DD'), TO_DATE('2018/01/15', 'YYYY/MM/DD'), '555', 2, 3 FROM VISIT;
INSERT INTO Visit (VISIT_ID, DateFrom, DateTo, Cost, Osoba_Id, Room_id)
  SELECT NVL(MAX(VISIT_ID),0) + 1, TO_DATE('2017/11/29', 'YYYY/MM/DD'), TO_DATE('2017/12/15', 'YYYY/MM/DD'), '555', 3, 4 FROM VISIT;

INSERT INTO "ORDER" (ORDER_ID, Osoba_Id, Meal_id, Date_time) SELECT NVL(MAX(ORDER_ID),0)+1, 1, 1, TO_DATE('2018/01/02', 'YYYY/MM/DD') FROM "ORDER";
INSERT INTO "ORDER" (ORDER_ID, Osoba_Id, Meal_id, Date_time) SELECT NVL(MAX(ORDER_ID),0)+1, 2, 2, TO_DATE('2018/01/02', 'YYYY/MM/DD') FROM "ORDER";
INSERT INTO "ORDER" (ORDER_ID, Osoba_Id, Meal_id, Date_time) SELECT NVL(MAX(ORDER_ID),0)+1, 3, 4, TO_DATE('2018/01/02', 'YYYY/MM/DD') FROM "ORDER";

INSERT INTO Activity (ACTIVITY_ID, Name, "DATE", Room_id, Osoba_Id)
  SELECT NVL(MAX(ACTIVITY_ID),0)+1, 'Cleaning', TO_DATE('2018/01/15','YYYY/MM/DD'), 3, 4 FROM  Activity;
INSERT INTO Activity (ACTIVITY_ID, Name, "DATE", Room_id, Osoba_Id)
  SELECT NVL(MAX(ACTIVITY_ID),0)+1, 'Inserting', TO_DATE('2017/01/16','YYYY/MM/DD'), 1, 5 FROM  Activity;

COMMIT