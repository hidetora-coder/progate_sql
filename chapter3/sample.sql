-- noinspection SqlNoDataSourceInspectionForFile

-- noinspection SqlDialectInspectionForFile

--! サブクエリ (一つのクエリの中にもう一つのクエリを実行させる)
-- ウィルの得点数を超える選手名を取得している
SELECT name
FROM players
WHERE goals > (
    SELECT goals
    FROM players
    WHERE name = "ウィル"
    );

--* 平均得点を超えている選手名とゴール数を取得する
SELECT name, goals
FROM players
WHERE goals > (
    SELECT AVG(goals)
    FROM players
    );

--! AS
SELECT name AS "身長180センチ以上の選手"
FROM players
WHERE height >= 180;


--! テーブルの紐付け
-- countriesテーブル > playersテーブル
-- playersテーブルにcountry_idカラムを追加して、countriesカラムのidと紐付ける

--! JOIN テーブルの結合
SELECT *
FROM players
JOIN countries
-- 結合条件 下記の条件が整ったデータを結合する
ON players.country_id = counties.id


--! JOIN(2)
-- テーブル名.カラム名にすることで同一名のカラムも呼び出せる
SELECT players.name, countries.name
FROM players
JOIN countries
ON players.country_id = countries.id;

-- 出身国ごとの合計得点を取得する
SELECT countries.name, SUM(goals) --? 国名と合計ゴール数を取得する
FROM players
JOIN countries
ON players.country_id = countries.id
GROUP BY countries.name; --? 国ごとの点数が欲しいため、国名でグルーピングする

--! teamsテーブル
-- playersテーブルにはprevious_team_idが付与されていて、teams.idと紐付けられている
--? 選手の元在籍チーム名と選手名を取得する
SELECT players.name, teams.name
FROM players
JOIN teams
ON players.previours_team_id = teams.id;

--! LEFT JOIN (外部キーがNULLのデータも取得する)
SELECT *
FROM players
LEFT JOIN teams
ON players.previous_team_id = teams.id;

SELECT players.name AS "選手名", teams.name AS "前年所属していたチーム"
FROM players
LEFT JOIN teams
ON players.previous_team_id = teams.id;

--! 3つのテーブルを結合する
SELECT *
FROM players
JOIN countries
ON players.country_id = countries.id

LEFT JOIN teams
ON players.previous_team_id = teams.id;

--! 総合演習
--? 身長が平均以上の選手名と身長を取得する
SELECT name AS "選手名", height AS "身長"
FROM players
WHERE height >= (
    SELECT AVG(height)
    FROM players
    );

--? 出身国が日本で身長が180cm以上の選手を取得する
SELECT *
FROM players
JOIN countries
ON players.country_id = countries.id
WHERE players.height >= 180
AND countries.name = "日本";

--? 国ごとの平均ゴール数を取得する
SELECT countries.name AS "国名", AVG(players.goals) AS "平均得点"
FROM players
JOIN countries
ON countries.id = players.country_id
GROUP BY countries.name;
