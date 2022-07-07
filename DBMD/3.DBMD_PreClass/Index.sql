USE workshop

select * from sales
select * from currency_rates

create clustered index date on dbo.sales (date)

create index seller_id on sales (seller_id)

create clustered index date on dbo.currency_rates(date)

--to disable an index, you use the ALTER INDEX statement as follows:
ALTER INDEX seller_id ON sales DISABLE;

--To disable all indexes of a table, you use the following form of the ALTER INDEX statement:
ALTER INDEX ALL ON sales DISABLE;

--In SQL Server, you can rebuild an index by using the ALTER INDEX statement or DBCC DBREINDEX command.
ALTER INDEX date ON sales REBUILD;

ALTER INDEX ALL ON sales REBUILD;

