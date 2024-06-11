-- =======================(Insert Tables)============================

USE `football_leagues`;

-- ——————–––—————––––––––––––(League)--------------------------------

INSERT INTO `league`
VALUES
    ('Khalig Fars', 'A', 16, 0, 2, 'Iran'),
    ('Azadegan', 'B', 18, 2, 3, 'Iran');

-- ——————–––—————––––––––––––(Stadium)-------------------------------

INSERT INTO `stadium`
VALUES
    ('Azadi', 100000, 'Tehran'),                     
    ('Naghsh-e-Jahan', 75000, 'Esfahan'),
    ('Shahid Dast-gerdi', 8000, 'Tehran'),                
    ('Takhti', 30000, 'Abadan'),
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
    ('San-at Naft', 'Khalig Fars', 'Abadan', 'Takhti', 21, 24, 49, 4, 9, 17);

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
    (14,'Rasoul Khatibi', 46, 270000, 'Peikan',  '2027-06-01', '2024-06-01');

-- ——————–––—————––––––––(Player & Transfer)-------------------------

INSERT INTO `player`
VALUES
    (1836, 'Ali-Reza Beyramvand', 32, 1, 400000, 'Perspolis'),
    (8087, 'Mehdi Torabi', 26, 18, 300000, 'Perspolis'),
    (7450, 'Shahriar Moghanloo', 25, 5, 235000, 'Sepahan'),
    (9087, 'Shoja Khalilzadeh', 33, 21, 350000, 'Havadar'),
    (9873, 'Hossein Hoseini', 28, 99, 250000, 'Esteghlal'),
    (8071, 'Abolfazl Jalali', 25, 10, 280000, 'Esteghlal'),
    (5981, 'Yaser Laheghi', 34, 11, 180000, 'Peikan'),
    (1153, 'Mehrad Akbari', 19, 17, 240000, 'Havadar'),
    (5027, 'Reza Ramezani', 22, 13, 380000, 'Sepahan'); 

INSERT INTO `transfer`
VALUES
    (9087, 'Havadar', 'Perspolis', '2025-11-20', '2023-09-01', 400000),
    (7450, 'Sepahan', 'Peikan', '2025-07-01', '2024-07-01', 380000),
    (9873, 'Esteghlal', 'Sepahan', '2027-06-01', '2024-06-01', 270000),
    (1836, 'Perspolis', 'Perspolis', '2025-09-01', '2023-08-04', 0),
    (8071, 'Esteghlal', 'Esteghlal', '2028-01-01', '2024-08-20', DEFAULT),
    (8087, 'Perspolis', 'San-at Naft', '2027-06-05', '2023-04-15', 310000);

-- ——————–––—————–––––––––––(Player Posts)---------------------------

INSERT INTO `player_posts`
VALUES
    (1836, 'GK'),
    (8087, 'RW'),
    (8087, 'SS'),
    (9087, 'CAM'),
    (7450, 'CF'),
    (7450, 'SS'),
    (9087, 'CB'),
    (9087, 'CDM'),
    (9873, 'GK'),
    (8071, 'LB');

-- ——————–––—————–––––––––––––(Spectator)----------------------------

INSERT INTO `spectator`
VALUES
    (5689, 'Ali Jamali', 'M', 35),
    (1243, 'Mousa Ebrahimi', 'M', 29),
    (6709, 'Fatamah Arabi', 'F', 25),
    (0163, 'Mahdi Bagheri', 'M', 17),
    (7001, 'Javad Mousavi', 'M', 43),
    (5010, 'Naser Ganji', 'M', 31),
    (2102, 'Melika Nazari', 'F', 30);

-- ——————–––—————––––––––––––(Referee Team)--------------------------

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
    ('Sepahan', 'Peikan', 'Naghsh-e-Jahan', '2024-07-12', '3-0', 2, 9),
    ('Havadar', 'San-at Naft', 'Shahid Dast-gerdi', '2024-10-06', '1-2', 12, 9),
    ('Esteghlal', 'Perspolis', 'Azadi', '2025-02-25', '0-1', 23, 6),
    ('Peikan', 'Sepahan', 'Shohada', '2024-11-04', '0-0', 14, 4);

-- ——————–––—————–––––––––––––(Ticket)-------------------------------

INSERT INTO `ticket`
VALUES
    ('Azadi', '2024-08-23', 5988, 5689, 4000, 'NO'),    
    ('Azadi', '2025-02-25', 687, 1243, 6000, 'YES'),
    ('Naghsh-e-Jahan', '2024-07-12',954, 6709, 3000, 'NO'),
    ('Shahid Dast-gerdi', '2024-10-06', 2756, 7001, 1500, 'NO'),
    ('Shohada', '2024-11-04', 1256, 5010, 2000, 'NO');


-- ———————————–––––––(Team & Player Match Information)---------------

INSERT INTO `match_team_information`
VALUES
    ('Azadi', '2024-08-23', 'Perspolis', 'Home', '4-3-1-2', 2, 2, 58, DEFAULT),
    ('Azadi', '2024-08-23', 'Esteghlal', 'Away', '4-3-3', 2, 2, 35, NULL),
    ('Azadi', '2025-02-25', 'Esteghlal', 'Home', '4-3-3', 0, 1, 35, NULL),
    ('Azadi', '2025-02-25', 'Perspolis', 'Away', '4-3-1-2', 1, 0, 58, DEFAULT),
    ('Naghsh-e-Jahan', '2024-07-12', 'Sepahan', 'Home', '4-4-2', 3, 0, 91, NULL),
    ('Naghsh-e-Jahan', '2024-07-12', 'Peikan', 'Away', '3-5-2', 0, 3, 14, 'Yellow'),
    ('Shahid Dast-gerdi', '2024-10-06', 'Havadar', 'Home', '4-3-3', 0, 0, 14, NULL),
    ('Shahid Dast-gerdi', '2024-10-06', 'San-at Naft', 'Away', '4-3-2-1', 0, 0, 91, NULL);

INSERT INTO `match_Player_information`
VALUES
    ('Azadi', '2024-08-23', 8087, 'Perspolis', 'CAM', 7.6, DEFAULT),
    ('Azadi', '2024-08-23', 1836, 'Perspolis', 'GK', 7.0, 'NO'),
    ('Azadi', '2024-08-23', 8071, 'Esteghlal', 'LB', 6.8, 'NO'),
    ('Azadi', '2024-08-23', 9873, 'Esteghlal', 'GK', 7.5, 'NO'),
    ('Naghsh-e-Jahan', '2024-07-12', 7450, 'Sepahan', 'CF', 8.9, 'NO'),
    ('Naghsh-e-Jahan', '2024-07-12', 5027, 'Sepahan', 'CM', 7.1, 'NO'),
    ('Shahid Dast-gerdi', '2024-10-06', 9087, 'Havadar', 'CB', 5.9, 'YES'),
    ('Shahid Dast-gerdi', '2024-10-06', 1153, 'Havadar', 'RW', 6.0, 'NO');

INSERT INTO `substitution`
VALUES
    (1836, 8087, 'Azadi', '2024-08-23', 'Perspolis', '00:51:06'),
    (9873, 8071, 'Azadi', '2024-08-23', 'Esteghlal', '00:58:32'),
    (7450, 5027, 'Naghsh-e-Jahan', '2024-07-12', 'Sepahan', '01:07:02'),
    (1153, 9087, 'Shahid Dast-gerdi', '2024-10-06', 'Havadar', '01:16:14'); 

-- ——————————––(Player Score &  Player Cards Information)------------

INSERT INTO `pleyer_scores`
VALUES   
    ('Azadi', '2024-08-23', 8087, 'NO', '00:22:44'),
    ('Azadi', '2024-08-23', 8071, 'YES', '00:31:18'),
    ('Naghsh-e-Jahan', '2024-07-12', 7450, 'NO', '00:08:35'),
    ('Naghsh-e-Jahan', '2024-07-12', 7450, 'NO', '00:41:27'),
    ('Shahid Dast-gerdi', '2024-10-06', 1153, 'NO', '01:07:22');

INSERT INTO `player_cards`
VALUES   
    ('Azadi', '2024-08-23', 1836, 'Yellow', '00:56:19'),
    ('Azadi', '2024-08-23', 8071, 'Yellow', '00:47:18'),
    ('Shahid Dast-gerdi', '2024-10-06', 9087, 'Yellow', '01:21:49'),
    ('Naghsh-e-Jahan', '2024-07-12', 5027, 'RED', '00:57:22');

-- ———————————–––––––––––––––----------------------------------------