-- OFFICE
BULK INSERT Office
FROM 'D:\Kỳ 8\Data Warehouse & Data Mining\data\offices.csv'
WITH (
	FORMAT = 'CSV',
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	FIELDQUOTE = '"',
	TABLOCK
);

-- STORE
BULK INSERT Store
FROM 'D:\Kỳ 8\Data Warehouse & Data Mining\data\stores.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

-- ITEM
BULK INSERT Item
FROM 'D:\Kỳ 8\Data Warehouse & Data Mining\data\items.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

-- STOREDITEM
BULK INSERT StoredItem
FROM 'D:\Kỳ 8\Data Warehouse & Data Mining\data\stored_items.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

-- CUSTOMER
BULK INSERT Customer
FROM 'D:\Kỳ 8\Data Warehouse & Data Mining\data\customers.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

-- POSTAL CUSTOMER
BULK INSERT PostalCustomer
FROM 'D:\Kỳ 8\Data Warehouse & Data Mining\data\postal_customers.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

-- TOURIST CUSTOMER
BULK INSERT TouristCustomer
FROM 'D:\Kỳ 8\Data Warehouse & Data Mining\data\tourist_customers.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

-- ORDER
BULK INSERT [Order]
FROM 'D:\Kỳ 8\Data Warehouse & Data Mining\data\orders.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

-- ORDERED ITEM
BULK INSERT OrderedItem
FROM 'D:\Kỳ 8\Data Warehouse & Data Mining\data\order_items.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);