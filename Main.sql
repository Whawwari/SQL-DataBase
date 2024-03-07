-- Total Identity Theft Reports per State
SELECT state_name, COUNT(*) AS total_reports
FROM identity_theft_reports
GROUP BY state_name
ORDER BY total_reports DESC;

-- Total Online Shopping Transactions per State
SELECT state_name, COUNT(*) AS total_transactions
FROM online_shopping_data
GROUP BY state_name
ORDER BY total_transactions DESC;

-- Average Transaction Amount for Online Shopping per State
SELECT state_name, AVG(transaction_amount) AS avg_transaction_amount
FROM online_shopping_data
GROUP BY state_name
ORDER BY avg_transaction_amount DESC;

-- States with Highest Identity Theft Reports
SELECT state_name
FROM identity_theft_reports
GROUP BY state_name
ORDER BY COUNT(*) DESC
LIMIT 10;

-- Comparison of Identity Theft Reports and Online Shopping Transactions
SELECT 
    idr.state_name, 
    COUNT(DISTINCT idr.report_id) AS total_identity_theft_reports, 
    COUNT(DISTINCT osd.transaction_id) AS total_online_shopping_transactions
FROM identity_theft_reports idr
JOIN online_shopping_data osd ON idr.state_name = osd.state_name
GROUP BY idr.state_name
ORDER BY total_identity_theft_reports DESC, total_online_shopping_transactions DESC;

-- States with Low Identity Theft Reports but High Online Shopping Transactions
SELECT 
    idr.state_name, 
    COUNT(DISTINCT idr.report_id) AS total_identity_theft_reports, 
    COUNT(DISTINCT osd.transaction_id) AS total_online_shopping_transactions
FROM identity_theft_reports idr
JOIN online_shopping_data osd ON idr.state_name = osd.state_name
GROUP BY idr.state_name
HAVING COUNT(DISTINCT idr.report_id) < X AND COUNT(DISTINCT osd.transaction_id) > Y
ORDER BY total_online_shopping_transactions DESC;
