{{ config (
    materialized="table"
)}}

with CUSTOMER as(
    select * from {{ ref('dbt_customers')}}
),
Product as(
    select * from {{ ref('dbt_product')}}
),

sales_fact as (
    SELECT 
        S.OrderNumber,
        S.Orderdate,
        S.WarehouseCode,
        S.ProductCode,
        S.ORDERQUANTITY,
        S.UnitPrice,
        S.Revenue,
        S.Costs,
        S.customerId
    FROM BRONZE.BRONZE.sales_fact S
        INNER JOIN CUSTOMER C ON (C.CustomerId=S.CustomerId)
        Inner join Product P on (P.ItemNo=S.ProductCode)
)

select * from sales_fact