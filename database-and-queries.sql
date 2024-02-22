CREATE DATABASE URPublished;
USE URPublished;


-- CREATE TABLES
CREATE TABLE Genre (
    Genre_Code INT NOT NULL,
    Genre_Description VARCHAR(50) NOT NULL,
    PRIMARY KEY(Genre_Code)
);


CREATE TABLE Manuscript (
    Manuscript_ID INT not null, 
    Title  VARCHAR(200) not null,
    Date_Received DATE not null, 
    Genre_Code INT not null,
    Status VARCHAR(50) not null,
    PRIMARY KEY(Manuscript_ID),
    FOREIGN KEY (Genre_Code) REFERENCES Genre (Genre_Code)
);

CREATE TABLE Received(
    Manuscript_ID INT NOT NULL,
    Received_Date DATE NOT NULL,
    FOREIGN KEY (Manuscript_ID) REFERENCES Manuscript (Manuscript_ID)
);

CREATE TABLE Rejected(
    Manuscript_ID INT NOT NULL,
    Rejection_Date DATE NOT NULL,
    Email_Date_Rejected DATE NOT NULL,
    FOREIGN KEY (Manuscript_ID) REFERENCES Manuscript (Manuscript_ID)
);

CREATE TABLE Under_Review(
    Manuscript_ID INT NOT NULL,
    Date_Under_Review DATE NOT NULL,
    Email_Date_UnderReview DATE NOT NULL,
    FOREIGN KEY (Manuscript_ID) REFERENCES Manuscript (Manuscript_ID)
);

CREATE TABLE Accepted(
    Manuscript_ID INT NOT NULL,
    Acceptance_Date DATE NOT NULL,
    Email_Date_Accepted DATE NOT NULL,
    FOREIGN KEY (Manuscript_ID) REFERENCES Manuscript (Manuscript_ID)
);

CREATE TABLE Scheduled(
    Manuscript_ID INT NOT NULL,
    Date_Scheduled DATE NOT NULL,
    Email_Date_Scheduled DATE NOT NULL,
    FOREIGN KEY (manuscript_id) REFERENCES Manuscript (manuscript_id)
);

CREATE TABLE Published(
    Manuscript_ID INT NOT NULL,
    Published_Date DATE NOT NULL,
    FOREIGN KEY (Manuscript_ID) REFERENCES Manuscript (Manuscript_ID)
);


CREATE TABLE Author(
    Author_ID INT NOT NULL,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Mailing_Address VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State_ VARCHAR(50) NOT NULL,
    Zip VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    PhoneNum VARCHAR(50) NOT NULL,
    PRIMARY KEY (Author_ID)
    );

CREATE TABLE Submission(
    Manuscript_ID 	INT NOT NULL,
    Author_ID 		INT NOT NULL,
    Author_Order 	INT NOT NULL,
    FOREIGN KEY (Manuscript_ID) REFERENCES Manuscript (Manuscript_ID),
    FOREIGN KEY (Author_ID) REFERENCES Author (Author_ID)
);

create table Reviewer (
    Reviewer_ID INT NOT NULL,
    Reviewer_First_Name VARCHAR(50) NOT NULL,
    Reviewer_Last_Name VARCHAR(50) NOT NULL,
    Reviewer_Email VARCHAR(50) NOT NULL,
    Reviewer_PhoneNum VARCHAR(50) NOT NULL,
    PRIMARY KEY (Reviewer_ID)
);

CREATE TABLE Reviewer_Interest(
    Reviewer_ID INT NOT NULL,
    Genre_Code INT NOT NULL,
    FOREIGN KEY (Reviewer_ID) REFERENCES Reviewer (Reviewer_ID),
    FOREIGN KEY (Genre_Code) REFERENCES Genre (Genre_Code)
    );

 
CREATE TABLE Feedback(
    Reviewer_ID INT NOT NULL,
    Manuscript_ID INT NOT NULL,
    Character_Development INT NOT NULL,
    Plot INT NOT NULL,
    Structure_ INT NOT NULL,
    Style INT NOT NULL,
    Recommendation VARCHAR(50) NOT NULL,
    Feedback_Date DATE NOT NULL,
    FOREIGN KEY (Reviewer_ID) REFERENCES Reviewer (Reviewer_ID),
    FOREIGN KEY (Manuscript_ID) REFERENCES Manuscript (Manuscript_ID)
    );


CREATE TABLE Issue_Month(
    Issue_MonthID INT NOT NULL,
    Issue_Month VARCHAR(50) NOT NULL,
    Issue_Num VARCHAR(50) NOT NULL,
    Issue_Period VARCHAR(50) NOT NULL,
    PRIMARY KEY (Issue_MonthID)
);

CREATE TABLE Volume(
    Volume INT NOT NULL,
    Publication_Year VARCHAR(50) NOT NULL,
    PRIMARY KEY (Volume)
);

CREATE TABLE Newsletter(
    Manuscript_ID INT NOT NULL,
    Volume INT NOT NULL,
    Issue_MonthID INT NOT NULL,
    Summary_Title VARCHAR(500) NOT NULL,
    Summary_Order INT NOT NULL,
    Page_Start INT NOT NULL,
    Page_Count INT NOT NULL,
    Print_Date DATE NOT NULL,
    FOREIGN KEY (Manuscript_ID) REFERENCES Manuscript (Manuscript_ID),
    FOREIGN KEY (Volume) REFERENCES Volume (Volume),
    FOREIGN KEY (Issue_MonthID) REFERENCES Issue_Month (Issue_MonthID)
);

-- INSERT DATA INTO GENRE TABLE
insert into Genre (Genre_Code, Genre_Description) values (1, 'Fantasy');
insert into Genre (Genre_Code, Genre_Description) values (2, 'Adventure');
insert into Genre (Genre_Code, Genre_Description) values (3, 'Romance');
insert into Genre (Genre_Code, Genre_Description) values (4, 'Contemporary');
insert into Genre (Genre_Code, Genre_Description) values (5, 'Dystopian');
insert into Genre (Genre_Code, Genre_Description) values (6, 'Mystery');
insert into Genre (Genre_Code, Genre_Description) values (7, 'Horror');
insert into Genre (Genre_Code, Genre_Description) values (8, 'Thriller');
insert into Genre (Genre_Code, Genre_Description) values (9, 'Paranormal');
insert into Genre (Genre_Code, Genre_Description) values (10, 'Historical Fiction');
insert into Genre (Genre_Code, Genre_Description) values (11, 'Science Fiction');
insert into Genre (Genre_Code, Genre_Description) values (12, 'Mythology');
insert into Genre (Genre_Code, Genre_Description) values (13, 'Children''s');
insert into Genre (Genre_Code, Genre_Description) values (14, 'Memoir');
insert into Genre (Genre_Code, Genre_Description) values (15, 'Food and Drink');
insert into Genre (Genre_Code, Genre_Description) values (16, 'Art');
insert into Genre (Genre_Code, Genre_Description) values (17, 'Self-Help');
insert into Genre (Genre_Code, Genre_Description) values (18, 'Developmental');
insert into Genre (Genre_Code, Genre_Description) values (19, 'Motivational');
insert into Genre (Genre_Code, Genre_Description) values (20, 'Health');
insert into Genre (Genre_Code, Genre_Description) values (21, 'History');
insert into Genre (Genre_Code, Genre_Description) values (22, 'Travel');
insert into Genre (Genre_Code, Genre_Description) values (23, 'Guide');
insert into Genre (Genre_Code, Genre_Description) values (24, 'Comedy');
insert into Genre (Genre_Code, Genre_Description) values (25, 'Young Adult');
insert into Genre (Genre_Code, Genre_Description) values (26, 'Biography');
insert into Genre (Genre_Code, Genre_Description) values (27, 'True Crime');
insert into Genre (Genre_Code, Genre_Description) values (28, 'Religion');
insert into Genre (Genre_Code, Genre_Description) values (29, 'Essay');
insert into Genre (Genre_Code, Genre_Description) values (30, 'Poetry');

-- INSERT DATA INTO MANUSCRIPT TABLE ** (confused about subtype descriminator and associative tables)

insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (1, 'End of St. Petersburg, The (Konets Sankt-Peterburga)', '2016-08-08', 8, 'Accepted');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (2, 'Coelacanth: The Fish That Time Forgot', '2012-04-12', 10, 'Scheduled');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (3, 'Horrible Bosses', '2013-04-29', 2, 'Rejected');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (4, 'Blade: Trinity', '2016-08-26', 10, 'Published');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (5, 'Forty-first, The (Sorok pervyy)', '2013-06-04', 7, 'Published');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (6, 'Romeo and Juliet', '2013-06-10', 30, 'Accepted');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (7, 'Sunday in Kigali, A (Un dimanche Ã  Kigali)', '2020-01-24', 10, 'Accepted');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (8, 'Andromeda Strain, The', '2015-07-14', 20, 'Scheduled');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (9, 'Son of a Gun', '2011-06-04', 15, 'Scheduled');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (10, 'Don''t Stop Believin'': Everyman''s Journey', '2013-09-14', 12, 'Published');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (11, 'Dhoondte Reh Jaoge', '2018-04-11', 10, 'Rejected');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (12, 'Man of Her Dreams (a.k.a. The FiancÃ©)', '2019-06-16', 10, 'Rejected');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (13, 'Shun Li and the Poet', '2009-10-02', 17, 'Under_Review');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (14, 'Angels in America', '2007-02-13', 9, 'Under_Review');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (15, 'Destiny in Space', '2014-05-27', 23, 'Received');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (16, 'How to Eat Fried Worms', '2008-04-16', 10, 'Rejected');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (17, 'Fat, Sick & Nearly Dead', '2017-02-19', 22, 'Scheduled');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (18, 'Carbon Copy', '2019-09-11', 16, 'Scheduled');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (19, 'Cold Steel', '2019-01-17', 6, 'Published');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (20, 'Bridges at Toko-Ri, The', '2014-01-18', 26, 'Rejected');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (21, 'Venus in Fur (La VÃ©nus Ã  la fourrure)', '2018-05-27', 16, 'Published');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (22, 'Terror in a Texas Town', '2013-05-03', 6, 'Published');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (23, 'High and Dizzy', '2021-06-07', 6, 'Scheduled');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (24, 'Theatre Bizarre, The', '2011-04-21', 16, 'Scheduled');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (25, 'Tuareg: The Desert Warrior (Tuareg - Il guerriero del deserto)', '2021-08-25', 24, 'Received');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (26, 'Highway Racer', '2015-04-05', 15, 'Scheduled');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (27, 'Don''t Eat the Pictures: Sesame Street at the Metropolitan Museum of Art', '2018-07-01', 3, 'Accepted');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (28, 'Service (Serbis)', '2019-10-09', 21, 'Scheduled');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (29, 'Family Man, The', '2007-03-25', 3, 'Under_Review');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (30, 'Within Our Gates', '2019-12-20', 5, 'Accepted');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (31, 'Within Your Gates', '2019-12-20', 5, 'Rejected');
insert into Manuscript (Manuscript_ID, Title, Date_Received, Genre_Code, Status) values (32, 'Within Their Gates', '2019-12-20', 5, 'Rejected');



-- INSERT DATA INTO received TABLE


insert into received (manuscript_id, received_date) values (1, '2022-05-24');
insert into received (manuscript_id, received_date) values (2, '2022-11-07');
insert into received (manuscript_id, received_date) values (3, '2021-11-15');
insert into received (manuscript_id, received_date) values (4, '2022-05-24');
insert into received (manuscript_id, received_date) values (5, '2022-01-13');
insert into received (manuscript_id, received_date) values (6, '2022-10-19');
insert into received (manuscript_id, received_date) values (7, '2022-05-09');
insert into received (manuscript_id, received_date) values (8, '2022-01-08');
insert into received (manuscript_id, received_date) values (9, '2022-06-25');
insert into received (manuscript_id, received_date) values (10, '2022-07-30');
insert into received (manuscript_id, received_date) values (11, '2022-02-14');
insert into received (manuscript_id, received_date) values (12, '2022-06-29');
insert into received (manuscript_id, received_date) values (13, '2022-05-06');
insert into received (manuscript_id, received_date) values (14, '2022-01-09');
insert into received (manuscript_id, received_date) values (15, '2022-02-12');
insert into received (manuscript_id, received_date) values (16, '2022-09-20');
insert into received (manuscript_id, received_date) values (17, '2022-06-30');
insert into received (manuscript_id, received_date) values (18, '2022-02-10');
insert into received (manuscript_id, received_date) values (19, '2022-06-30');
insert into received (manuscript_id, received_date) values (20, '2022-06-03');
insert into received (manuscript_id, received_date) values (21, '2022-05-05');
insert into received (manuscript_id, received_date) values (22, '2022-08-24');
insert into received (manuscript_id, received_date) values (23, '2022-10-22');
insert into received (manuscript_id, received_date) values (24, '2022-05-20');
insert into received (manuscript_id, received_date) values (25, '2022-07-09');
insert into received (manuscript_id, received_date) values (26, '2022-08-16');
insert into received (manuscript_id, received_date) values (27, '2022-09-11');
insert into received (manuscript_id, received_date) values (28, '2022-06-26');
insert into received (manuscript_id, received_date) values (29, '2022-02-16');
insert into received (manuscript_id, received_date) values (30, '2022-05-30');

-- INSERT DATA INTO rejected TABLE

insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (1, '2022-01-02', '2022-05-15');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (2, '2022-10-10', '2022-01-22');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (3, '2022-08-11', '2022-08-25');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (4, '2021-11-21', '2022-05-25');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (5, '2022-01-19', '2022-04-10');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (6, '2022-11-03', '2022-05-04');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (7, '2022-04-23', '2021-12-07');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (8, '2022-07-03', '2022-02-06');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (9, '2022-11-08', '2022-02-20');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (10, '2022-03-25', '2022-10-20');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (11, '2022-02-11', '2022-10-01');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (12, '2022-09-20', '2021-11-17');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (13, '2022-01-06', '2022-08-30');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (14, '2022-11-04', '2022-10-10');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (15, '2022-05-06', '2022-02-14');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (16, '2022-10-02', '2022-10-29');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (17, '2022-02-24', '2022-10-15');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (18, '2022-09-11', '2022-04-09');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (19, '2022-08-31', '2022-04-14');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (20, '2022-01-24', '2022-08-04');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (21, '2022-04-23', '2021-11-12');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (22, '2022-06-18', '2022-09-01');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (23, '2022-03-21', '2022-03-15');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (24, '2022-07-03', '2022-04-22');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (25, '2022-01-11', '2021-12-05');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (26, '2022-09-01', '2022-02-27');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (27, '2022-05-09', '2022-04-17');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (28, '2022-02-03', '2022-08-06');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (29, '2022-04-28', '2022-03-09');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (30, '2022-07-06', '2022-03-20');
insert into rejected (manuscript_id, rejection_date, email_date_rejected) values (32, '2022-07-06', '2022-03-20');


-- INSERT DATA INTO under_review TABLE

insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (1, '2022-08-18', '2022-07-03');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (2, '2022-07-23', '2022-01-22');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (3, '2022-06-22', '2022-07-27');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (4, '2021-12-04', '2022-07-26');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (5, '2022-07-27', '2022-06-15');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (6, '2022-05-30', '2022-03-02');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (7, '2021-12-25', '2022-05-02');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (8, '2022-03-19', '2022-08-12');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (9, '2021-11-23', '2022-10-09');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (10, '2022-02-17', '2022-02-25');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (11, '2022-06-24', '2022-08-19');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (12, '2022-04-15', '2022-04-29');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (13, '2022-07-23', '2022-05-14');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (14, '2021-12-01', '2022-08-13');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (15, '2022-07-21', '2022-03-18');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (16, '2022-07-03', '2022-02-12');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (17, '2022-02-10', '2022-11-08');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (18, '2021-12-09', '2022-06-16');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (19, '2022-02-17', '2022-07-17');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (20, '2022-05-16', '2022-02-27');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (21, '2022-02-24', '2021-11-16');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (22, '2022-09-23', '2022-10-06');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (23, '2022-02-18', '2022-05-11');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (24, '2022-03-29', '2022-01-01');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (25, '2022-08-14', '2022-02-25');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (26, '2022-07-09', '2022-09-05');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (27, '2022-02-19', '2022-10-29');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (28, '2021-12-12', '2022-01-09');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (29, '2022-04-10', '2022-05-15');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (30, '2022-05-03', '2021-12-15');
insert into under_review (manuscript_id, date_under_review, email_date_underreview) values (31, '2022-05-03', '2021-12-15');

-- INSERT DATA INTO accepted TABLE

insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (1, '2021-12-09', '2021-11-18');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (2, '2022-03-20', '2022-10-07');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (3, '2022-04-20', '2022-03-15');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (4, '2022-01-20', '2022-09-10');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (5, '2022-07-29', '2022-07-15');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (6, '2022-09-28', '2022-09-25');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (7, '2022-08-26', '2022-09-21');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (8, '2022-04-19', '2022-08-09');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (9, '2022-10-26', '2022-05-16');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (10, '2022-03-05', '2022-10-20');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (11, '2022-02-12', '2022-10-03');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (12, '2022-01-30', '2022-10-09');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (13, '2022-02-04', '2022-09-25');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (14, '2022-01-28', '2022-01-20');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (15, '2022-04-25', '2022-09-12');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (16, '2021-11-26', '2022-03-07');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (17, '2022-05-08', '2022-10-15');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (18, '2021-11-20', '2022-03-26');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (19, '2022-10-30', '2021-11-23');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (20, '2022-07-12', '2022-09-07');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (21, '2022-02-26', '2022-05-26');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (22, '2022-03-13', '2022-02-07');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (23, '2022-06-14', '2022-04-20');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (24, '2022-01-23', '2021-12-20');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (25, '2022-01-12', '2022-01-30');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (26, '2021-11-24', '2022-04-20');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (27, '2022-05-26', '2022-08-30');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (28, '2022-08-10', '2021-11-20');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (29, '2022-03-31', '2022-04-27');
insert into accepted (manuscript_id, acceptance_date, email_date_accepted) values (30, '2022-05-04', '2022-02-22');

-- INSERT DATA INTO scheduled TABLE

insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (1, '2022-08-01', '2022-11-07');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (2, '2022-03-09', '2022-11-08');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (3, '2022-04-24', '2022-01-27');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (4, '2022-06-18', '2022-10-22');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (5, '2022-05-24', '2022-10-22');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (6, '2022-07-30', '2022-09-10');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (7, '2022-01-19', '2022-02-04');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (8, '2022-08-12', '2022-03-15');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (9, '2022-01-05', '2022-09-25');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (10, '2022-01-12', '2022-04-18');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (11, '2022-09-07', '2022-05-08');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (12, '2022-04-14', '2022-01-04');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (13, '2022-05-24', '2022-06-03');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (14, '2022-10-24', '2022-07-28');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (15, '2022-05-03', '2022-06-06');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (16, '2022-01-26', '2022-05-20');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (17, '2021-12-08', '2022-10-02');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (18, '2022-02-11', '2022-02-06');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (19, '2022-01-15', '2022-02-18');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (20, '2021-11-29', '2022-08-19');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (21, '2022-05-21', '2022-06-08');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (22, '2022-02-05', '2022-01-17');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (23, '2022-05-13', '2022-02-26');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (24, '2022-01-09', '2022-03-26');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (25, '2022-09-18', '2022-05-02');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (26, '2022-07-06', '2022-04-04');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (27, '2021-12-26', '2022-03-29');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (28, '2022-08-13', '2022-06-03');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (29, '2021-12-23', '2022-07-05');
insert into scheduled (manuscript_id, date_scheduled, email_date_scheduled) values (30, '2022-08-11', '2022-03-17');

-- INSERT DATA INTO published TABLE


insert into published (manuscript_id, published_date) values (1, '2021-12-22');
insert into published (manuscript_id, published_date) values (2, '2022-02-16');
insert into published (manuscript_id, published_date) values (3, '2022-02-14');
insert into published (manuscript_id, published_date) values (4, '2022-05-21');
insert into published (manuscript_id, published_date) values (5, '2022-04-26');
insert into published (manuscript_id, published_date) values (6, '2022-01-30');
insert into published (manuscript_id, published_date) values (7, '2022-05-11');
insert into published (manuscript_id, published_date) values (8, '2022-03-30');
insert into published (manuscript_id, published_date) values (9, '2022-07-20');
insert into published (manuscript_id, published_date) values (10, '2022-06-17');
insert into published (manuscript_id, published_date) values (11, '2021-12-11');
insert into published (manuscript_id, published_date) values (12, '2021-12-26');
insert into published (manuscript_id, published_date) values (13, '2022-04-07');
insert into published (manuscript_id, published_date) values (14, '2022-05-20');
insert into published (manuscript_id, published_date) values (15, '2022-02-13');
insert into published (manuscript_id, published_date) values (16, '2022-07-29');
insert into published (manuscript_id, published_date) values (17, '2022-09-29');
insert into published (manuscript_id, published_date) values (18, '2022-10-21');
insert into published (manuscript_id, published_date) values (19, '2022-07-19');
insert into published (manuscript_id, published_date) values (20, '2022-07-01');
insert into published (manuscript_id, published_date) values (21, '2022-03-31');
insert into published (manuscript_id, published_date) values (22, '2021-11-13');
insert into published (manuscript_id, published_date) values (23, '2022-09-20');
insert into published (manuscript_id, published_date) values (24, '2022-02-23');
insert into published (manuscript_id, published_date) values (25, '2022-03-02');
insert into published (manuscript_id, published_date) values (26, '2021-12-20');
insert into published (manuscript_id, published_date) values (27, '2022-04-10');
insert into published (manuscript_id, published_date) values (28, '2021-12-02');
insert into published (manuscript_id, published_date) values (29, '2022-04-12');
insert into published (manuscript_id, published_date) values (30, '2022-08-12');

-- INSERT DATA INTO AUTHOR TABLE

insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (1, 'Sallyanne', 'Picken', '1 Blue Bill Park Terrace', 'Nashville', 'Tennessee', '37250', 'spicken0@newsvine.com', '615-961-5213');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (2, 'Dorothy', 'Emerton', '74 Sage Center', 'Montpelier', 'Vermont', '05609', 'demerton1@businessinsider.com', '802-945-4885');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (3, 'Mahmoud', 'Lothean', '4711 Ryan Crossing', 'Sacramento', 'California', '94297', 'mlothean2@telegraph.co.uk', '916-338-7743');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (4, 'Lita', 'Slocket', '0241 8th Pass', 'Dallas', 'Texas', '75310', 'lslocket3@51.la', '214-773-0940');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (5, 'Abigale', 'Penwright', '29245 Grover Circle', 'Norfolk', 'Virginia', '23520', 'apenwright4@sciencedaily.com', '757-307-4267');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (6, 'Ryon', 'Howbrook', '71050 Loomis Center', 'Appleton', 'Wisconsin', '54915', 'rhowbrook5@nhs.uk', '920-892-9559');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (7, 'Ester', 'de Juares', '64481 Badeau Alley', 'Arlington', 'Virginia', '22217', 'edejuares6@nature.com', '571-526-6603');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (8, 'Ami', 'Kellart', '9 Dakota Alley', 'Fort Lauderdale', 'Florida', '33355', 'akellart7@odnoklassniki.ru', '754-141-9911');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (9, 'Zerk', 'Gainseford', '4575 Almo Pass', 'Reno', 'Nevada', '89550', 'zgainseford8@istockphoto.com', '775-515-5855');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (10, 'Frederich', 'Pigney', '2 Dovetail Court', 'Gainesville', 'Florida', '32627', 'fpigney9@linkedin.com', '352-200-0023');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (11, 'Auberon', 'Rouch', '68 Bultman Center', 'Saint Louis', 'Missouri', '63104', 'aroucha@youku.com', '314-672-5588');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (12, 'Philippine', 'Cobbald', '79 Spenser Circle', 'Lubbock', 'Texas', '79491', 'pcobbaldb@multiply.com', '806-258-2016');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (13, 'Sheena', 'Derrett', '2 Hazelcrest Circle', 'San Mateo', 'California', '94405', 'sderrettc@pbs.org', '805-248-0499');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (14, 'Ximenes', 'Celler', '5 Maple Wood Place', 'Los Angeles', 'California', '90025', 'xcellerd@google.it', '818-692-7761');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (15, 'Brett', 'Asher', '4 Elka Avenue', 'Louisville', 'Kentucky', '40280', 'bashere@marriott.com', '502-976-0553');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (16, 'Jewell', 'Cardew', '1 Porter Avenue', 'Colorado Springs', 'Colorado', '80905', 'jcardewf@theatlantic.com', '719-983-8596');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (17, 'Tanner', 'Berni', '807 Superior Place', 'Columbia', 'South Carolina', '29208', 'tbernig@networksolutions.com', '803-155-9413');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (18, 'Lexy', 'Slimon', '55117 Sloan Trail', 'Santa Ana', 'California', '92705', 'lslimonh@tripod.com', '310-227-1970');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (19, 'Irene', 'Load', '50949 Stuart Hill', 'Monticello', 'Minnesota', '55590', 'iloadi@diigo.com', '763-176-6456');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (20, 'Ambrosio', 'Wincer', '3 Redwing Circle', 'Houston', 'Texas', '77030', 'awincerj@howstuffworks.com', '832-155-4233');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (21, 'Sharlene', 'Abbyss', '9162 Lukken Parkway', 'Mount Vernon', 'New York', '10557', 'sabbyssk@discovery.com', '914-734-6097');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (22, 'Tessie', 'Vasiliu', '90037 Oriole Lane', 'Oklahoma City', 'Oklahoma', '73179', 'tvasiliul@yelp.com', '405-400-6931');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (23, 'Jackqueline', 'Sisey', '7370 Westerfield Court', 'Seattle', 'Washington', '98195', 'jsiseym@hud.gov', '206-350-4831');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (24, 'Mignon', 'Bonnette', '6 Almo Street', 'Houston', 'Texas', '77212', 'mbonnetten@yellowbook.com', '713-126-4152');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (25, 'Desmund', 'Mattosoff', '1 Bartelt Junction', 'Washington', 'District of Columbia', '20436', 'dmattosoffo@sourceforge.net', '202-230-8783');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (26, 'Brandon', 'Tunney', '7302 Quincy Junction', 'Des Moines', 'Iowa', '50393', 'btunneyp@java.com', '515-245-8284');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (27, 'Ardisj', 'Aylen', '5 Twin Pines Drive', 'Detroit', 'Michigan', '48217', 'aaylenq@va.gov', '313-160-5465');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (28, 'Shae', 'Penn', '4321 Reinke Street', 'New York City', 'New York', '10203', 'spennr@blogger.com', '212-913-8740');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (29, 'Efrem', 'Dickens', '93 Birchwood Crossing', 'Greensboro', 'North Carolina', '27499', 'edickenss@china.com.cn', '336-362-1325');
insert into Author (Author_ID, First_Name, Last_Name, Mailing_Address, City, State_, Zip, Email, PhoneNum) values (30, 'Rodd', 'Gaines', '450 Weeping Birch Trail', 'Fresno', 'California', '93709', 'rgainest@springer.com', '559-843-0699');

-- INSERT DATA INTO SUBMISSION TABLE

insert into Submission (manuscript_id, Author_id, author_order) values (1, 1, 1);
insert into Submission (manuscript_id, Author_id, author_order) values (31, 1, 1);
insert into Submission (manuscript_id, Author_id, author_order) values (32, 1, 1);

insert into Submission (manuscript_id, Author_id, author_order) values (2, 2, 2);
insert into Submission (manuscript_id, Author_id, author_order) values (3, 3, 3);
insert into Submission (manuscript_id, Author_id, author_order) values (4, 4, 4);
insert into Submission (manuscript_id, Author_id, author_order) values (5, 5, 5);
insert into Submission (manuscript_id, Author_id, author_order) values (6, 6, 6);
insert into Submission (manuscript_id, Author_id, author_order) values (7, 7, 7);
insert into Submission (manuscript_id, Author_id, author_order) values (8, 8, 8);
insert into Submission (manuscript_id, Author_id, author_order) values (9, 9, 9);
insert into Submission (manuscript_id, Author_id, author_order) values (10, 10, 10);
insert into Submission (manuscript_id, Author_id, author_order) values (11, 11, 11);
insert into Submission (manuscript_id, Author_id, author_order) values (12, 12, 12);
insert into Submission (manuscript_id, Author_id, author_order) values (13, 13, 13);
insert into Submission (manuscript_id, Author_id, author_order) values (14, 14, 14);
insert into Submission (manuscript_id, Author_id, author_order) values (15, 15, 15);
insert into Submission (manuscript_id, Author_id, author_order) values (16, 16, 16);
insert into Submission (manuscript_id, Author_id, author_order) values (17, 17, 17);
insert into Submission (manuscript_id, Author_id, author_order) values (18, 18, 18);
insert into Submission (manuscript_id, Author_id, author_order) values (19, 19, 19);
insert into Submission (manuscript_id, Author_id, author_order) values (20, 20, 20);
insert into Submission (manuscript_id, Author_id, author_order) values (21, 21, 21);
insert into Submission (manuscript_id, Author_id, author_order) values (22, 22, 22);
insert into Submission (manuscript_id, Author_id, author_order) values (23, 23, 23);
insert into Submission (manuscript_id, Author_id, author_order) values (24, 24, 24);
insert into Submission (manuscript_id, Author_id, author_order) values (25, 25, 25);
insert into Submission (manuscript_id, Author_id, author_order) values (26, 26, 26);
insert into Submission (manuscript_id, Author_id, author_order) values (27, 27, 27);
insert into Submission (manuscript_id, Author_id, author_order) values (28, 28, 28);
insert into Submission (manuscript_id, Author_id, author_order) values (29, 29, 29);
insert into Submission (manuscript_id, Author_id, author_order) values (30, 30, 30);



-- INSERT DATA INTO REVIEWER TABLE
 
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (1, 'Larine', 'Castellani', 'lcastellani0@foxnews.com', '725-680-0274');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (2, 'Meara', 'Menico', 'mmenico1@dedecms.com', '631-280-4703');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (3, 'Pet', 'McMeeking', 'pmcmeeking2@unicef.org', '834-263-6810');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (4, 'Camellia', 'Carmody', 'ccarmody3@bigcartel.com', '159-813-4262');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (5, 'Gaspard', 'Gascard', 'ggascard4@usgs.gov', '535-933-5088');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (6, 'Dalton', 'Etherton', 'detherton5@xrea.com', '733-908-3595');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (7, 'Johnath', 'Dawson', 'jdawson6@google.pl', '654-308-5420');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (8, 'Jinny', 'Wythe', 'jwythe7@facebook.com', '657-470-8380');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (9, 'Staci', 'Frossell', 'sfrossell8@gravatar.com', '313-513-9106');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (10, 'Wendy', 'Kerfod', 'wkerfod9@epa.gov', '505-750-0486');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (11, 'Nina', 'Laverty', 'nlavertya@marriott.com', '575-559-5942');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (12, 'Helenka', 'Gilchrest', 'hgilchrestb@hao123.com', '744-429-4504');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (13, 'Arnaldo', 'Edmead', 'aedmeadc@ning.com', '940-216-1690');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (14, 'Mil', 'Christian', 'mchristiand@nymag.com', '142-420-4063');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (15, 'Lucius', 'Frise', 'lfrisee@wufoo.com', '316-221-7098');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (16, 'Fidel', 'Pledge', 'fpledgef@slashdot.org', '372-315-9789');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (17, 'Lewiss', 'Barday', 'lbardayg@techcrunch.com', '621-549-8809');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (18, 'Deedee', 'Simmens', 'dsimmensh@themeforest.net', '613-235-0245');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (19, 'Walt', 'Tunaclift', 'wtunaclifti@delicious.com', '214-164-5945');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (20, 'Francyne', 'Aughtie', 'faughtiej@slate.com', '350-128-5289');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (21, 'Annadiane', 'Christoforou', 'achristoforouk@tiny.cc', '515-800-0471');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (22, 'Paxton', 'Bridgewood', 'pbridgewoodl@wordpress.org', '848-884-1568');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (23, 'Brandice', 'Fforde', 'bffordem@nature.com', '586-781-5327');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (24, 'Huey', 'McGiff', 'hmcgiffn@usda.gov', '225-135-6936');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (25, 'Stephie', 'Axby', 'saxbyo@imdb.com', '732-980-2548');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (26, 'Alejandro', 'Senecaux', 'asenecauxp@yahoo.com', '834-588-5736');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (27, 'Renie', 'Ricson', 'rricsonq@independent.co.uk', '743-300-4841');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (28, 'Augie', 'Weeds', 'aweedsr@cbc.ca', '222-776-2624');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (29, 'Anselm', 'Ofener', 'aofeners@sohu.com', '453-466-5240');
insert into Reviewer (Reviewer_id, Reviewer_first_name, Reviewer_last_name, reviewer_email, reviewer_phonenum) values (30, 'Sara-ann', 'Sangra', 'ssangrat@tinyurl.com', '277-813-2397');
 

-- INSERT DATA INTO REVIEWER_INTEREST TABLE
 
insert into Reviewer_interest (Reviewer_id, genre_code) values (1, 1);
insert into Reviewer_interest (Reviewer_id, genre_code) values (2, 1);
insert into Reviewer_interest (Reviewer_id, genre_code) values (3, 2);
insert into Reviewer_interest (Reviewer_id, genre_code) values (4, 2);
insert into Reviewer_interest (Reviewer_id, genre_code) values (5, 3);
insert into Reviewer_interest (Reviewer_id, genre_code) values (6, 3);
insert into Reviewer_interest (Reviewer_id, genre_code) values (7, 4);
insert into Reviewer_interest (Reviewer_id, genre_code) values (8, 5);
insert into Reviewer_interest (Reviewer_id, genre_code) values (9, 6);
insert into Reviewer_interest (Reviewer_id, genre_code) values (10, 7);
insert into Reviewer_interest (Reviewer_id, genre_code) values (11, 7);
insert into Reviewer_interest (Reviewer_id, genre_code) values (12, 8);
insert into Reviewer_interest (Reviewer_id, genre_code) values (13, 9);
insert into Reviewer_interest (Reviewer_id, genre_code) values (14, 10);
insert into Reviewer_interest (Reviewer_id, genre_code) values (15, 10);
insert into Reviewer_interest (Reviewer_id, genre_code) values (16, 11);
insert into Reviewer_interest (Reviewer_id, genre_code) values (17, 12);
insert into Reviewer_interest (Reviewer_id, genre_code) values (18, 13);
insert into Reviewer_interest (Reviewer_id, genre_code) values (19, 14);
insert into Reviewer_interest (Reviewer_id, genre_code) values (20, 15);
insert into Reviewer_interest (Reviewer_id, genre_code) values (21, 20);
insert into Reviewer_interest (Reviewer_id, genre_code) values (22, 22);
insert into Reviewer_interest (Reviewer_id, genre_code) values (23, 22);
insert into Reviewer_interest (Reviewer_id, genre_code) values (24, 24);
insert into Reviewer_interest (Reviewer_id, genre_code) values (25, 25);
insert into Reviewer_interest (Reviewer_id, genre_code) values (26, 26);
insert into Reviewer_interest (Reviewer_id, genre_code) values (27, 26);
insert into Reviewer_interest (Reviewer_id, genre_code) values (28, 28);
insert into Reviewer_interest (Reviewer_id, genre_code) values (29, 30);
insert into Reviewer_interest (Reviewer_id, genre_code) values (30, 30);
 
 

-- INSERT DATA INTO FEEDBACK TABLE
 
 
 
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (1, 1, 2, 6, 5, 7, 'accept', '2022-09-29');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (2, 2, 4, 6, 5, 5, 'accept', '2022-06-25');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (3, 3, 8, 6, 4, 1, 'reject', '2022-02-11');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (4, 4, 9, 2, 8, 8, 'accept', '2021-12-29');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (5, 5, 3, 3, 3, 9, 'reject', '2022-01-23');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (6, 6, 3, 5, 8, 5, 'reject', '2021-12-08');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (7, 7, 3, 4, 10, 6, 'accept', '2022-03-03');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (8, 8, 4, 9, 10, 3, 'reject', '2022-03-25');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (9, 9, 10, 6, 3, 3, 'accept', '2021-11-29');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (10, 10, 10, 5, 10, 3, 'accept', '2022-09-19');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (11, 11, 7, 6, 6, 6, 'reject', '2022-07-09');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (12, 12, 4, 2, 7, 2, 'accept', '2021-12-12');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (13, 13, 5, 10, 2, 4, 'reject', '2022-08-12');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (14, 14, 3, 5, 8, 5, 'accept', '2022-01-26');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (15, 15, 5, 10, 9, 4, 'reject', '2022-01-14');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (16, 16, 2, 5, 7, 7, 'reject', '2022-08-13');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (17, 17, 1, 4, 5, 4, 'accept', '2022-04-14');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (18, 18, 5, 2, 7, 8, 'accept', '2022-07-29');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (19, 19, 9, 9, 8, 2, 'accept', '2022-01-16');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (20, 20, 9, 2, 7, 10, 'reject', '2022-07-20');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (21, 21, 3, 8, 9, 5, 'accept', '2022-07-17');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (22, 22, 4, 8, 8, 7, 'reject', '2022-06-10');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (23, 23, 10, 3, 7, 4, 'accept', '2022-05-08');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (24, 24, 7, 9, 1, 5, 'reject', '2022-05-11');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (25, 25, 6, 1, 6, 6, 'reject', '2022-02-25');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (26, 26, 4, 6, 4, 5, 'reject', '2022-04-11');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (27, 27, 1, 7, 10, 9, 'reject', '2022-02-24');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (28, 28, 7, 9, 1, 6, 'reject', '2022-06-29');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (29, 29, 10, 8, 3, 7, 'reject', '2022-10-02');
insert into FEEDBACK (reviewer_id, manuscript_id, character_development, plot, structure_, style, recommendation, feedback_date) values (30, 30, 8, 4, 4, 1, 'accept', '2022-10-09');
 
 
 
 

-- INSERT DATA INTO VOLUME TABLE

insert into Volume (volume, publication_year) values (1, 1990);
insert into Volume (volume, publication_year) values (2, 1991);
insert into Volume (volume, publication_year) values (3, 1992);
insert into Volume (volume, publication_year) values (4, 1993);
insert into Volume (volume, publication_year) values (5, 1994);
insert into Volume (volume, publication_year) values (6, 1995);
insert into Volume (volume, publication_year) values (7, 1996);
insert into Volume (volume, publication_year) values (8, 1997);
insert into Volume (volume, publication_year) values (9, 1998);
insert into Volume (volume, publication_year) values (10, 1999);
insert into Volume (volume, publication_year) values (11, 2000);
insert into Volume (volume, publication_year) values (12, 2001);
insert into Volume (volume, publication_year) values (13, 2002);
insert into Volume (volume, publication_year) values (14, 2003);
insert into Volume (volume, publication_year) values (15, 2004);
insert into Volume (volume, publication_year) values (16, 2005);
insert into Volume (volume, publication_year) values (17, 2006);
insert into Volume (volume, publication_year) values (18, 2007);
insert into Volume (volume, publication_year) values (19, 2008);
insert into Volume (volume, publication_year) values (20, 2009);
insert into Volume (volume, publication_year) values (21, 2010);
insert into Volume (volume, publication_year) values (22, 2011);
insert into Volume (volume, publication_year) values (23, 2012);
insert into Volume (volume, publication_year) values (24, 2013);
insert into Volume (volume, publication_year) values (25, 2014);
insert into Volume (volume, publication_year) values (26, 2015);
insert into Volume (volume, publication_year) values (27, 2016);
insert into Volume (volume, publication_year) values (28, 2017);
insert into Volume (volume, publication_year) values (29, 2018);
insert into Volume (volume, publication_year) values (30, 2019);


-- INSERT DATA INTO Issue_month TABLE


insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (1, 'september', 23, 'fall');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (2, 'march', 38, 'spring');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (3, 'november', 66, 'winter');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (4, 'january', 28, 'summer');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (5, 'may', 23, 'summer');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (6, 'july', 93, 'spring');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (7, 'december', 68, 'spring');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (8, 'february', 70, 'fall');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (9, 'may', 91, 'summer');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (10, 'january', 9, 'spring');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (11, 'october', 29, 'fall');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (12, 'july', 93, 'winter');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (13, 'february', 69, 'winter');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (14, 'april', 94, 'spring');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (15, 'may', 84, 'summer');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (16, 'january', 60, 'winter');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (17, 'june', 6, 'summer');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (18, 'january', 2, 'winter');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (19, 'february', 15, 'winter');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (20, 'march', 37, 'fall');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (21, 'may', 97, 'fall');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (22, 'october', 4, 'spring');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (23, 'january', 64, 'summer');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (24, 'may', 87, 'fall');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (25, 'april', 43, 'winter');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (26, 'april', 30, 'spring');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (27, 'june', 38, 'fall');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (28, 'may', 38, 'summer');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (29, 'september', 1, 'winter');
insert into Issue_month (issue_monthID, issue_month, Issue_Num, Issue_Period) values (30, 'august', 15, 'summer');


-- INSERT DATA INTO NEWSLETTER TABLE

insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (1, 1, 1, 'Summary of Manuscript 1', 1, '28567', '6017', '2022-09-16');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (2, 1, 1, 'Summary of Manuscript 2', 2, '31017', '35', '2022-09-16');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (3, 3, 3, 'Summary of Manuscript 3', 3, '0602', '26513', '2022-03-22');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (4, 4, 4, 'Summary of Manuscript 4', 4, '4812', '87710', '2022-04-07');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (5, 5, 5, 'Summary of Manuscript 5', 5, '828', '46', '2021-11-28');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (6, 6, 6, 'Summary of Manuscript 6', 6, '63', '720', '2022-04-26');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (7, 7, 7, 'Summary of Manuscript 7', 7, '9', '2165', '2022-10-25');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (8, 8, 8, 'Summary of Manuscript 8', 8, '9', '8705', '2022-03-10');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (9, 9, 9, 'Summary of Manuscript 9', 9, '811', '270', '2022-04-12');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (10, 10, 10, 'Summary of Manuscript 10', 10, '759', '29253', '2022-06-26');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (11, 11, 11, 'Summary of Manuscript 11', 11, '51', '04039', '2022-02-12');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (12, 12, 12, 'Summary of Manuscript 12', 12, '89', '237', '2022-01-05');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (13, 13, 13, 'Summary of Manuscript 13', 13, '30', '07', '2022-09-12');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (14, 14, 14, 'Summary of Manuscript 14', 14, '774', '0196', '2022-10-20');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (15, 15, 15, 'Summary of Manuscript 15', 15, '57', '61027', '2022-06-18');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (16, 16, 16, 'Summary of Manuscript 16', 16, '2', '6', '2022-06-24');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (17, 17, 17, 'Summary of Manuscript 17', 17, '3754', '04485', '2021-12-21');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (18, 18, 18, 'Summary of Manuscript 18', 18, '383', '85790', '2022-01-15');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (19, 19, 19, 'Summary of Manuscript 19', 19, '55', '68', '2022-02-11');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (20, 20, 20, 'Summary of Manuscript 20', 20, '897', '9355', '2022-06-18');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (21, 21, 21, 'Summary of Manuscript 21', 21, '07', '125', '2021-12-24');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (22, 22, 22, 'Summary of Manuscript 22', 22, '8417', '72233', '2022-07-31');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (23, 23, 23, 'Summary of Manuscript 23', 23, '40', '99634', '2022-03-15');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (24, 24, 24, 'Summary of Manuscript 24', 24, '3280', '32', '2022-06-05');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (25, 25, 25, 'Summary of Manuscript 25', 25, '81809', '00', '2022-06-13');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (26, 26, 26, 'Summary of Manuscript 26', 26, '108', '343', '2022-10-03');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (27, 27, 27, 'Summary of Manuscript 27', 27, '37465', '825', '2022-03-21');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (28, 28, 28, 'Summary of Manuscript 28', 28, '4095', '04429', '2022-02-16');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (29, 29, 29, 'Summary of Manuscript 29', 29, '627', '514', '2022-01-22');
insert into Newsletter (manuscript_id, volume, issue_monthid, Summary_title, Summary_order, page_start, page_count, print_date) values (30, 30, 30, 'Summary of Manuscript 30', 30, '4', '6', '2022-10-29');





-- test queries


select * from accepted;
select * from author;
select * from feedback;
select * from genre;
select * from issue_month;
select * from manuscript;
select * from newsletter;
select * from published;
select * from received;
select * from rejected;
select * from reviewer;
select * from reviewer_interest;
select * from scheduled;
select * from submission;
select * from under_review;
select * from volume;

use urpublished;
-- 1
select Title, genre_description as "Genre"
from manuscript join genre using(genre_code)
where status = "Accepted";

-- 2
select 
	concat(Reviewer_First_Name, " ", Reviewer_Last_Name) as "Reviewer Name",
	title as "Rejected Manuscripts"
from 
	reviewer r, manuscript m, feedback f
where
	status = "Rejected"and
	r.reviewer_ID = f.reviewer_ID and
	m.manuscript_ID = f.manuscript_ID
	order by 
	reviewer_last_name;

-- 3
select 
	reviewer_last_name, 
	genre_description as "Genre Description", 
	count(m.manuscript_ID)
from manuscript m, reviewer r, genre g, feedback f
where 
	status= "Accepted" and 
    g.genre_code = m.genre_code and 
    f.manuscript_id = m.manuscript_ID and 
    r.reviewer_ID = f.reviewer_ID
    and author_id in (select author_id from author, manuscript, feedback where )
group by  
	g.genre_description, reviewer_last_name
order by 
	count(manuscript_id);

-- 4
select
Last_name, 
first_name, 
count(s.manuscript_id) as "Number of Manuscripts"
from author a, manuscript m, submission s 
where a.author_id = s.author_id and m.manuscript_id = s.manuscript_id
group by a.author_id
having count(s.manuscript_ID)>1
order by last_name
;

select * from submission;

-- 5
select
Last_name, 
first_name, 
count(m.manuscript_ID) as "Manuscripts Rejected"
from author a, manuscript m, submission s
where status = "rejected" and
a.author_ID = s.author_ID and
s.manuscript_id = m.manuscript_id
group by s.author_id
having count(s.manuscript_ID)>1
order by last_name;

-- 6
select
Title as "Manuscripts Under Review"
from manuscript
where status = "under_review";

-- 7
select
summary_title as "Summary Title",
issue_period as "Period",
n.volume as "Volume", 
publication_year as "Year"
from newsletter n, manuscript m, issue_month i, volume v
where n.manuscript_ID = m.manuscript_ID and status = 'published' 
and n.issue_monthID = i.issue_monthID and v.volume = n.volume
order by publication_year, i.issue_monthID, summary_order;

-- 8
select genre_description as "Genre", 
concat(reviewer_first_name, " ",
reviewer_last_name) as "Reviewer Name",
concat(first_name, " ",last_name) as "Author Name"
from reviewer r, genre g, reviewer_interest i, author a, manuscript m, submission s
where r.reviewer_ID = i.reviewer_id and 
g.genre_code = i.genre_code and
a.author_id = s.author_ID and
m.manuscript_ID = s.manuscript_id and
g.genre_code = m.genre_code
order by genre_description
;

-- 9
select first_name as "Author First Name", genre_description as 
"Genre", count(s.manuscript_id) as "Number of Manuscripts"
from author a, genre g, submission s, manuscript m
where a.author_ID = s.author_id and g.genre_code = m.genre_code 
and m.manuscript_id = s.manuscript_ID
group by genre_description, first_name;

-- 10
select 
i.issue_month, v.publication_year, count(n.manuscript_ID) as "Summaries"
from newsletter n, volume v, issue_month i
where n.volume = v.volume and n.issue_monthid = i.issue_monthid
group by i.issue_monthid, v.volume
order by publication_year, issue_month;

-- 11
select 
genre_description as "Genre", 
count(manuscript_ID) as "Manuscripts Under Review"
from manuscript m, genre g
 where status = "under_review"  and m.genre_code = g.genre_code
group by genre_description;

-- 12
select genre_description as "Genre", count(manuscript_id) as "Manuscripts Rejected"
from genre g, manuscript m
where g.genre_code = m.genre_code and status = "rejected"
group by genre_description
order by count(manuscript_id) desc
limit 1;


