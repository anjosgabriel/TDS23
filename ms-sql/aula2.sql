USE pubs 
SELECT * FROM sys.tables

select * from dbo.authors

select au_fname, 
       phone 
from dbo.authors order by au_fname DESC


select * from dbo.sales


select top 5 ord_num, qty 
from dbo.sales 
order by qty DESC 


select * from dbo.authors
where state = 'CA'
AND contract = 0
ORDER BY city 

select sum(qty) as 'vendas totais' from dbo.sales

select authors.*, titleauthor.* from authors, titleauthor where authors.au_id = titleauthor.au_id

select authors.*,titleauthor.*
from authors, titleauthor
where authors.au_id = titleauthor.au_id

select * from authors
select * from titleauthor

select distinct au_id, count(*) from dbo.titleauthor
group by au_id
having count(*) > 1