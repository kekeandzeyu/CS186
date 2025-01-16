-- Before running drop any existing views
DROP VIEW IF EXISTS q0;
DROP VIEW IF EXISTS q1i;
DROP VIEW IF EXISTS q1ii;
DROP VIEW IF EXISTS q1iii;
DROP VIEW IF EXISTS q1iv;
DROP VIEW IF EXISTS q2i;
DROP VIEW IF EXISTS q2ii;
DROP VIEW IF EXISTS q2iii;
DROP VIEW IF EXISTS q3i;
DROP VIEW IF EXISTS q3ii;
DROP VIEW IF EXISTS q3iii;
DROP VIEW IF EXISTS q4i;
DROP VIEW IF EXISTS q4ii;
DROP VIEW IF EXISTS q4iii;
DROP VIEW IF EXISTS q4iv;
DROP VIEW IF EXISTS q4v;

-- Question 0
CREATE VIEW q0(era)
AS
  SELECT MAX(era)
  FROM pitching
;

-- Question 1i
/* In the people table, find the namefirst, namelast and birthyear for all players with
weight greater than 300 pounds. */
CREATE VIEW q1i(namefirst, namelast, birthyear)
AS
  SELECT namefirst, namelast, birthyear
  FROM people
  WHERE weight > 300
;

-- Question 1ii
/* Find the namefirst, namelast and birthyear of all players whose namefirst field 
contains a space. Order the results by namefirst, breaking ties with namelast both in 
ascending order */
CREATE VIEW q1ii(namefirst, namelast, birthyear)
AS
  SELECT namefirst, namelast, birthyear
  FROM people
  WHERE namefirst LIKE '% %'
  ORDER BY namefirst ASC, namelast ASC
;

-- Question 1iii
/* From the people table, group together players with the same birthyear, and report the
birthyear, average height, and number of players for each birthyear. Order the results 
by birthyear in ascending order. */
CREATE VIEW q1iii(birthyear, avgheight, count)
AS
  SELECT birthyear, AVG(height), COUNT(*)
  FROM people
  GROUP BY birthyear
  ORDER BY birthyear ASC
;

-- Question 1iv
/* Following the results of part iii, now only include groups with an average height > 
70. Again order the results by birthyear in ascending order. */
CREATE VIEW q1iv(birthyear, avgheight, count)
AS
  SELECT birthyear, AVG(height), COUNT(*)
  FROM people
  GROUP BY birthyear
  HAVING AVG(height) > 70
  ORDER BY birthyear ASC
;

-- Question 2i
/* Find the namefirst, namelast, playerid and yearid of all people who were successfully 
inducted into the Hall of Fame in descending order of yearid. Break ties on yearid by 
playerid (ascending). */
/* Watch out for ambiguous playerid */
CREATE VIEW q2i(namefirst, namelast, playerid, yearid)
AS
  SELECT namefirst, namelast, people.playerid, yearid
  FROM people INNER JOIN HallofFame ON people.playerID = HallofFame.playerID
  WHERE HallofFame.inducted = 'Y'
  ORDER BY yearid DESC, people.playerid ASC
;

-- Question 2ii
/* Find the people who were successfully inducted into the Hall of Fame and played in 
college at a school located in the state of California. For each person, return their 
namefirst, namelast, playerid, schoolid, and yearid in descending order of yearid. Break
ties on yearid by schoolid, playerid (ascending). For this question, yearid refers to 
the year of induction into the Hall of Fame. */
CREATE VIEW q2ii(namefirst, namelast, playerid, schoolid, yearid)
AS
  SELECT namefirst, namelast, people.playerid, CollegePlaying.schoolid, yearid
  FROM people
  INNER JOIN HallofFame ON people.playerID = HallofFame.playerID
  INNER JOIN CollegePlaying ON people.playerID = CollegePlaying.playerID
  WHERE HallofFame.inducted = 'Y' AND CollegePlaying.schoolid IN (
    SELECT schoolid
    FROM schools
    WHERE schoolState = 'CA'
  )
  ORDER BY yearid DESC, CollegePlaying.schoolid ASC, people.playerid ASC
;


-- Question 2iii
/* Find the playerid, namefirst, namelast and schoolid of all people who were 
successfully inducted into the Hall of Fame -- whether or not they played in college.
Return people in descending order of playerid. Break ties on playerid by schoolid 
(ascending). (Note: schoolid should be NULL if they did not play in college.) */
CREATE VIEW q2iii(playerid, namefirst, namelast, schoolid)
AS
  SELECT p.playerid, namefirst, namelast, cp.schoolid
  FROM people p
  INNER JOIN HallofFame h ON p.playerID = h.playerID
  LEFT JOIN CollegePlaying cp ON p.playerID = cp.playerID
  WHERE h.inducted = 'Y'
  ORDER BY p.playerid DESC, cp.schoolid ASC
;

-- Question 3i
CREATE VIEW q3i(playerid, namefirst, namelast, yearid, slg)
AS
  SELECT 1, 1, 1, 1, 1 -- replace this line
;

-- Question 3ii
CREATE VIEW q3ii(playerid, namefirst, namelast, lslg)
AS
  SELECT 1, 1, 1, 1 -- replace this line
;

-- Question 3iii
CREATE VIEW q3iii(namefirst, namelast, lslg)
AS
  SELECT 1, 1, 1 -- replace this line
;

-- Question 4i
CREATE VIEW q4i(yearid, min, max, avg)
AS
  SELECT 1, 1, 1, 1 -- replace this line
;

-- Question 4ii
CREATE VIEW q4ii(binid, low, high, count)
AS
  SELECT 1, 1, 1, 1 -- replace this line
;

-- Question 4iii
CREATE VIEW q4iii(yearid, mindiff, maxdiff, avgdiff)
AS
  SELECT 1, 1, 1, 1 -- replace this line
;

-- Question 4iv
CREATE VIEW q4iv(playerid, namefirst, namelast, salary, yearid)
AS
  SELECT 1, 1, 1, 1, 1 -- replace this line
;
-- Question 4v
CREATE VIEW q4v(team, diffAvg) AS
  SELECT 1, 1 -- replace this line
;

