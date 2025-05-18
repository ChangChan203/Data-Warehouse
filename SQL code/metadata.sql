CREATE TABLE dbo.TableMetadata (
    TableName NVARCHAR(100),
    ColumnName NVARCHAR(100),
    DataType NVARCHAR(50),
    [Description] NVARCHAR(255),
    IsNullable BIT,
    CreatedAt DATETIME
);


-- Dim_Time
INSERT INTO dbo.TableMetadata VALUES 
('Dim_Time', 'fullDate', 'DATE', N'Khóa chính ngày định dạng YYYY-MM-DD', 0, GETDATE()),
('Dim_Time', 'month', 'INT', N'Tháng', 0, GETDATE()),
('Dim_Time', 'quarter', 'INT', N'Quý', 0, GETDATE()),
('Dim_Time', 'year', 'INT', N'Năm', 0, GETDATE());


-- Dim_Item
INSERT INTO dbo.TableMetadata VALUES 
('Dim_Item', 'itemID', 'NVARCHAR(20)', N'Khóa chính mặt hàng', 0, GETDATE()),
('Dim_Item', 'size', 'NVARCHAR(10)', N'Kích cỡ mặt hàng', 0, GETDATE()),
('Dim_Item', 'weight', 'FLOAT', N'Khối lượng mặt hàng', 0, GETDATE()),
('Dim_Item', 'price', 'MONEY', N'Giá niêm yết mặt hàng', 0, GETDATE());


-- Dim_Store
INSERT INTO dbo.TableMetadata VALUES 
('Dim_Store', 'storeID', 'NVARCHAR(20)', N'Khóa chính cửa hàng', 0, GETDATE()),
('Dim_Store', 'cityID', 'NVARCHAR(20)', N'Mã thành phố', 0, GETDATE()),
('Dim_Store', 'state', 'NVARCHAR(20)', 'Bang', 0, GETDATE());


-- Dim_Customer
INSERT INTO dbo.TableMetadata VALUES 
('Dim_Customer', 'customerID', 'NVARCHAR(20)', N'Khóa chính khách hàng', 0, GETDATE()),
('Dim_Customer', 'name', 'NVARCHAR(50)', N'Tên khách hàng', 0, GETDATE())


-- Fact_Inventory
INSERT INTO dbo.TableMetadata VALUES 
('Fact_Inventory', 'fullDate', 'DATE', N'Ngày cập nhật mới nhất định dạng YYYY-MM-DD', 0, GETDATE()),
('Fact_Inventory', 'itemID', 'NVARCHAR(20)', N'Mã mặt hàng', 0, GETDATE()),
('Fact_Inventory', 'storeID', 'NVARCHAR(20)', N'Mã cửa hàng', 0, GETDATE()),
('Fact_Inventory', 'quantity', 'INT', N'Tổng số hàng trong kho', 0, GETDATE());


-- Fact_Sale
INSERT INTO dbo.TableMetadata VALUES 
('Fact_Sale', 'fullDate', 'DATE', N'Ngày bán hàng định dạng YYYY-MM-DD', 0, GETDATE()),
('Fact_Sale', 'itemID', 'NVARCHAR(20)', N'Mã mặt hàng', 0, GETDATE()),
('Fact_Sale', 'customerID', 'NVARCHAR(20)', N'Mã khách hàng', 0, GETDATE()),
('Fact_Sale', 'unitPrice', 'MONEY', N'Số tiền bán được trên 1 mặt hàng', 0, GETDATE()),
('Fact_Sale', 'amount', 'INT', N'Tổng số lượng bán được', 0, GETDATE()),
('Fact_Sale', 'totalPrice', 'MONEY', N'Tổng số tiền bán được', 0, GETDATE());
