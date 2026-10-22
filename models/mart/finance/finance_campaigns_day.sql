{{
    config(
        materialized='table'
    )
}}

SELECT
    a.date_date AS date,
    (f.operational_margin-a.ads_cost) AS ads_margin,
    f.average_basket,
    f.operational_margin,
    a.ads_cost,
    a.ads_impression,
    a.ads_clicks,
    f.quantity,
    f.revenue,
    f.purchase_cost,
    f.margin,
    f.shipping_fee,
    f.log_cost,
    f.ship_cost
FROM {{ref('int_campaigns_day')}} AS a
FULL OUTER JOIN {{ref('finance_days')}} AS f
    USING (date_date)
ORDER BY date_date
