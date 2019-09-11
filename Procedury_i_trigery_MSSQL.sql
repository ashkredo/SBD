--Procedura dla zwracania informacji o uzytkowniku
CREATE PROCEDURE ShowKlientsInfo
@name NVARCHAR(30), @surname NVARCHAR(30)
AS
BEGIN
	SELECT Name, Surname, Phone_number 'Phone number', Email, Adress, 
	number 'room number', DateFrom, DateTo, Cost
    FROM osoba, klient, visit, room
	WHERE name = @name 
	AND surname = @surname 
	AND osoba.osoba_id = klient.osoba_id
	AND Visit.Osoba_Id = Klient.Osoba_Id
	AND Room.Room_id = Visit.Room_id;
END;

EXECUTE ShowKlientsInfo 'Den', 'Kowalski';

--Wyświetla wszystkie jedzenia w zamówieniu
ALTER PROCEDURE ShowAllMealsInTheOrder
@Order_id INT
AS
BEGIN
	DECLARE @meal NVARCHAR(30);
	DECLARE @cost NVARCHAR(30);
	IF  NOT EXISTS (SELECT 1 FROM [order] WHERE order_id = @Order_id)
	BEGIN
		PRINT ( 'This order do not exist!' );
	END
	ELSE
	BEGIN
		DECLARE CursorShow CURSOR FOR SELECT name, cost FROM meal, [order]
		WHERE [order].meal_id = meal.meal_id AND [Order].Order_id = @Order_id;
		OPEN  CursorShow;
		FETCH NEXT FROM  CursorShow INTO @meal, @cost
		WHILE @@FETCH_STATUS = 0
		BEGIN
		PRINT (@meal + ' '  + @cost);
		FETCH NEXT FROM CursorShow INTO @meal, @cost;
		END;
	CLOSE  CursorShow;
	DEALLOCATE  CursorShow;
	END;
END;

EXECUTE ShowAllMealsInTheOrder '1';

--Za każdym razem kiedy zmienimy coś w tabele "Order" wypisze ile Meal w Order
ALTER TRIGGER howMuchMealsInOrder ON [Order]
FOR INSERT, UPDATE, DELETE
AS
DECLARE CursorOr CURSOR FOR SELECT Order_id, name, surname, count(*)
														FROM Klient, Osoba, [order]
														WHERE Klient.Osoba_Id = Osoba.Osoba_Id
														AND [order].Osoba_Id = Klient.Osoba_Id
														GROUP BY Order_id, name, Surname;
DECLARE @name nVarchar(30);
DECLARE @surname nVarchar(30);
DECLARE @ile INT;
DECLARE @Order_id INT;
OPEN CursorOr
FETCH NEXT FROM CursorOr INTO @Order_id, @name, @surname, @ile;
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT 'W zamówieniu ' + cast(@Order_id as varchar) + ' klient ' +
	@name + ' ' + @surname + ' ma ' + cast(@ile as varchar) + ' jedzenia: ';
END;
CLOSE CursorOr;
DEALLOCATE CursorOr;

INSERT INTO [Order] (Order_id, Osoba_Id, Meal_id, Date_time)
		VALUES (1, 1, 2, GETDATE());

--Jeżeli data jest taka sama na jedno activity, to będzie error
CREATE TRIGGER OneActivity ON Activity
FOR INSERT
AS
	IF EXISTS (SELECT Activity.Activity_id FROM Activity, inserted WHERE Activity.Date = inserted.Date)
	BEGIN
		RAISERROR('TAKA DATA JUŻ JEST!',1,1);
	ROLLBACK;
END

INSERT INTO Activity (Name, Date, Room_id, Osoba_Id)
		VALUES ('rer', GETDATE(), 1,4);