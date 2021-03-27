/* Query #1:  Hakee kaikki kaverit, jotka eivät ole hyväksyneet kaveripyyntöä.*/
SELECT 
    *
FROM
    friendship
WHERE
    confirmation = 0;
    
    
/* Query #2:  Hakee kaikki tehdyt liikunnat ennen klo 8 tai klo 16 jälkeen*/
SELECT 
    UserGivenName, ExerciseDate, StartTime
FROM
    completed_exercises
WHERE
    StartTime < '08:00:00'
        OR StartTime > '16:00:00';
        
        
/* Query #3:  Käyttäjät pituusjärjestyksessä*/
SELECT 
    nickname, height
FROM
    user
ORDER BY height DESC;
    
    
/* Query #4:  Tehdyt suoritukset, joissa status on Good*/
SELECT 
    COUNT(UserID) AS 'Completed exercises with status: Good'
FROM
    completed_exercises
WHERE
    Feeling = 'Good';


/* Query #5:  Kaikki pyöräilyt ennen vuotta 2021*/
SELECT 
    userid, usergivenname
FROM
    completed_exercises
WHERE
    exerciseid = 5
        AND exercisedate < DATE('2021-01-01');


/* Query #6:  Tehtyjen suoritusten keskiarvo minuuteissa*/
SELECT 
    AVG(TIME_TO_SEC(endtime) - TIME_TO_SEC(starttime)) / 60
FROM
    completed_exercises;


/* Query #7:  tehdyt suoritukset yhteensä per käyttäjä*/
SELECT 
    completed_exercises.userid,
    completed_exercises.UserGivenName,
    SUM(exercise.PointsPerHour)
FROM
    completed_exercises
        INNER JOIN
    exercise ON completed_exercises.ExerciseID = exercise.exerciseid
GROUP BY userid;


/* Query #8:  laji, jossa on alle 200 pistettä per tunti*/
SELECT 
    exerciseid, PointsPerHour
FROM
    exercise
GROUP BY ExerciseID
HAVING pointsperhour < 200;


/* Query #9:  hakee käyttäjien iät vuonna 2021*/
SELECT 
    Nickname,
    COALESCE(2021 - YEAR(birthday), 'Info missing') AS Age
FROM
    user;


/* Query #10: Hakee kaikkien käyttäjien yhteenlasketut pisteet. */
SELECT 
    user.nickname AS 'Nickname',
    SUM(ROUND((exercise.PointsPerHour / 3600 * (TIME_TO_SEC(endtime) - TIME_TO_SEC(starttime))), 0)) 
            + COALESCE(SUM(challenges.challengepoints), 0) AS 'Total Points'
FROM
    challenges
        RIGHT JOIN
    completed_challenges ON challenges.ChallengeID = completed_challenges.ChallengeID
        RIGHT JOIN
    user ON completed_challenges.userid = user.userid
        RIGHT JOIN
    completed_exercises ON completed_exercises.userid = user.userid
        RIGHT JOIN
    exercise ON completed_exercises.ExerciseID = exercise.ExerciseID
GROUP BY user.nickname
ORDER BY user.nickname;

/*Tekijät JE & SI @ Laurea NTA220SA*/