//sql query in DUNE.COM
SELECT *
FROM ethereum.transactions
WHERE block_time > TIMESTAMP '2024-03-07'
AND to = 0x0b1dd81b07b2b446973a8f6f2294653eb82d9bc7;


SELECT
  t1.*
FROM dex.trades AS t1
JOIN dex.trades AS t2
  ON t1.token_bought_symbol = t2.token_bought_symbol
  AND t1.token_sold_symbol = t2.token_sold_symbol
WHERE
  t1.block_date = TRY_CAST('2024-03-08' AS DATE) /* Corrected CAST type to DATE for block_date comparison */
  AND t1.tx_from <> FROM_HEX('0b1dd81b07b2b446973a8f6f2294653eb82d9bc7') /* Corrected illegal address comparison */
  AND ABS(EXTRACT(SECOND FROM (
    t1.block_time - t2.block_time
  ))) <= 60
