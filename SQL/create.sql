-- ======================(Create Tables)=============================

DROP DATABASE IF EXISTS `football_leagues`;
CREATE DATABASE `football_leagues`;
USE `football_leagues`;
SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

-- ———————————–––––––––––––––(League)--------------------------------

CREATE TABLE `league` (
    `league_name` VARCHAR(50) NOT NULL,
    `division` CHAR(1) NOT NULL,
    `capacity` TINYINT NOT NULL,
    `promotion_capacity` TINYINT NOT NULL DEFAULT 0,
    `relegation_capacity` TINYINT NOT NULL DEFAULT 0,
    `country` VARCHAR(50),
    PRIMARY KEY (`league_name`)
);

-- ———————————–––––––––––––––(Stadium)-------------------------------

CREATE TABLE `stadium` (
    `stadium_name` VARCHAR(50) NOT NULL,
    `stadium_capacity` INT NOT NULL,
    `stadium_city` VARCHAR(50),
    PRIMARY KEY (`stadium_name`)
);

-- ———————————–––––––––––––––(Team)----------------------------------

CREATE TABLE `team` (
    `team_name` VARCHAR(50) NOT NULL,
    `league_name` VARCHAR(50) NOT NULL,
    `city` VARCHAR(50),
    `stadium_name` VARCHAR(50) NOT NULL,
    `points` TINYINT NOT NULL DEFAULT 0,
    `goals_score` TINYINT NOT NULL DEFAULT 0,
    `goals_concede` TINYINT NOT NULL DEFAULT 0,
    -- goal_difference INT, -- can show  gd = gs - gc
    `wins` TINYINT NOT NULL DEFAULT 0,
    `draws` TINYINT NOT NULL DEFAULT 0,
    `loses` TINYINT NOT NULL DEFAULT 0,
    FOREIGN KEY (`league_name`) REFERENCES `league` (`league_name`),
    FOREIGN KEY (`stadium_name`) REFERENCES `stadium` (`stadium_name`),
    PRIMARY KEY (`team_name`)
);

-- ———————————–––––––––––––––(Promotion & Relegation)----------------

CREATE TABLE `promotion` (
    `team_name` VARCHAR(50) NOT NULL,
    `league_name` VARCHAR(50) NOT NULL,
    FOREIGN KEY (`team_name`) REFERENCES `team` (`team_name`),
    FOREIGN KEY (`league_name`) REFERENCES `league` (`league_name`),
    PRIMARY KEY (`team_name`, `league_name`)
);

CREATE TABLE `relegation` (
    `team_name` VARCHAR(50) NOT NULL,
    `league_name` VARCHAR(50) NOT NULL,
    FOREIGN KEY (`team_name`) REFERENCES `team` (`team_name`),
    FOREIGN KEY (`league_name`) REFERENCES `league` (`league_name`),
    PRIMARY KEY (`team_name`, `league_name`)
);

-- ———————————–––––––––––––––(Staff)---------------------------------

CREATE TABLE `staff` (
    `staff_ssn` INT NOT NULL,
    `staff_name` VARCHAR(50) NOT NULL,
    `staff_age` TINYINT,
    `staff_salary` INT NOT NULL,
    `staff_job` VARCHAR(50) NOT NULL,
    `team_name` VARCHAR(50) NOT NULL,
    `duration_agreement` DATE NOT NULL,
    `in_date` DATE,
    FOREIGN KEY (`team_name`) REFERENCES `team` (`team_name`),
    PRIMARY KEY (`staff_ssn`)
);

-- ———————————–––––––––––––––(Coach)---------------------------------

CREATE TABLE `coach` (
    `coach_ssn` INT NOT NULL,
    `coach_name` VARCHAR(50) NOT NULL,
    `coach_age` TINYINT,
    `coach_salary` INT NOT NULL,
    `team_name` VARCHAR(50) NOT NULL,
    `duration_agreement` DATE NOT NULL,
    `in_date` DATE,
    FOREIGN KEY (`team_name`) REFERENCES `team` (`team_name`),
    PRIMARY KEY (`coach_ssn`)
);

-- ———————————–––––––––––––––(Player & Tranfer)--------------------------------

CREATE TABLE `player` (
    `player_ssn` INT NOT NULL,
    `player_name` VARCHAR(50) NOT NULL,
    `player_age` TINYINT,
    `player_number` TINYINT NOT NULL,
    `player_salary` INT NOT NULL,
    `team_name` VARCHAR(50) NOT NULL,
    FOREIGN KEY (`team_name`) REFERENCES `team` (`team_name`),
    PRIMARY KEY (`player_ssn`)
);

CREATE TABLE `transfer` (
    `player_ssn` INT NOT NULL,
    `in_team` VARCHAR(50) NOT NULL,
    `out_team` VARCHAR(50) NOT NULL,
    `duration_agreement` DATE NOT NULL,
    `in_date` DATE NOT NULL,
    `transfer_fee` INT NOT NULL DEFAULT 0, -- as free player
    FOREIGN KEY (`player_ssn`) REFERENCES `player` (`player_ssn`),
    FOREIGN KEY (`in_team`) REFERENCES `team` (`team_name`),
    FOREIGN KEY (`out_team`) REFERENCES `team` (`team_name`),
    PRIMARY KEY (`player_ssn`, `in_team`, `out_team`)
)

-- ———————————–––––––––––––––(Player Posts)--------------------------

CREATE TABLE `player_posts` (
    `player_ssn` INT NOT NULL,
    `player_posts` VARCHAR(3) NOT NULL,
    FOREIGN KEY (`player_ssn`) REFERENCES `player` (`player_ssn`),
    PRIMARY KEY (`player_ssn`, `player_posts`)
);

-- ———————————–––––––––––––––(Spectator)-----------------------------

CREATE TABLE `spectator` (
    `spectator_ssn` INT NOT NULL,
    `spectator_name` VARCHAR(50) NOT NULL,
    `spectator_gender` CHAR(1) NOT NULL,
    `spectator_age` TINYINT,
    PRIMARY KEY (`spectator_ssn`)
);

-- ———————————–––––––––––––––(Referee Team)--------------------------

CREATE TABLE `referee_team` (
    `referee_team_id` INT NOT NULL AUTO_INCREMENT,
    `referee_team_rate` DECIMAL NOT NULL DEFAULT 0,
    `main_referee` VARCHAR(50) NOT NULL,
    `right_referee` VARCHAR(50) NOT NULL,
    `left_referee` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`referee_team_id`)
);

-- ———————————–––––––––––––––(Match)---------------------------------

CREATE TABLE `match` (
    `home_team` VARCHAR(50) NOT NULL,
    `away_team` VARCHAR(50) NOT NULL,
    `stadium_name` VARCHAR(50) NOT NULL,
    `match_date` DATE NOT NULL,
    `match_result` VARCHAR(5) NOT NULL DEFAULT '0-0',
    -- `spectators` INT, -- spectators = number of ticket_id 
    `week_of_league` TINYINT,
    `referee_team_id` INT,
    FOREIGN KEY (`home_team`) REFERENCES `team` (`team_name`),
    FOREIGN KEY (`away_team`) REFERENCES `team` (`team_name`),
    FOREIGN KEY (`stadium_name`) REFERENCES `stadium` (`stadium_name`),
    FOREIGN KEY (`referee_team_id`) REFERENCES `referee_team` (`referee_team_id`),
    PRIMARY KEY (`stadium_name`, `match_date`)
);

-- ———————————–––––––––––––––(Ticket)--------------------------------

CREATE TABLE `ticket` (
    `match_stadium` VARCHAR(50) NOT NULL,
    `match_date` DATE NOT NULL,
    `ticket_id` INT NOT NULL AUTO_INCREMENT,
    `spectator_ssn` INT NOT NULL,
    `price` INT NOT NULL DEFAULT 0,
    `vip` VARCHAR(3) NOT NULL DEFAULT 'NO', -- if yes in query price = price * 1.5
    FOREIGN KEY (`match_stadium`, `match_date`) REFERENCES `match` (`stadium_name`, `match_date`),
    FOREIGN KEY (`spectator_ssn`) REFERENCES `spectator` (`spectator_ssn`),
    PRIMARY KEY (`ticket_id`, `match_date`, `match_stadium`)
);

-- ———————————–––––––––––––––(Team & Player Match Information)----------------

CREATE TABLE `match_team_information` (
    `match_stadium` VARCHAR(50) NOT NULL,
    `match_date` DATE NOT NULL,
    `team_name` VARCHAR(50) NOT NULL,
    `hosting_status` VARCHAR(4) NOT NULL, -- Home or Away
    `team_arrange` VARCHAR(10) NOT NULL,
    `goals_score` TINYINT NOT NULL DEFAULT 0,
    `goals_concede` TINYINT NOT NULL DEFAULT 0,
    `coach_ssn` INT NOT NULL,
    `coach_card` VARCHAR(6) DEFAULT NULL, -- Yellow or Red
    FOREIGN KEY (`match_stadium`, `match_date`) REFERENCES `match` (`stadium_name`, `match_date`),
    FOREIGN KEY (`team_name`) REFERENCES `team` (`team_name`),
    FOREIGN KEY (`coach_ssn`) REFERENCES `coach` (`coach_ssn`),
    PRIMARY KEY (`team_name`, `match_stadium`, `match_date`)
);

CREATE TABLE `match_player_information` (
    `match_stadium` VARCHAR(50) NOT NULL,
    `match_date` DATE NOT NULL,
    `player_ssn` INT NOT NULL,
    `team_name` VARCHAR(50) NOT NULL,
    `player_post` VARCHAR(3) NOT NULL,
    `player_rate` DECIMAL NOT NULL DEFAULT 5.00,
    `player_injury` VARCHAR(3) DEFAULT 'NO',
    FOREIGN KEY (`match_stadium`, `match_date`) REFERENCES `match` (`stadium_name`, `match_date`),
    FOREIGN KEY (`team_name`) REFERENCES `team` (`team_name`),
    FOREIGN KEY (`player_ssn`) REFERENCES `player` (`player_ssn`),
    PRIMARY KEY (`player_ssn`, `match_stadium`, `match_date`)
);

-- CREATE TABLE `substitution` (
--     `out_player` INT NOT NULL,
--     `in_player` INT NOT NULL,
--     `match_stadium` VARCHAR(50) NOT NULL,
--     `match_date` DATE NOT NULL,
--     `team_name` VARCHAR(50) NOT NULL,
--     `subs_time` TIME NOT NULL,
--     FOREIGN KEY (`team_name`, `match_stadium`, `match_date`) REFERENCES `match_team_information` (`team_name`, `match_stadium`, `match_date`),
--     FOREIGN KEY (`out_player`) REFERENCES `player` (`player_ssn`),
--     FOREIGN KEY (`in_player`) REFERENCES `player` (`player_ssn`),
--     PRIMARY KEY (`out_player`, `in_player`, `match_stadium`, `match_date`)
-- );

CREATE TABLE `substitution` (
    `out_player` INT NOT NULL,
    `in_player` INT NOT NULL,
    `match_stadium` VARCHAR(50) NOT NULL,
    `match_date` DATE NOT NULL,
    `team_name` VARCHAR(50) NOT NULL,
    `subs_time` TIME NOT NULL,
    FOREIGN KEY (`team_name`, `match_stadium`, `match_date`) REFERENCES `match_team_information` (`team_name`, `match_stadium`, `match_date`),
    FOREIGN KEY (`out_player`, `match_stadium`, `match_date`) REFERENCES `match_player_information` (`player_ssn`, `match_stadium`, `match_date`),
    FOREIGN KEY (`in_player`, `match_stadium`, `match_date`) REFERENCES `match_player_information` (`player_ssn`, `match_stadium`, `match_date`),
    PRIMARY KEY (`out_player`, `in_player`, `match_stadium`, `match_date`)
);

-- ———————————––––––––––––(Player Score &  Player Cards Information)-----------------

CREATE TABLE `pleyer_scores` (
    `match_stadium` VARCHAR(50) NOT NULL,
    `match_date` DATE NOT NULL,
    `player_ssn` INT NOT NULL,
    `penalty` VARCHAR(3) NOT NULL DEFAULT 'NO',
    `score_time` TIME NOT NULL,
    FOREIGN KEY (`player_ssn`, `match_stadium`, `match_date`) REFERENCES `match_player_information` (`player_ssn`, `match_stadium`, `match_date`),
    PRIMARY KEY (`player_ssn`, `score_time`, `match_stadium`, `match_date`)
);

CREATE TABLE `player_cards` (
    `match_stadium` VARCHAR(50) NOT NULL,
    `match_date` DATE NOT NULL,
    `player_ssn` INT NOT NULL,
    `card_color` VARCHAR(6) NOT NULL DEFAULT 'Yellow', -- Yellow or Red
    `card_time` TIME NOT NULL,
    FOREIGN KEY (`player_ssn`, `match_stadium`, `match_date`) REFERENCES `match_player_information` (`player_ssn`, `match_stadium`, `match_date`),
    PRIMARY KEY (`player_ssn`, `card_time`, `match_stadium`, `match_date`)
);

-- ———————————–––––––––––––––----------------------------------------