-- Supply Chain Performance Analysis
-- Key SQL Queries

-- Q1: Late delivery rate by shipping mode
SELECT 
    shipping_mode,
    COUNT(*) as total_orders,
    SUM(late_delivery_risk) as late_orders,
    ROUND(SUM(late_delivery_risk) * 100.0 / COUNT(*), 1) as late_rate_pct,
    ROUND(AVG(profit_per_order), 2) as avg_profit
FROM supply_chain
GROUP BY shipping_mode
ORDER BY late_rate_pct DESC;

-- Q2: Revenue and late rate by market
SELECT
    market,
    COUNT(*) as total_orders,
    ROUND(SUM(sales), 2) as total_revenue,
    ROUND(SUM(late_delivery_risk) * 100.0 / COUNT(*), 1) as late_rate_pct,
    ROUND(SUM(profit_per_order), 2) as total_profit
FROM supply_chain
GROUP BY market
ORDER BY total_revenue DESC;

-- Q3: Financial impact of late deliveries
SELECT
    CASE WHEN late_delivery_risk = 1 
         THEN 'Late Delivery' 
         ELSE 'On Time' END as delivery_type,
    COUNT(*) as total_orders,
    ROUND(AVG(profit_per_order), 2) as avg_profit_per_order,
    ROUND(SUM(profit_per_order), 2) as total_profit
FROM supply_chain
GROUP BY late_delivery_risk;

-- Q4: Delivery gap by shipping mode
SELECT
    shipping_mode,
    days_shipping_scheduled,
    COUNT(*) as total_orders,
    ROUND(SUM(late_delivery_risk) * 100.0 / COUNT(*), 1) as late_rate_pct,
    ROUND(AVG(delivery_gap), 2) as avg_delivery_gap
FROM supply_chain
GROUP BY shipping_mode, days_shipping_scheduled
ORDER BY shipping_mode;