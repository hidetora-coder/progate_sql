--! クエリとは

--* purchasesテーブルからnameカラム全てを取得する
SELECT name
FROM purchases;


--! 複数のカラムを選択する

--* nameとpriceカラムを取得する
SELECT name, price --? *とすると全てのカラムを取得する
FROM purchases;


--! WHEREで特定のデータを取得する

--* purchasesテーブルから全てのカラムを参照しcategoryが食費であるデータを取得する
SELECT *
FROM purchases
WHERE category = "食費";

--* WHEREを用いて数値データを取得する
SELECT *
FROM purchases
WHERE price = 1000;

--* WHEREを用いて日付データを取得する
SELECT *
FROM purchases
WHERE purchased_at = "2022-03-02";

--! 比較演算子
--* 1000円以上のpurchasesデータを取得する
SELECT *
FROM purchases
WHERE price >= 1000;

--* 2018-08-01以降のデータを取得する
SELECT *
FROM purchases
WHERE purchased_at >= "2018-08-01";


--! LIKE演算子
--* nameカラムでプリンを含むデータを取得する
SELECT *
FROM purchases
WHERE name LIKE "%プリン%";

--* 前方一致
WHERE name LIKE "プリン%" --? プリンから始まるデータを取得

--* 後方一致
WHERE name LIKE "%プリン" --? プリンが頭にあるデータを取得
