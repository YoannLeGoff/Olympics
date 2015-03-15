-- Created by Vertabelo (http://vertabelo.com)
-- Script type: create
-- Scope: [tables, references, sequences, views, procedures]
-- Generated at Sun Mar 15 18:52:21 UTC 2015




-- tables
-- Table athletes
CREATE TABLE athletes (
    AID int    NOT NULL  AUTO_INCREMENT,
    PID int    NOT NULL ,
    IID int    NOT NULL ,
    CONSTRAINT athletes_pk PRIMARY KEY (AID)
);

-- Table events
CREATE TABLE events (
    EID int    NOT NULL  AUTO_INCREMENT,
    IID int    NOT NULL ,
    GID int    NOT NULL ,
    CONSTRAINT events_pk PRIMARY KEY (EID)
);

-- Table games
CREATE TABLE games (
    GID int    NOT NULL ,
    url int    NOT NULL ,
    title int    NOT NULL DEFAULT Game title ,
    description varchar(500)    NULL ,
    creation date    NULL DEFAULT CURRENT_TIMESTAMP ,
    unit varchar(10)    NOT NULL ,
    ranking_mode varchar(10)    NOT NULL ,
    CONSTRAINT games_pk PRIMARY KEY (GID)
);

-- Table instances
CREATE TABLE instances (
    IID int    NOT NULL ,
    url varchar(50)    NOT NULL ,
    title varchar(100)    NOT NULL ,
    description int    NULL ,
    city varchar(50)    NULL ,
    instance_date date    NULL ,
    CONSTRAINT instances_pk PRIMARY KEY (IID)
);

-- Table judges
CREATE TABLE judges (
    JID int    NOT NULL ,
    AID int    NOT NULL ,
    EID int    NOT NULL ,
    IID int    NOT NULL ,
    PID int    NOT NULL ,
    CONSTRAINT judges_pk PRIMARY KEY (JID)
);

-- Table people
CREATE TABLE people (
    PID int    NOT NULL  AUTO_INCREMENT,
    nom varchar(200)    NOT NULL ,
    birthdate date    NOT NULL ,
    email varchar(200)    NOT NULL ,
    CONSTRAINT people_pk PRIMARY KEY (PID)
);

-- Table results
CREATE TABLE results (
    RID int    NOT NULL ,
    EID int    NOT NULL ,
    AID int    NOT NULL ,
    JID int    NOT NULL ,
    result varchar(10)    NOT NULL ,
    result_datetime timestamp    NOT NULL ,
    CONSTRAINT results_pk PRIMARY KEY (RID)
);





-- foreign keys
-- Reference:  Events_games (table: events)


ALTER TABLE events ADD CONSTRAINT Events_games FOREIGN KEY Events_games (GID)
    REFERENCES games (GID);
-- Reference:  Events_instances (table: events)


ALTER TABLE events ADD CONSTRAINT Events_instances FOREIGN KEY Events_instances (IID)
    REFERENCES instances (IID);
-- Reference:  athletes_instances (table: athletes)


ALTER TABLE athletes ADD CONSTRAINT athletes_instances FOREIGN KEY athletes_instances (IID)
    REFERENCES instances (IID);
-- Reference:  athletes_judges (table: judges)


ALTER TABLE judges ADD CONSTRAINT athletes_judges FOREIGN KEY athletes_judges (AID)
    REFERENCES athletes (AID);
-- Reference:  athletes_people (table: athletes)


ALTER TABLE athletes ADD CONSTRAINT athletes_people FOREIGN KEY athletes_people (PID)
    REFERENCES people (PID);
-- Reference:  judges_Events (table: judges)


ALTER TABLE judges ADD CONSTRAINT judges_Events FOREIGN KEY judges_Events (EID)
    REFERENCES events (EID);
-- Reference:  judges_instances (table: judges)


ALTER TABLE judges ADD CONSTRAINT judges_instances FOREIGN KEY judges_instances (IID)
    REFERENCES instances (IID);
-- Reference:  judges_people (table: judges)


ALTER TABLE judges ADD CONSTRAINT judges_people FOREIGN KEY judges_people (PID)
    REFERENCES people (PID);
-- Reference:  results_Events (table: results)


ALTER TABLE results ADD CONSTRAINT results_Events FOREIGN KEY results_Events (EID)
    REFERENCES events (EID);
-- Reference:  results_athletes (table: results)


ALTER TABLE results ADD CONSTRAINT results_athletes FOREIGN KEY results_athletes (AID)
    REFERENCES athletes (AID);
-- Reference:  results_judges (table: results)


ALTER TABLE results ADD CONSTRAINT results_judges FOREIGN KEY results_judges (JID)
    REFERENCES judges (JID);



-- End of file.

