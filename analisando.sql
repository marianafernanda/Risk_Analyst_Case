-- Usuários que fizeram mais de uma compra e pediram chargeback
SELECT * FROM new_schema.mytable
WHERE user_id IN (SELECT user_id FROM new_schema.mytable GROUP BY user_id HAVING COUNT(*) > 1)
AND has_cbk LIKE 'TRUE';

-- Usuários que fizeram mais de uma compra em dispositivos diferentes e pediram chargeback
SELECT * FROM new_schema.mytable
WHERE user_id IN (SELECT user_id FROM new_schema.mytable GROUP BY user_id HAVING COUNT(*) > 1)
AND device_id IN (SELECT device_id FROM new_schema.mytable GROUP BY device_id HAVING COUNT(*) <= 1)
AND has_cbk LIKE 'TRUE';

-- Usuários que fizeram mais de uma compra com cartões diferentes e pediram chargeback
SELECT * FROM new_schema.mytable
WHERE user_id IN (SELECT user_id FROM new_schema.mytable GROUP BY user_id HAVING COUNT(*) > 1)
AND card_number IN (SELECT card_number FROM new_schema.mytable GROUP BY card_number HAVING COUNT(*) <= 1)
AND has_cbk LIKE 'TRUE';