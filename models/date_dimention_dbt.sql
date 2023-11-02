
{{ config (
    materialized="table"
)}}

with DATE_DIMENSION as (
    SELECT 
        MY_DATE,
        YEAR,
        MONTH,
        MONTH_NAME,
        DAY_OF_MON,
        DAY_OF_WEEK,
        WEEK_OF_YEAR
    FROM BRONZE.BRONZE.DATE_DIMENSION
  )
  SELECT * FROM DATE_DIMENSION

