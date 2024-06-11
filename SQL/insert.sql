-- =======================(Insert Tables)============================

USE `football_leagues`;

-- ——————–––—————––––––––––––(League)--------------------------------

INSERT INTO `league`
VALUES
    ('Khalig Fars', 'A', 16, 0, 2, 'Iran'),
    ('Azadegan', 'B', 18, 2, 3, 'Iran');

-- ——————–––—————–––––––––––––(Stadium)------------------------------

INSERT INTO `stadium`
VALUES
    ('Azadi', 100000, 'Tehran'),                     
    ('Naghsh-e-Jahan', 75000, 'Esfahan'),
    ('Shahid Dast-gerdi', 8000, 'Tehran'),                
    ('Takhti', 30000, 'Abadan'),
    ('Foulad Arena', 50000, 'Khozestan'),
    ('Yadegar Emam', 60000, 'Tabriz'),
    ('Shohada', 25000, 'Tehran'),
    ('Lor Arena', 15000, 'Khorram Abad'),
    ('Pars', 50000, 'Shiraz');

-- ——————–––—————–––––––––––––(Team)---------------------------------

INSERT INTO `team`
VALUES
    ('Perspolis', 'Khalig Fars', 'Tehran', 'Azadi', 68, 45, 18, 20, 8, 2),
    ('Esteghlal', 'Khalig Fars', 'Tehran', 'Azadi', 67, 40, 15, 19, 10, 1),
    ('Sepahan', 'Khalig Fars', 'Esfahan', 'Naghsh-e-Jahan', 57, 53, 26, 17, 6, 7),
    ('Havadar', 'Khalig Fars', 'Tehran', 'Shahid Dast-gerdi', 29, 31, 48, 6, 11, 13),
    ('Peikan', 'Khalig Fars', 'Tehran', 'Shohada', 27, 25, 38, 4, 15, 11),
    ('San-at Naft', 'Khalig Fars', 'Abadan', 'Takhti', 21, 24, 49, 4, 9, 17),
    ('Foulad', 'Khalig Fars', 'Khozestan', 'Foulad Arena', 47, 33, 20, 15, 8, 6),
    ('Tracktor', 'Khalig Fars', 'Tabriz', 'Yadegar Emam', 52, 41, 19, 21, 5, 4);

INSERT INTO `team`
VALUES
    ('Kheibar', 'Azadegan', 'Khorram Abad', 'Lor Arena', 76, 58, 24, 25, 1, 7),
    ('Fajr Sepasi', 'Azadegan', 'Shiraz', 'Pars', 70, 48, 17, 21, 7, 5);

-- ——————–––—————–––––(Promotion & Relegation)-----------------------

INSERT INTO `promotion`
VALUES
    ('Kheibar', 'Azadegan'),
    ('Fajr Sepasi', 'Azadegan');

INSERT INTO `relegation`
VALUES
    ('Peikan', 'Khalig Fars'),
    ('San-at Naft', 'Khalig Fars');

-- ——————–––—————–––––––––––––(Staff)--------------------------------

INSERT INTO `staff`
VALUES
    (156, 'Morad Sadeghi', 46, 40000, 'Psychologist', 'Perspolis', '2024-06-01', NULL),
    (953, 'Ahmad Molaei', NULL, 57000, 'Programmer', 'Perspolis', '2026-02-05', '2024-08-05'),
    (836, 'Mostafa Babaei', NULL, 105000, 'Doctor', 'Sepahan', '2025-07-01', NULL),
    (15, 'Mansour Elahi', 43, 105000, 'Masseur', 'Esteghlal', '2025-11-20', '2022-07-20'),
    (51, 'Gholam Teymouri', 49, 90000, 'Bodybuilding coach', 'Peikan', '2025-06-10', '2021-07-10'),
    (48, 'Rahmat Kamali', 49, 90000, 'Analyzer', 'San-at Naft', '2027-06-01', NULL);

-- ——————–––—————–––––––––––––(Coach)--------------------------------

INSERT INTO `coach`
VALUES
    (58,'Usmar Viera', 58, 300000, 'Perspolis', '2026-04-01', '2024-04-01'),
    (91,'Jose Morais', 50, 250000, 'Sepahan', '2025-11-20', NULL),
    (35,'Javad Nekounam', NULL, 340000, 'Esteghlal', '2025-07-01', '2023-07-01'),
    (96,'Abdollah Veysi', 49, 240000, 'San-at Naft', '2025-01-01', '2023-01-01'),
    (99,'Masoud Shojaei', 53, 210000, 'Havadar', '2025-07-01', NULL),
    (14,'Rasoul Khatibi', 46, 270000, 'Peikan', '2027-06-01', '2024-06-01'),
    (27,'Amir Ghalenoei', 38, 3200000, 'Tracktor', '2028-07-01', '2025-07-01'),
    (61,'Ali-Reza Mansourian', 43, 2200000, 'Foulad', '2026-12-01', '2025-11-01');

-- ——————–––—————–––––––––––––(Player & Transfer)-------------------------------

INSERT INTO `player`
VALUES
    (1836, 'Ali-Reza Beyramvand', 32, 1, 400000, 'Perspolis'),
    (8087, 'Mehdi Torabi', 26, 18, 300000, 'Perspolis'),
    (7450, 'Shahriar Moghanloo', 25, 5, 235000, 'Sepahan'),
    (5027, 'Reza Ramezani', 22, 13, 380000, 'Sepahan'),
    (9087, 'Shoja Khalilzadeh', 33, 21, 350000, 'Havadar'),
    (1153, 'Mehrad Akbari', 19, 17, 240000, 'Havadar'),
    (9873, 'Hossein Hoseini', 28, 99, 250000, 'Esteghlal'),
    (8071, 'Abolfazl Jalali', 25, 10, 280000, 'Esteghlal'),
    (5981, 'Yaser Laheghi', 34, 11, 180000, 'Peikan'),
    (2211, 'Abbas Nouri', 27, 12, 170000, 'Peikan'),
    (3701, 'Saman Pouri', 27, 7, 195000, 'Foulad'),
    (4201, 'Afshin Norouzi', 35, 2, 200000, 'Foulad'),
    (7835, 'Mohsen Nourbakhsh', 33, 14, 310000, 'Tracktor'),
    (7828, 'Erfan Abedi', 21, 16, 300000, 'Tracktor'),
    (3465, 'Reza Hosseini', 21, 5, 155000, 'San-at Naft'),
    (3413, 'Morteza Mohammadi', 31, 25, 160000, 'San-at Naft');


INSERT INTO `transfer`
VALUES
    (9087, 'Havadar', 'Perspolis', '2025-11-20', '2023-09-01', 400000),
    (7450, 'Sepahan', 'Peikan', '2025-07-01', '2024-07-01', 380000),
    (9873, 'Esteghlal', 'Sepahan', '2027-06-01', '2024-06-01', 270000),
    (1836, 'Perspolis', 'Perspolis', '2025-09-01', '2023-08-04', 0),
    (8071, 'Esteghlal', 'Esteghlal', '2028-01-01', '2024-08-20', DEFAULT),
    (8087, 'Perspolis', 'San-at Naft', '2027-06-05', '2023-04-15', 310000);

-- ——————–––—————–––––––(Player Posts)-----------------------

INSERT INTO `player_posts`
VALUES
    (1836, 'GK'),
    (8087, 'RW'),
    (8087, 'SS'),
    (9087, 'CAM'),
    (7450, 'CF'),
    (7450, 'SS'),
    (5027, 'SS'),
    (9087, 'CB'),
    (9087, 'CDM'),
    (1153, 'LW'),
    (9873, 'GK'),
    (8071, 'LB'),
    (8071, 'RB'),
    (5981, 'CM'),
    (2211, 'RM'),
    (2211, 'CAM'),
    (3701, 'CDM'),
    (4201, 'SS'),
    (7835, 'RB'),
    (7828, 'GK'),
    (3465, 'CM'),
    (3465, 'CAM'),
    (3465, 'LM'),
    (3413, 'CF');


-- ——————–––—————––––––––––––(Spectator)-----------------------------

INSERT INTO `spectator`
VALUES
    (5689, 'Ali Jamali', 'M', 35),
    (1243, 'Mousa Ebrahimi', 'M', 29),
    (6709, 'Fatamah Arabi', 'F', 25),
    (0163, 'Mahdi Bagheri', 'M', 17),
    (7001, 'Javad Mousavi', 'M', 43),
    (5010, 'Naser Ganji', 'M', 31),
    (2102, 'Melika Nazari', 'F', 30);

-- ——————–––—————–––––––––––(Referee Team)---------------------------

INSERT INTO `referee_team`
VALUES
    (1, 9.2, 'Ali-Reza Faghani', 'Mohsen Rezaei', 'Abbas Houshangi'),
    (4, 7.1, 'Reza Mohammadi', 'Mansour Zolfigol', 'Shahram Ziarati'),
    (9, 8.0, 'Sajad Mahdavi', 'Abolfazl Ghiasi', 'Jamal Mortazavi'),
    (6, 6.8, 'Hossein Pourzand', 'Rahman Rajabi', 'Matin Azari');

-- ——————–––—————––––––––––––––(Match)-------------------------------

INSERT INTO `match`                                       
VALUES
    ('Perspolis', 'Esteghlal', 'Azadi', '2024-08-23', '2-2', 5, 1),
    ('Esteghlal', 'Perspolis', 'Azadi', '2025-02-25', '0-1', 23, 6),
    ('Sepahan', 'Peikan', 'Naghsh-e-Jahan', '2024-07-12', '3-0', 2, 9),
    ('Peikan', 'Sepahan', 'Shohada', '2024-11-04', '0-0', 14, 4),
    ('Havadar', 'San-at Naft', 'Shahid Dast-gerdi', '2024-10-06', '1-1', 12, 9),
    ('Tracktor', 'Foulad', 'Yadegar Emam', '2024-11-05', '4-2', 14, 1),
    ('Foulad', 'Perspolis', 'Foulad Arena', '2024-08-24', '1-3', 10, 6),
    ('San-at Naft', 'Esteghlal', 'Takhti', '2025-03-20', '0-2', 27, 4);



-- ——————–––—————–––––––––––––(Ticket)-------------------------------

INSERT INTO `ticket`
VALUES
    ('Azadi', '2024-08-23', 5988, 5689, 4000, 'NO'),    
    ('Azadi', '2025-02-25', 687, 1243, 6000, 'YES'),
    ('Naghsh-e-Jahan', '2024-07-12',954, 6709, 3000, 'NO'),
    ('Shohada', '2024-11-04', 1256, 5010, 2000, 'NO'),
    ('Shahid Dast-gerdi', '2024-10-06', 2756, 7001, 1500, 'NO'),
    ('Yadegar Emam', '2024-11-05', 78, 2102, 3000, 'YES'),
    ('Foulad Arena', '2024-08-24', 6710, 5689, 3000, 'NO'),
    ('Takhti', '2025-03-20', 611, 7001, 1500, 'NO');




-- ———————————–––––––––––––––(Team & Player Match Information)----------------

INSERT INTO `match_team_information`
VALUES
    ('Azadi', '2024-08-23', 'Perspolis', 'Home', '4-3-1-2', 2, 2, 58, DEFAULT),
    ('Azadi', '2024-08-23', 'Esteghlal', 'Away', '4-3-3', 2, 2, 35, NULL),
    ('Azadi', '2025-02-25', 'Esteghlal', 'Home', '4-3-3', 0, 1, 35, 'Yellow'),
    ('Azadi', '2025-02-25', 'Perspolis', 'Away', '4-3-1-3', 1, 0, 58, NULL),
    ('Naghsh-e-Jahan', '2024-07-12', 'Sepahan', 'Home', '4-4-2', 3, 0, 91, NULL),
    ('Naghsh-e-Jahan', '2024-07-12', 'Peikan', 'Away', '3-5-2', 0, 3, 14, 'Yellow'),
    ('Shohada', '2024-11-04', 'Peikan', 'Home', '3-5-2', 0, 0, 14, NULL),
    ('Shohada', '2024-11-04', 'Sepahan', 'Away', '4-4-2', 0, 0, 91, NULL),
    ('Shahid Dast-gerdi', '2024-10-06', 'Havadar', 'Home', '4-3-3', 1, 1, 99, NULL),
    ('Shahid Dast-gerdi', '2024-10-06', 'San-at Naft', 'Away', '4-3-2-1', 1, 1, 96, NULL),
    ('Yadegar Emam', '2024-11-05', 'Tracktor', 'Home', '4-3-3', 4, 2, 27, NULL),
    ('Yadegar Emam', '2024-11-05', 'Foulad', 'Away', '5-3-2', 2, 4, 61, NULL),
    ('Foulad Arena', '2024-08-24', 'Foulad', 'Home', '5-3-2', 1, 3, 61, 'Red'),
    ('Foulad Arena', '2024-08-24', 'Perspolis', 'Away', '4-3-1-2', 3, 1, 58, NULL),
    ('Takhti', '2025-03-20', 'San-at Naft', 'Away', '4-3-2-1', 0, 2, 96, NULL),
    ('Takhti', '2025-03-20', 'Esteghlal', 'Away', '4-3-3', 2, 0, 35, NULL);


INSERT INTO `match_Player_information`
VALUES
    ('Azadi', '2024-08-23', 1836, 'Perspolis', 'GK', 7.0, 'NO'),
    ('Azadi', '2024-08-23', 8087, 'Perspolis', 'RW', 8.6, DEFAULT),
    ('Azadi', '2024-08-23', 8071, 'Esteghlal', 'LB', 7.8, 'NO'),
    ('Azadi', '2024-08-23', 9873, 'Esteghlal', 'GK', 7.5, 'NO'),
    ('Azadi', '2025-02-25', 8071, 'Esteghlal', 'LB', 7.2, DEFAULT),
    ('Azadi', '2025-02-25', 9873, 'Esteghlal', 'GK', 9.1, DEFAULT),
    ('Azadi', '2025-02-25', 1836, 'Perspolis', 'GK', 8.2, DEFAULT),
    ('Azadi', '2025-02-25', 8087, 'Perspolis', 'SS', 7.6, DEFAULT),
    ('Naghsh-e-Jahan', '2024-07-12', 7450, 'Sepahan', 'CF', 8.9, 'NO'),
    ('Naghsh-e-Jahan', '2024-07-12', 5027, 'Sepahan', 'SS', 5.8, 'NO'),
    ('Naghsh-e-Jahan', '2024-07-12', 5981, 'Peikan', 'CM', 7.7, 'NO'),
    ('Naghsh-e-Jahan', '2024-07-12', 2211, 'Peikan', 'CAM', 7.1, 'NO'),
    ('Shohada', '2024-11-04', 5981, 'Peikan', 'CM', 6.4, 'NO'),
    ('Shohada', '2024-11-04', 2211, 'Peikan', 'RM', 6.0, 'NO'),
    ('Shohada', '2024-11-04', 7450, 'Sepahan', 'CF', 5.9, 'YES'),
    ('Shohada', '2024-11-04', 5027, 'Sepahan', 'SS', 6.9, 'NO'),
    ('Shahid Dast-gerdi', '2024-10-06', 1153, 'Havadar', 'LW', 6.6, 'NO'),
    ('Shahid Dast-gerdi', '2024-10-06', 9087, 'Havadar', 'CB', 7.8, 'NO'),
    ('Shahid Dast-gerdi', '2024-10-06', 3465, 'San-at Naft', 'CAM', 6.2, 'NO'),
    ('Shahid Dast-gerdi', '2024-10-06', 3413, 'San-at Naft', 'CF', 8.4, 'YES'),
    ('Yadegar Emam', '2024-11-05', 7835, 'Tracktor', 'RB', 9.0, 'NO'),
    ('Yadegar Emam', '2024-11-05', 7828, 'Tracktor', 'GK', 8.3, 'NO'),
    ('Yadegar Emam', '2024-11-05', 3701, 'Foulad', 'CDM', 5.0, 'NO'),
    ('Yadegar Emam', '2024-11-05', 4201, 'Foulad', 'SS', 6.0, 'NO'),
    ('Foulad Arena', '2024-08-24', 3701, 'Foulad', 'CDM', 7.0, 'NO'),
    ('Foulad Arena', '2024-08-24', 4201, 'Foulad', 'SS', 6.1, 'NO'),
    ('Foulad Arena', '2024-08-24', 1836, 'Perspolis', 'GK', 7.1, 'NO'),
    ('Foulad Arena', '2024-08-24', 8087, 'Perspolis', 'SS', 8.8, 'YES'),
    ('Takhti', '2025-03-20', 3465, 'San-at Naft', 'LM', 7.3, 'NO'),
    ('Takhti', '2025-03-20', 3413, 'San-at Naft', 'CF', 6.5, 'NO'),
    ('Takhti', '2025-03-20', 9873, 'Esteghlal', 'GK', 5.7, 'NO'),
    ('Takhti', '2025-03-20', 8071, 'Esteghlal', 'RB', 6.6, 'NO');


INSERT INTO `substitution`
VALUES
    (1836, 8087, 'Azadi', '2024-08-23', 'Perspolis', '00:51:06'),
    (9873, 8071, 'Azadi', '2024-08-23', 'Esteghlal', '00:58:32'),
    (9873, 8071, 'Azadi', '2025-02-25', 'Esteghlal', '00:47:30'),
    (8087, 1836, 'Azadi', '2025-02-25', 'Perspolis', '00:54:52'),
    (7450, 5027, 'Naghsh-e-Jahan', '2024-07-12', 'Sepahan', '01:07:02'),
    (5981, 2211, 'Naghsh-e-Jahan', '2024-07-12', 'Peikan', '00:49:09'),
    (2211, 5981, 'Shohada', '2024-11-04', 'Peikan', '01:04:58'),
    (7450, 5027, 'Shohada', '2024-11-04', 'Sepahan', '01:20:02'),
    (1153, 9087, 'Shahid Dast-gerdi', '2024-10-06', 'Havadar', '01:01:14'),
    (3465, 3413, 'Shahid Dast-gerdi', '2024-10-06', 'San-at Naft', '00:56:23'),
    (7835, 7828, 'Yadegar Emam', '2024-11-05', 'Tracktor', '00:49:13'),
    (4201, 3701, 'Yadegar Emam', '2024-11-05', 'Foulad', '01:05:38'),
    (3701, 4201, 'Foulad Arena', '2024-08-24', 'Foulad', '00:43:59'),
    (8087, 1836, 'Foulad Arena', '2024-08-24', 'Perspolis', '00:51:32'),
    (3413, 3465, 'Takhti', '2025-03-20', 'San-at Naft', '00:48:14'),
    (8071, 9873, 'Takhti', '2025-03-20', 'Esteghlal', '00:53:27');

-- ———————————––––––––––––(Player Score &  Player Cards Information)-----------------

INSERT INTO `pleyer_scores`
VALUES   
    ('Azadi', '2024-08-23', 8087, 'NO', '00:53:44'),
    ('Azadi', '2024-08-23', 8087, 'NO', '01:16:44'),
    ('Azadi', '2024-08-23', 8071, 'YES', '00:31:18'),
    ('Naghsh-e-Jahan', '2024-07-12', 7450, 'NO', '00:08:35'),
    ('Naghsh-e-Jahan', '2024-07-12', 7450, 'NO', '00:41:27'),
    ('Shahid Dast-gerdi', '2024-10-06', 1153, 'YES', '01:07:22'),
    ('Shahid Dast-gerdi', '2024-10-06', 3413, 'NO', '00:41:27'),
    ('Yadegar Emam', '2024-11-05', 7835, 'NO', '00:54:29'),
    ('Yadegar Emam', '2024-11-05', 7835, 'NO', '00:41:27'),
    ('Yadegar Emam', '2024-11-05', 7828, 'YES', '01:31:11'),
    ('Yadegar Emam', '2024-11-05', 4201, 'NO', '01:27:46'),
    ('Foulad Arena', '2024-08-24', 3701, 'NO', '00:21:25'),
    ('Foulad Arena', '2024-08-24', 8087, 'NO', '01:19:08'),
    ('Takhti', '2025-03-20', 8071, 'NO', '00:43:00');

INSERT INTO `player_cards`
VALUES   
    ('Azadi', '2024-08-23', 1836, 'Yellow', '00:50:19'),
    ('Azadi', '2024-08-23', 8071, 'Yellow', '01:11:18'),
    ('Azadi', '2025-02-25', 8087, 'Yellow', '00:25:37'),
    ('Naghsh-e-Jahan', '2024-07-12', 5027, 'Red', '01:17:22'),
    ('Shohada', '2024-11-04', 2211, 'Yellow', '00:56:19'),
    ('Shahid Dast-gerdi', '2024-10-06', 9087, 'Yellow', '01:21:49'),
    ('Yadegar Emam', '2024-11-05', 7828, 'Yellow', '00:56:19'),
    ('Foulad Arena', '2024-08-24', 3701, 'Yellow', '01:30:19'),
    ('Foulad Arena', '2024-08-24', 4201, 'Yellow', '00:56:12'),
    ('Takhti', '2025-03-20', 3413, 'Red', '00:48:14');

-- -------------------------------------------------------------------------------------