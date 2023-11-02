{{ config (
    materialized="table"
)}}

with Product as(
    select * from {{ ref('dbt_product')}}
),

Inventory_fact as (
    SELECT 
        IM.ItemNo,
        IM.DateOfLastOrder,
        IM.StockQuantity,
        IM.TotalValue,
        IM.ReorderLevel,
        IM.DaysPerReorder,
        IM.SalesPrice
    FROM BRONZE.BRONZE.Inventory_fact IM
        Inner join Product P on (P.ItemNo=IM.ItemNo)
)

select * from Inventory_fact