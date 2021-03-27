CREATE TABLE User (
	UserID INTEGER PRIMARY KEY NOT NULL,
    Nickname VARCHAR(10) NOT NULL,
    Birthday DATE NULL,
    Weight INTEGER NULL,
    Height INTEGER NULL,
    Gender VARCHAR(10) NULL
);
INSERT INTO User
	VALUES
		(1, 'Aada22', '1980-01-01', 60, 170, 'Female'),
		(2, 'Ben78465', '1995-07-13', 80, 175, 'Male'),
		(3, 'K3rttu01', '2001-05-24', 58, 165, 'Female'),
		(4, 'StarLord', '1989-06-03', 85, 185, 'Male'),
		(5, 'Aapo007', NULL, NULL, NULL, NULL);

CREATE TABLE Friendship (
	UserID INTEGER NOT NULL,
    FriendID INTEGER NOT NULL,
    Confirmation BOOLEAN NOT NULL,
    
    PRIMARY KEY(UserID, FriendID),
    
    FOREIGN KEY(UserID) REFERENCES User(UserID),
    FOREIGN KEY(FriendID) REFERENCES User(UserID)
);

INSERT INTO Friendship
	VALUES
		(1, 2, TRUE),
        (1, 4, TRUE),
        (1, 5, FALSE),
        (2, 3, TRUE),
        (3, 5, TRUE);     
    
CREATE TABLE Exercise (
	ExerciseID INTEGER NOT NULL PRIMARY KEY,
    SportType VARCHAR(10) NULL,
    PointsPerHour INTEGER NULL
);

INSERT INTO Exercise
	VALUES
		(1, 'Running', 700),
        (2, 'Walking', 250),
        (3, 'Swimming', 600),
        (4, 'Yoga', 180),
        (5, 'Bicycling', 400);

CREATE TABLE Completed_Exercises (
	UserID INTEGER NOT NULL,
    ExerciseID INTEGER NOT NULL,
    UserGivenName VARCHAR(20) NULL,
    ExerciseDate DATE NULL,
    StartTime TIME NULL,
    EndTime TIME NULL,
    Feeling VARCHAR(10) NULL,
    
    PRIMARY KEY(UserID, ExerciseID),
    
    FOREIGN KEY(UserID) REFERENCES User(UserID),
    FOREIGN KEY(ExerciseID) REFERENCES Exercise(ExerciseID)
);

INSERT INTO Completed_Exercises
	VALUES
		(1, 3, 'Uintia', '2020-04-05', '17:00:00', '18:00:00', 'Good'),
        (2, 5, 'Pyöräilymatka', '2020-05-11', '14:05:00', '16:00:00', 'Happy'),
        (5, 4, 'Yogatunti', '2020-05-15', '12:00:00', '13:00:00', 'Relaxed'),
        (4, 1, 'Lenkki', NULL, '16:25:00', '17:05:00', 'Exhausted'),
        (3, 2, NULL, '2020-06-02', '15:11:00', '17:02:01', 'Good'),
        (5, 3, NULL, '2020-06-23', '12:00:00', '12:30:00', 'Tired'),
        (4, 5, 'Pyöräily', '2020-07-11', '18:30:00', '19:45:00', 'Good'),
        (3, 4, 'Rentoutuminen', '2020-08-14', '12:44:00', '13:00:00', 'Happy'),
        (1, 1, 'Lenkki', '2021-01-27', '16:25:00', '17:05:00', 'Good'),
        (2, 2, 'Kävely', '2021-03-05', '19:27:00', '20:08:00', 'Good');

CREATE TABLE Challenges (
	ChallengeID INTEGER NOT NULL PRIMARY KEY,
    ChallengeName VARCHAR(30) NOT NULL,
    ExerciseID INTEGER NULL,
    Description VARCHAR(64) NULL,
    ChallengePoints INTEGER NULL,
    
    FOREIGN KEY(ExerciseID) REFERENCES Exercise(ExerciseID)
);

INSERT INTO Challenges
	VALUES
		(1, 'Walk on the Beach', 2,'2000 pisteen kävelyhaaste', 2000),
		(2, 'Sea Shell Shenanigans', 3, '2500 pisteen uintihaaste', 2500),
		(3, 'Spirit of Yoga', 4, '3000 pisteen joogahaaste', 3000),
		(4, 'Endurance Challenge', 1, '5000 pisteen kestävyyshaaste', 5000),
		(5, 'Tour de City', 5, '6000 pisteen pyöräilyhaaste', 6000);

CREATE TABLE Completed_Challenges (
	UserID INTEGER NOT NULL,
    ChallengeID INTEGER NOT NULL,
    CompletedDate DATE NULL,
    CompletedTime TIME NULL,
    
    PRIMARY KEY(UserID, ChallengeID),
    
    FOREIGN KEY(UserID) REFERENCES User(UserID),
    FOREIGN KEY(ChallengeID) REFERENCES Challenges(ChallengeID)
);

INSERT INTO Completed_Challenges
	VALUES
		(1, 4, '2021-01-27', '17:05:00'),
        (1, 2, '2020-04-05', '18:00:00'),
        (5, 2, '2020-06-23', '12:30:00'),
        (3, 3, '2020-08-14', '13:00:00'),
        (5, 3, '2020-05-15', '13:00:00');

/*Tekijät JE & SI @ Laurea NTA220SA*/