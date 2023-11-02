{{ config (
    materialized="table"
)}}


-- with CUSTOMER as (
--     select 
--         CustomerName,
--         CustomerType,
--         customerId
--  from bronze.bronze.CUSTOMER
-- )

with CUSTOMER as (
    SELECT 
        CustomerName,
        CustomerType,
        customerId
    FROM BRONZE.BRONZE.CUSTOMER
  )
  SELECT * FROM CUSTOMER
