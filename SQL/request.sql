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
-- ———————————–––––––––––––––(04)------------------------------------
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
ORDER BY mch.week_of_league, mch.match_date

-- ———————————–––––––––––––––(02)------------------------------------
pl.player_name, pl.player_age, pl.player_number AS `number`, pl.team_name AS `team`
SELECT *
FROM player pl


-- ———————————–––––––––––––––(03)------------------------------------ 

SELECT pl.player_name AS `name`, pl.team_name AS `team`, mp.player_injury AS `injury`, pc.card_color AS `card`, pc.card_time AS `time`, mch.week_of_league AS `week`, mch.home_team AS `home`, mch.away_team AS `away`
FROM `player` pl
JOIN `player_cards` pc ON pl.player_ssn = pc.player_ssn
JOIN `match` mch ON pc.match_stadium = mch.stadium_name AND pc.match_date = mch.match_date
JOIN `match_player_information` mp ON pl.player_ssn = mp.player_ssn
WHERE 
    pc.card_color = 'red' OR
    mp.player_injury = 'Yes'
    -- yellow 3

--!———————————–––––––––––––––(04)------------------------------------