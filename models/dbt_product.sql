{{ config (
    materialized="table"
)}}

with Product as (
    SELECT 
        ItemNo,
        ItemName,
        Costperitem,vendor,
        stocklocation,
        ITEMREORDERQUANTITY,
        ITEMDISCONTINUED
    FROM BRONZE.BRONZE.Product
  )
  SELECT * FROM Product

