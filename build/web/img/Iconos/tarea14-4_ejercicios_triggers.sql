----Ejercicio Triggers

use Northwind
go

alter trigger Customers_log
on Customers
after insert, update, delete
as
declare @Action as char(10);
	set @Action = (case when exists (select * from INSERTED)
						and exists (select * from DELETED)
						then 'UPDATE'
						when exists (select * from INSERTED)
						then 'INSERT'
						when exists (select * from DELETED)
						then'DELETE'
						else NULL
					END)


--campos de la tabal customers
declare @CustomerID nchar(10),
@CompanyName nvarchar(60),
@ContactName nvarchar(60),
@ContactTitle nvarchar(60),
@Address nvarchar(120),
@City nvarchar(30),
@Region nvarchar(30),
@PostalCode nvarchar(20),
@Country nvarchar(30),
@Phone nvarchar(40),
@Fax nvarchar(40)

--campos de la tabla customers
--seleccion de los registros que se insertan o actualizan

select @CustomerID=CustomerID,
@CompanyName = CompanyName,
@ContactName = ContactName,
@ContactTitle = ContactTitle,
@Address = Address,
@City = City,
@Region = Region,
@PostalCode = PostalCode,
@Country = Country,
@Phone = Phone,
@Fax = Fax
from inserted

---seleccion de los registros que se insertan o actualizan
--si la accion es update 

if @Action = 'UPDATE'
Begin 
	insert into Customers_log

	select
	@CustomerID,
	@CompanyName,
	@ContactName,
	@ContactTitle,
	@Address,
	@City,
	@Region,
	@PostalCode,
	@Country,
	@Phone,
	@Fax,
	CompanyName,
	ContactName,
	ContactTitle,
	Address,
	City,
	Region,
	PostalCode,
	Country,
	Phone,
	Fax,
	Getdate(),
	'UPDATE'
		from deleted
	end

------------Si la accion es insert 

if @Action = 'INSERT'
Begin 
	insert into Customers_log

	select
	@CustomerID,
	@CompanyName,
	@ContactName,
	@ContactTitle,
	@Address,
	@City,
	@Region,
	@PostalCode,
	@Country,
	@Phone,
	@Fax,
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	Getdate(),
	'INSERT'
		from deleted
	end

----Si la accion es delete
if @Action = 'DELETE'
Begin 
	insert into Customers_log

	select
	CompanyName,
	ContactName,
	ContactTitle,
	Address,
	City,
	Region,
	PostalCode,
	Country,
	Phone,
	Fax,
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	Getdate(),
	'DELETE'
		from deleted
	end

