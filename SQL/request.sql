-- =======================(Requests)=================================

USE `football_leagues`;

-- Yasin

-- ———————————––––––––––––––(Game)-----------------------------------

SELECT mpi.team_name, pl.player_name, pl.player_number, mpi.player_post
FROM `match_player_information` mpi
JOIN `player` pl ON mpi.player_ssn = pl.player_ssn
WHERE (mpi.match_date = '2025-02-25') AND ( mpi.match_stadium = 'Azadi')
ORDER BY pl.team_name, pl.player_name

-- ———————————–––––––––––––––(01)------------------------------------

-- SELECT *
SELECT mti.team_name, mti.hosting_status, mti.team_arrange, mti.goals_score, mti.goals_concede, yel.yellow_cards, red.red_cards
FROM `match_team_information` mti
LEFT JOIN (
    SELECT pc.match_date, pc.match_stadium, COUNT(pc.card_color) AS `yellow_cards`, pl.team_name
    FROM `player_cards` pc
    JOIN `player` pl ON pc.player_ssn = pl.player_ssn
    WHERE (pc.match_date = '2025-02-25') AND (pc.match_stadium = 'Azadi') AND (pc.card_color = 'yellow')
    GROUP BY pc.match_date, pc.match_stadium, pl.team_name
) yel ON (mti.match_date = yel.match_date) AND (mti.match_stadium = yel.match_stadium) AND (mti.team_name = yel.team_name)
LEFT JOIN (
    SELECT pc.match_date, pc.match_stadium, COUNT(pc.card_color) AS `red_cards`, pl.team_name
    FROM `player_cards` pc
    JOIN `player` pl ON pc.player_ssn = pl.player_ssn
    WHERE (pc.match_date = '2025-02-25') AND (pc.match_stadium = 'Azadi') AND (pc.card_color = 'red')
    GROUP BY pc.match_date, pc.match_stadium, pl.team_name
) red ON (mti.match_date = red.match_date) AND (mti.match_stadium = red.match_stadium) AND (mti.team_name = red.team_name)
WHERE (mti.match_date = '2025-02-25') AND (mti.match_stadium = 'Azadi')


-- ———————————–––––––––––––––(02)------------------------------------

-- SELECT *
SELECT pl.team_name, pl.player_name, pl.player_number, mpi.player_post, ps.penalty, ps.score_time
FROM `pleyer_scores` ps
JOIN `player` pl ON ps.player_ssn = pl.player_ssn
JOIN `match_player_information` mpi ON ps.player_ssn = mpi.player_ssn
WHERE (ps.match_date = '2025-02-25') AND (ps.match_stadium = 'Azadi') AND (mpi.match_date = '2025-02-25') AND (mpi.match_stadium = 'Azadi')
ORDER BY ps.score_time, pl.team_name

-- ———————————–––––––––––––––(03)------------------------------------
-- SELECT *
SELECT pl.team_name, pl.player_name, pl.player_number, pc.card_color, pc.card_time
FROM `player_cards` pc
JOIN `player` pl ON pc.player_ssn = pl.player_ssn
JOIN `match_player_information` mpi ON pc.player_ssn = mpi.player_ssn
WHERE (pc.match_date = '2025-02-25') AND (pc.match_stadium = 'Azadi') AND (mpi.match_date = '2025-02-25') AND (mpi.match_stadium = 'Azadi')
ORDER BY pc.card_time, pl.player_name

-- ———————————–––––––––––––––(04)------------------------------------

-- SELECT *
SELECT sb.team_name, pil.player_name AS in_player, pol.player_name AS out_player, sb.subs_time
FROM `substitution` sb
JOIN `player` pil ON sb.in_player = pil.player_ssn
JOIN `player` pol ON sb.out_player = pol.player_ssn
WHERE (sb.match_date = '2025-02-25') AND (sb.match_stadium = 'Azadi')
ORDER BY sb.subs_time

-- ———————————–––––––––––––––(05)------------------------------------

-- ———————————–––––––––––––(Player)----------------------------------

SELECT pl.player_name, mpi.team_name, COUNT(mpi.team_name) AS `games`, toa.goals, ROUND(AVG(mpi.player_rate), 1) AS `rate`, tot.out_team, tot.in_team, tot.player_salary, tot.in_date, tot.transfer_fee, tot.duration_agreement
FROM `match_player_information` mpi
JOIN `player` pl ON mpi.player_ssn = pl.player_ssn
JOIN (
    SELECT pl.player_name, pl.player_salary, tr.out_team, tr.in_team, tr.in_date, tr.transfer_fee, tr.duration_agreement
    FROM `player` pl
    JOIN `transfer` tr ON pl.player_ssn = tr.player_ssn
    WHERE pl.player_name = 'Mehdi Torabi'
) tot ON pl.player_name = tot.player_name AND mpi.team_name = tot.in_team
JOIN (
    SELECT ps.player_ssn, COUNT(ps.player_ssn) AS `goals`
    FROM `pleyer_scores` ps
    GROUP BY ps.player_ssn
) toa ON mpi.player_ssn = toa.player_ssn
WHERE pl.player_name = 'Mehdi Torabi'
GROUP BY mpi.team_name, pl.player_name, tot.player_salary, tot.out_team, tot.in_team, tot.in_date, tot.transfer_fee, tot.duration_agreement, toa.goals

-- ———————————–––––––––––––––(01)------------------------------------

-- SELECT *
SELECT pl.player_name, tm.league_name, mpi.team_name, COUNT(mpi.team_name) AS `games`, ROUND(AVG(mpi.player_rate), 1) AS `rate`, tot.goals, MIN(mpi.match_date) AS first_play_date, MAX(mpi.match_date) AS last_play_date
FROM `match_player_information` mpi
JOIN `player` pl ON mpi.player_ssn = pl.player_ssn
JOIN `team` tm ON mpi.team_name = tm.team_name
JOIN (
    SELECT ps.player_ssn, COUNT(ps.player_ssn) AS `goals`
    FROM `pleyer_scores` ps
    GROUP BY ps.player_ssn
) tot ON mpi.player_ssn = tot.player_ssn
WHERE pl.player_name = 'Mehdi Torabi'
GROUP BY mpi.team_name, pl.player_name, tot.goals
ORDER BY pl.player_name

-- ———————————–––––––––––––––(02)------------------------------------

-- ———————————––––––––––––––(Team)-----------------------------------

SELECT mch.home_team, mch.away_team, mch.week_of_league, mti.match_date, mti.team_arrange, mti.goals_score, mti.goals_concede
FROM `match_team_information` mti
JOIN `match` mch ON (mti.match_stadium = mch.stadium_name) AND (mti.match_date = mch.match_date)
WHERE mti.team_name = 'Perspolis'
ORDER BY mch.match_date DESC

-- ———————————–––––––––––––––(01)------------------------------------
-- todo———————————–––––––––––––––(02)------------------------------------

SELECT tm.team_name, pl.player_number, pl.player_name, pl.player_age, pl.player_salary, tr.in_date, tr.out_team, tr.transfer_fee, tr.duration_agreement
FROM `player` pl
JOIN  `team` tm ON tm.team_name = pl.team_name
LEFT JOIN `transfer` tr ON pl.player_ssn = tr.player_ssn
-- WHERE tm.team_name = 'Perspolis'
ORDER BY tm.team_name, tr.in_date DESC, pl.player_name

-- ———————————–––––––––––––––(03)------------------------------------

SELECT tm.team_name, co.coach_name AS `coach_name`, co.coach_age, co.coach_salary, co.in_date, co.duration_agreement
FROM `team` tm
LEFT JOIN `coach` co ON tm.team_name = co.team_name
-- WHERE tm.team_name = 'Perspolis'

-- ———————————–––––––––––––––(04)------------------------------------

SELECT tm.team_name, st.staff_name, st.staff_age, st.staff_job, st.staff_salary, st.in_date, st.duration_agreement
FROM `team` tm
JOIN `staff` st ON tm.team_name = st.team_name
-- WHERE tm.team_name = 'Perspolis'
ORDER BY tm.team_name, st.staff_name

-- ———————————–––––––––––––––(05)------------------------------------

-- ———————————––––––––––––(Transfer)---------------------------------

SELECT pl.player_name, pl.player_age, pl.player_salary, tr.out_team, tr.transfer_fee, tr.in_team, tr.in_date, tr.duration_agreement
FROM `team` tm
JOIN `player` pl ON tm.team_name = pl.team_name
JOIN `transfer` tr ON tr.player_ssn = pl.player_ssn
-- WHERE tr.in_team = 'Perspolis'
ORDER BY tr.in_date DESC, pl.player_name

-- ———————————–––––––––––––––(01)------------------------------------

SELECT pl.player_name, pl.player_age, pl.player_salary, tr.out_team, tr.transfer_fee, tr.in_team, tr.in_date, tr.duration_agreement
FROM `team` tm
JOIN `player` pl ON tm.team_name = pl.team_name
JOIN `transfer` tr ON tr.player_ssn = pl.player_ssn
-- WHERE tr.in_date BETWEEN '2023-01-01' AND '2024-01-01'
ORDER BY tr.in_date DESC, pl.player_name;

-- ———————————–––––––––––––––(02)------------------------------------

SELECT st.staff_name, st.staff_age, st.staff_job, st.staff_salary, st.team_name, st.in_date, st.duration_agreement
FROM `team` tm
JOIN `staff` st ON tm.team_name = st.team_name
-- WHERE st.in_date BETWEEN '2021-01-01' AND '2023-01-01'
ORDER BY st.in_date DESC, st.staff_name;

-- ———————————–––––––––––––––(03)------------------------------------

SELECT tm.team_name, SUM(pl.player_salary) AS `price_to_players`
FROM `team` tm
JOIN `player` pl ON tm.team_name = pl.team_name
GROUP BY tm.team_name
ORDER BY SUM(pl.player_salary) DESC;

-- ———————————–––––––––––––––(04)------------------------------------

SELECT tot.team_name, SUM(tot.salary) AS `salary`, 'coach & staffs' AS `price_to`
FROM (
    SELECT tm.team_name, SUM(st.staff_salary) AS `salary`, 'staffs' AS `price_to`
    FROM `team` tm
    JOIN `staff` st ON tm.team_name = st.team_name
    GROUP BY tm.team_name
    -- ORDER BY `salary` DESC
    UNION
    SELECT tm.team_name, SUM(ch.coach_salary) AS `salary`, 'coach' AS `price_to`
    FROM `team` tm
    JOIN `coach` ch ON tm.team_name = ch.team_name
    GROUP BY tm.team_name
    -- ORDER BY `salary` DESC
    ) tot
GROUP BY tot.team_name
ORDER BY `salary` DESC;

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
HAVING COUNT(pc.card_color) >= 1 -- pc.card_color >= 3
UNION
SELECT pl.player_name AS `name`, pl.team_name AS `team`, 'Red Card' AS `because of`
FROM `player` pl
JOIN `player_cards` pc ON pl.player_ssn = pc.player_ssn
WHERE pc.card_color = 'Red';


SELECT pl.player_name AS `name`, pl.team_name AS `team`, mp.player_injury AS `injury`, pc.card_color AS `card`, pc.card_time AS `time`, mch.week_of_league AS `week`, mch.home_team AS `home`, mch.away_team AS `away`
FROM `player` pl
JOIN `player_cards` pc ON pl.player_ssn = pc.player_ssn
JOIN `match` mch ON pc.match_stadium = mch.stadium_name AND pc.match_date = mch.match_date
JOIN `match_player_information` mp ON pl.player_ssn = mp.player_ssn;

-- ———————————–––––––––––––––(04)------------------------------------