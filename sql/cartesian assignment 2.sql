CREATE TABLE Customer (Customer_Id varchar(255));
 INSERT INTO Customer VALUES('Customer_Id'),('Abhinash'),('Vipin'),('Mahesh'),('Bijoy'),('Bhabani'),('Ashutosh')
    
 CREATE TABLE Voucher (Voucher_Id varchar(255) UNIQUE);
 INSERT INTO Voucher VALUES('ABXFH'),('SDFGH'),('ERTYY'),('PPLKM')
    
 ;with cte 
 as(select *,row_number() over(order by Customer_Id) rr from Customer)
 ,cte2 as(select *,row_number() over(order by Voucher_Id) rr from Voucher)
    
 select Customer_Id Customer_Key,Voucher_Id Gift_Voucher_Key
 from cte c1
 join cte2 c2 on c1.rr=c2.rr