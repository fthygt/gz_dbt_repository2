SELECT
    date_date,
    ROUND(SUM(ads_cost),0) AS ads_cost,
    ROUND(SUM(impression),0) AS ads_impression,
    ROUND(SUM(click),0) AS ads_clicks
FROM {{ref('int_campaign')}}
GROUP BY date_date,campaign_key
ORDER BY date_date DESC
