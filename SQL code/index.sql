use N12_DW

-- Dim_Time
CREATE NONCLUSTERED INDEX IX_Dim_Time_Year_Month
ON dbo.Dim_Time(year, month);


-- Dim_Store
CREATE NONCLUSTERED INDEX IX_Dim_Store_City
ON dbo.Dim_Store(cityID);
