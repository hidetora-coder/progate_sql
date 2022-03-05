-- noinspection SqlNoDataSourceInspectionForFile

-- noinspection SqlDialectInspectionForFile

--! DISTINCT
SELECT DISTINCT(character_name); --? character_nameを重複させない
FROM purchases;

--! 四則演算
SELECT name, price, price * 1.08
FROM purchases;

--! SUM
--? character_nameがにんじゃわんこのデータのpriceの合計値を返す
SELECT SUM(price)
FROM purchases
WHERE character_name = "にんじゃわんこ";

--! AVG
-- priceカラムの平均値を取得する
SELECT AVG(price)
FROM purchases
WHERE character_name = "にんじゃわんこ";

--! COUNT
-- レコード数を取得する
SELECT COUNT(*)
FROM purchases
WHERE character_name = "にんじゃわんこ";

--! MAX・MIN
-- priceカラムから一番大きいデータを取得する
SELECT MAX(price)
FROM purchases;

-- priceカラムから一番小さいデータを取得する
SELECT MIN(price)
FROM purchases;


--! GROUP BY
-- purchased_at毎にpriceをグルーピングして、集計結果を返す
SELECT SUM(price), purchased_at
FROM purchases
GROUP BY purchased_at

-- purchased_at毎にpriceデータを取得して、それぞれのデータ数を返す
SELECT  COUNT(price), purchased_at
FROM purchases
GROUP BY purchased_at

--! GROUP BY (複数)
-- purchased_atとcharacter_name毎にpriceデータを集めて合計値を返す
SELECT SUM(price), purchased_at, character_name
FROM purchases
GROUP BY purchased_at, character_name

-- purchased_atとcharacter_name毎にpriceデータ数を返す
SELECT COUNT(price), purchased_at, character_name
FROM purchases
GROUP BY purchased_at, character_name

--! GROUP BY(WHEREとの併用)
--? categoryが食費のデータを取得して
--? その中のcharacter_nameとpurchased_atデータ毎に合計値を計算して返す
SELECT SUM(price), purchased_at, character_name
FROM purchases
WHERE category = "食費"
GROUP BY purchased_at, character_name

--! HAVING(より詳細な絞り込み)
-- purchased_atとcharacter_nameごとのprice合計データを取得し3000以上のデータを返す
SELECT SUM(price), purchased_at, character_name
FROM purchases
GROUP BY purchased_at, character_name
HAVING SUM(price) > 3000;