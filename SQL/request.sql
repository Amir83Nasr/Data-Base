-- =======================(Requests)=================================

USE `football_leagues`;

-- ———————————––––––––––––––(Game)-----------------------------------
-- ———————————–––––––––––––––(01)------------------------------------
-- ———————————–––––––––––––––(02)------------------------------------
-- ———————————–––––––––––––––(03)------------------------------------
-- ———————————–––––––––––––––(04)------------------------------------
-- ———————————–––––––––––––––(05)------------------------------------

-- ———————————–––––––––––––(Player)----------------------------------
-- ———————————–––––––––––––––(01)------------------------------------
-- ———————————–––––––––––––––(02)------------------------------------

-- ———————————––––––––––––––(Team)-----------------------------------
-- ———————————–––––––––––––––(01)------------------------------------
-- ———————————–––––––––––––––(02)------------------------------------
-- ———————————–––––––––––––––(03)------------------------------------

SELECT tm.team_name, co.coach_name AS `coach_name`, co.coach_age, co.coach_salary, co.in_date, co.duration_agreement
FROM `team` tm
LEFT JOIN `coach` co ON tm.team_name = co.team_name

-- ———————————–––––––––––––––(04)------------------------------------

SELECT tm.team_name, st.staff_name, st.staff_age, st.staff_job, st.staff_salary, st.in_date, st.duration_agreement
FROM `team` tm
JOIN `staff` st ON tm.team_name = st.team_name
ORDER BY tm.team_name, st.staff_name

-- ———————————–––––––––––––––(05)------------------------------------

-- ———————————––––––––––––(Transfer)---------------------------------
-- ———————————–––––––––––––––(01)------------------------------------
-- ———————————–––––––––––––––(02)------------------------------------
-- ———————————–––––––––––––––(03)------------------------------------
-- ———————————–––––––––––––––(04)------------------------------------
-- ———————————–––––––––––––––(05)------------------------------------

-- ———————————–––––––––––––(League)----------------------------------

SELECT tm.team_name, tm.points, tm.goals_score, tm.goals_concede, (tm.goals_score - tm.goals_concede) AS `GD`, tm.wins, tm.draws, tm.loses
FROM `league` lg
JOIN `team` tm ON lg.league_name = tm.league_name
WHERE lg.league_name = 'Khalig Fars'
ORDER BY tm.points DESC, (tm.goals_score - tm.goals_concede) DESC;

-- ———————————–––––––––––––––(01)------------------------------------

SELECT mch.home_team AS `home`, mch.away_team AS `away`,mch.match_result AS `result`, mch.week_of_league AS `week`, mch.match_date AS `date`, mch.stadium_name AS `stadium`, rf.main_referee, rf.right_referee, rf.left_referee
FROM `match` mch
JOIN `referee_team` rf ON mch.referee_team_id = rf.referee_team_id
-- WHERE mch.week_of_league = 5
ORDER BY mch.week_of_league, mch.match_date;

-- ———————————–––––––––––––––(02)------------------------------------

SELECT pl.player_name AS `name`, COUNT(ps.score_time) AS `goal`, COUNT(mp.player_ssn) AS `game`, ROUND(AVG(mp.player_rate), 1) AS `rate`, COUNT(pc.card_time) AS `cards`, pl.team_name AS `team`
FROM `match_player_information` mp
LEFT JOIN `player` pl ON mp.player_ssn = pl.player_ssn
LEFT JOIN `pleyer_scores` ps  ON mp.player_ssn = ps.player_ssn
LEFT JOIN `player_cards` pc ON mp.player_ssn = pc.player_ssn
GROUP BY mp.player_ssn;

-- ———————————–––––––––––––––(03)------------------------------------ 

SELECT pl.player_name AS `name`, pl.team_name AS `team`, '3 Yellow Card' AS `because of`
FROM `player` pl
JOIN `player_cards` pc ON pl.player_ssn = pc.player_ssn
WHERE pc.card_color = 'Yellow'
GROUP BY pl.player_ssn
HAVING COUNT(pc.card_color) >= 0
UNION
SELECT pl.player_name AS `name`, pl.team_name AS `team`, 'Red Card' AS `because of`
FROM `player` pl
JOIN `player_cards` pc ON pl.player_ssn = pc.player_ssn
WHERE pc.card_color = 'Red'


SELECT pl.player_name AS `name`, pl.team_name AS `team`, mp.player_injury AS `injury`, pc.card_color AS `card`, pc.card_time AS `time`, mch.week_of_league AS `week`, mch.home_team AS `home`, mch.away_team AS `away`
FROM `player` pl
JOIN `player_cards` pc ON pl.player_ssn = pc.player_ssn
JOIN `match` mch ON pc.match_stadium = mch.stadium_name AND pc.match_date = mch.match_date
JOIN `match_player_information` mp ON pl.player_ssn = mp.player_ssn

-- ———————————–––––––––––––––(04)------------------------------------