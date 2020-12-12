
CREATE TABLE IF NOT EXISTS Langs (
                ID INT NOT NULL,
                NAME_LANG VARCHAR(50) NOT NULL,
                PRIMARY KEY (ID)
);


CREATE TABLE IF NOT EXISTS Subscriptions (
                ID INT NOT NULL,
                ID_Lang INT NOT NULL,
                Name_subscription VARCHAR(200) NOT NULL,
                Cost_subscription DOUBLE PRECISIONS NOT NULL,
                length_subscription INT NOT NULL,
                PRIMARY KEY (ID)
);


CREATE TABLE IF NOT EXISTS Themes (
                ID INT NOT NULL,
                ID_Language INT NOT NULL,
                Name_theme VARCHAR(200) NOT NULL,
                PRIMARY KEY (ID)
);


CREATE TABLE IF NOT EXISTS Question_groups (
                ID INT NOT NULL,
                ID_theme INT NOT NULL,
                NAME_QUESTION_GROUP VARCHAR(200) NOT NULL,
                PRIMARY KEY (ID)
);


CREATE TABLE IF NOT EXISTS Content_subscriptions (
                ID_subscription INT NOT NULL,
                ID_QGroup INT NOT NULL,
                PRIMARY KEY (ID_subscription, ID_QGroup)
);


CREATE TABLE IF NOT EXISTS Questions (
                ID INT NOT NULL,
                ID_Group INT NOT NULL,
                Question TEXT(1000) NOT NULL,
                PRIMARY KEY (ID)
);


CREATE TABLE IF NOT EXISTS Users (
                ID INT NOT NULL,
                User_name VARCHAR(50) NOT NULL,
                ID_language INT NOT NULL,
                Login VARCHAR(20) NOT NULL,
                Pwd VARCHAR(20) NOT NULL,
                PRIMARY KEY (ID)
);


CREATE TABLE IF NOT EXISTS User_buys (
                ID INT NOT NULL,
                ID_them INT NOT NULL,
                ID_User INT NOT NULL,
                ID_subscription INT NOT NULL,
                Buy_Date DATE NOT NULL,
                PRIMARY KEY (ID)
);


CREATE TABLE IF NOT EXISTS Answers (
                ID INT NOT NULL,
                ID_Question INT NOT NULL,
                ID_Buy INT NOT NULL,
                ID_User INT NOT NULL,
                Answer TEXT(2000) NOT NULL,
                PRIMARY KEY (ID)
);


CREATE TABLE IF NOT EXISTS Snapshots (
                ID INT NOT NULL,
                ID_Buy INT NOT NULL,
                ID_User INT NOT NULL,
                Snapshot_DateTime TIMESTAMP NOT NULL,
                PRIMARY KEY (ID)
);


CREATE TABLE IF NOT EXISTS Snapshot_contents (
                ID_Snapshot INT NOT NULL,
                Id_Question INT NOT NULL,
                Answer_content TEXT(2000) NOT NULL,
                PRIMARY KEY (ID_Snapshot, Id_Question)
);


CREATE TABLE IF NOT EXISTS Trusts (
                ID_Buy INT NOT NULL,
                ID_User_Trustee INT NOT NULL,
                PRIMARY KEY (ID_Buy, ID_User_Trustee)
);


ALTER TABLE Users ADD CONSTRAINT langs_users_fk
FOREIGN KEY (ID_language)
REFERENCES Langs (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Themes ADD CONSTRAINT langs_themes_fk
FOREIGN KEY (ID_Language)
REFERENCES Langs (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Subscriptions ADD CONSTRAINT langs_subscriptions_fk
FOREIGN KEY (ID_Lang)
REFERENCES Langs (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Content_subscriptions ADD CONSTRAINT subscrs_content_subscrs_fk
FOREIGN KEY (ID_subscription)
REFERENCES Subscriptions (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE User_buys ADD CONSTRAINT subscriptions_user_buys_fk
FOREIGN KEY (ID_subscription)
REFERENCES Subscriptions (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Question_groups ADD CONSTRAINT themes_question_groups_fk
FOREIGN KEY (ID_theme)
REFERENCES Themes (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE User_buys ADD CONSTRAINT themes_user_buys_fk
FOREIGN KEY (ID_them)
REFERENCES Themes (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Questions ADD CONSTRAINT question_groups_questions_fk
FOREIGN KEY (ID_Group)
REFERENCES Question_groups (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Content_subscriptions ADD CONSTRAINT q_groups_content_subscr_fk
FOREIGN KEY (ID_QGroup)
REFERENCES Question_groups (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Answers ADD CONSTRAINT questions_answers_fk
FOREIGN KEY (ID_Question)
REFERENCES Questions (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Trusts ADD CONSTRAINT users_trusts_fk
FOREIGN KEY (ID_User_Trustee)
REFERENCES Users (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE User_buys ADD CONSTRAINT users_user_buys_fk
FOREIGN KEY (ID_User)
REFERENCES Users (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Answers ADD CONSTRAINT users_answers_fk
FOREIGN KEY (ID_User)
REFERENCES Users (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Snapshots ADD CONSTRAINT users_snapshots_fk
FOREIGN KEY (ID_User)
REFERENCES Users (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Trusts ADD CONSTRAINT user_buys_trusts_fk
FOREIGN KEY (ID_Buy)
REFERENCES User_buys (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Snapshots ADD CONSTRAINT user_buys_snapshots_fk
FOREIGN KEY (ID_Buy)
REFERENCES User_buys (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Answers ADD CONSTRAINT user_buys_answers_fk
FOREIGN KEY (ID_Buy)
REFERENCES User_buys (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Snapshot_contents ADD CONSTRAINT snapshots_snapshot_contents_fk
FOREIGN KEY (ID_Snapshot)
REFERENCES Snapshots (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
