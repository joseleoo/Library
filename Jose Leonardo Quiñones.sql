--1
select  Identificación,Nombres, Apellidos, (SUM(Valor)) as valorTotalCompra, YEAR(Fecha) as Año
 from Cliente cl inner join Compra c on cl.IdCliente=c.IdCliente
group by YEAR(Fecha),Identificación,Nombres, Apellidos

go
--2
select distinct nombre, sum(NoVentas) as NoVentas  from
(
select    Nombres+' '+ Apellidos as nombre,case when YEAR(Fecha)=2019 then count(idcompralibro) else 0 end as NoVentas 
from Empleado e left join Compra c on e.IdEmpleado=c.IdEmpleado
group by Nombres, Apellidos,YEAR(c.fecha))as tabla
group by nombre

go
--3
EXEC ObtieneTotalVentasXEmpleado 2020

go
--5

select Nombres,Apellidos,Email, c.Fecha, COUNT(IdCompraLibro)as cantidad from Cliente cl left join  Compra c on cl.IdCliente=c.IdCliente
where (YEAR(c.Fecha) =2019 or c.Fecha is null)  and Email like '%gmail%'

group by Nombres,Apellidos,Email, c.Fecha
having COUNT(IdCompraLibro)=0

go

