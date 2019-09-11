INSERT INTO Osoba (Name, Surname)
VALUES
('Den', 'Kowalski'),
('Ivan', 'Kowal'),
('Piotr', 'Malin'),
('Lolin', 'Kolin'),
('Tata', 'Rata');

INSERT INTO Klient(Osoba_Id, Phone_number, Email, Adress)
VALUES
(1, '111111111111', 'Den@gmail.com', 'Populara 62a'),
(2, '222222222222', 'Ivan@gmail.com', 'Populara 63a'),
(3, '333333333333', 'Piotr@gmail.com', 'Populara 64a');

INSERT INTO Worker(Osoba_Id, Position, Salary)
VALUES
  (4, 'pokojowka', 1234),
  (5, 'recepcion', 2345);

INSERT INTO Meal (Name, Cost)
VALUES
  ('Kurczak', 20),
  ('Frytki', 5),
  ('Beaf', 25),
  ('lody', 10);

INSERT INTO Room (Number, Status)
VALUES
  (1, 'wolny'),
  (2, 'zajęty'),
  (3, 'wolny'),
  (4, 'wolny'),
  (5, 'przgotuje sie');

INSERT INTO Visit (DateFrom, DateTo, Cost, Osoba_Id, Room_id)
VALUES
  ('2017/12/31', '2018/01/31', '1234', 1, 1),
  ('2017/12/30', '2018/01/15', '555', 2, 3),
  ('2017/11/29', '2017/12/15', '555', 3, 4);

INSERT INTO [Order] (Osoba_Id, Meal_id, Date_time)
VALUES
  (1,1,'2018/01/02'),
  (2,2,'2018/01/02'),
  (3,4,'2018/01/02');

INSERT INTO Activity (Name, Date, Room_id, Osoba_Id)
VALUES
  ('Cleaning', '2018/01/15', 3, 4),
  ('Inserting', '2017/01/16', 1, 5);
