CREATE TABLE Purchase(Bills_Id int, Customer int, Product_Id int, Sale_Qty int , Bill_Amount int ,Bill_Date Date , Dt_FORMATTED AS
(convert(varchar(255), Bill_Date, 104)))

CREATE TABLE Product(Product_Id int, Dep_Id int ,Cat_Id int)

INSERT INTO Product(Product_Id,Dep_Id,Cat_Id)
VALUES
(100, 100, 1),
(100,   100,    1),
(100, 100, 1),
(100, 100, 1),
(200, 200, 1),
(200, 200, 1),
(300, 300, 2),
(300, 300, 2),
(300, 300, 2),
(301, 301, 2),
(401, 401, 3),
(403, 403, 3),
(404, 404, 3);

INSERT INTO Purchase(Bills_Id, Customer, Product_Id, Sale_Qty, Bill_Amount, Bill_Date)
VALUES
( 78807159, 44, 100, 1, 16000, 22-02-2020 ),
( 82390697, 44, 100, 2, 5200, 23-02-2020),
( 94479024,   44, 100, 1, 4200, 27-02-2020),
( 94549714,    44, 100, 1, 21900, 27-02-2020),
( 95521191,    44, 200, 1, 20000, 27-02-2020),
( 142109733,    44, 200, 1, 8400, 11-11-2019),
( 158391727, 44, 300, 1, 24100, 16-11-2019),
( 168354993, 44, 300, 1, 24100, 19-11-2019),
( 193504854, 44, 300, 1, 7600, 26-11-2019),
( 195567022, 44, 300, 1, 2500, 26-11-2019),
( 216619949, 44, 301, 1, 16000, 01-12-2019),
( 228647858, 44, 401, 1, 28500, 04-12-2019),
( 244924788, 66, 402, 1, 18200, 08-12-2019),
( 244938525, 66, 403, 1, 16000, 08-12-2019),
( 244947344, 66, 404, 2, 12600, 08-12-2019),
( 245391938, 66, 405, 1, 4200, 08-12-2019),
( 245896327, 66, 406, 1, 12500, 08-12-2019),
( 270582683, 66, 407, 1, 5900, 16-12-2019),
( 271089616, 66, 405, 1, 22500, 16-12-2019),
( 393252504, 66, 301, 1, 26100, 19-01-2020),
( 395961027, 66, 401, 1, 12900, 19-01-2020),
( 407474852, 77, 402, 1, 4900, 23-01-2020);

SELECT Cat_Id, Product_Id, COUNT(*) AS Occurrences as  Trending
FROM Purchase
JOIN Product
WHERE Purchase.Bill_Date >= DATEADD(day,-30,GETDATE())
and   Purchase.Bill_Date <= getdate()
GROUP BY Sale_Qty
HAVING Count(*) >= ALL
WHERE Purchase.Product_Id = Product.Product_Id
AND Sale_Qty =
   (SELECT MAX(*)
   FROM Purchase
   GROUP BY Sale_Qty)<=2;