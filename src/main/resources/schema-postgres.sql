/* SQLINES DEMO *** s license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* SQLINES DEMO *** rejo
 * Created: 21-feb-2019
 */


/* SET FOREIGN_KEY_CHECKS = 0; */
DROP TABLE IF EXISTS hibernate_sequences;
DROP TABLE IF EXISTS Confirmation;
DROP TABLE IF EXISTS Experiment;
DROP TABLE IF EXISTS SocialNetworkConfiguration;
DROP TABLE IF EXISTS SocialNetworkAccount;
DROP TABLE IF EXISTS WorkspaceTags;
DROP TABLE IF EXISTS Tag;
DROP TABLE IF EXISTS Workspace;
DROP TABLE IF EXISTS UserAccount_authorities;
DROP TABLE IF EXISTS Researcher;
DROP TABLE IF EXISTS UserAccount ;
DROP TABLE IF EXISTS UserConnection;
/* SET FOREIGN_KEY_CHECKS = 1; */


-- hibernate_sequences
-- ------------------------------------------------------------

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE hibernate_sequences (
  sequence_name varchar(255) DEFAULT NULL,
  next_val int DEFAULT NULL
) ;

-- UserConnection
-- ------------------------------------------------------------

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE Table UserConnection (userId varchar(255) not null,
    providerId varchar(255) not null,
    providerUserId varchar(255),
    rank int not null,
    displayName varchar(255),
    profileUrl varchar(512),
    imageUrl varchar(512),
    accessToken varchar(512) not null,
    secret varchar(512),
    refreshToken varchar(512),
    expireTime bigint,
    primary key (userId, providerId, providerUserId));

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE UNIQUE INDEX UserConnectionRank on UserConnection(userId, providerId, rank);


-- UserAccount

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE UserAccount (
  id int NOT NULL,
  version int NOT NULL,
  password varchar(255) DEFAULT NULL,
  username varchar(255) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT username UNIQUE  (username)
) ;

-- SocialNetworkAccount
-- ------------------------------------------------------------

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE SocialNetworkAccount (
  id int NOT NULL,
  version int NOT NULL,
  accessToken varchar(255) DEFAULT NULL,
  createDate timestamp(0) DEFAULT NULL,
  displayName varchar(255) DEFAULT NULL,
  expireTime bigint DEFAULT NULL,
  imageUrl varchar(255) DEFAULT NULL,
  profileUrl varchar(255) DEFAULT NULL,
  providerId varchar(255) DEFAULT NULL,
  providerUserId varchar(255) DEFAULT NULL,
  rank int NOT NULL,
  refreshToken varchar(255) DEFAULT NULL,
  secret varchar(255) DEFAULT NULL,
  userId varchar(255) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT userId UNIQUE  (userId,providerId,rank),
  CONSTRAINT userId_2 UNIQUE (userId,providerId,providerUserId)
) ;


-- Researcher
-- ------------------------------------------------------------

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Researcher (
  id int NOT NULL,
  version int NOT NULL,
  address varchar(255) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  name varchar(255) DEFAULT NULL,
  phone varchar(255) DEFAULT NULL,
  userAccount_id int DEFAULT NULL,
  PRIMARY KEY (id)
 ,
  CONSTRAINT FK3C2B9D5FFC733F2f37dafa8 FOREIGN KEY (userAccount_id) REFERENCES UserAccount (id)
   	ON DELETE CASCADE
    ON UPDATE CASCADE
) ;

CREATE INDEX FK3C2B9D5FFC733F2f37dafa8 ON Researcher (userAccount_id);

-- Confirmation
-- ------------------------------------------------------------

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Confirmation (
  id int NOT NULL,
  version int NOT NULL,
  confirmationCode varchar(255) DEFAULT NULL,
  confirmationDate timestamp(0) DEFAULT NULL,
  registrationDate timestamp(0) DEFAULT NULL,
  researcher_id int NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT researcher_id UNIQUE  (researcher_id),
  CONSTRAINT confirmationCode UNIQUE  (confirmationCode)
 ,
  CONSTRAINT FK86E9E05535D39501 FOREIGN KEY (researcher_id) REFERENCES Researcher (id)
   	ON DELETE CASCADE
    ON UPDATE CASCADE
) ;

CREATE INDEX FK86E9E05535D39501 ON Confirmation (researcher_id);



-- Experiment
-- ------------------------------------------------------------

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Experiment (
  id int NOT NULL,
  version int NOT NULL,
  description varchar(255) DEFAULT NULL,
  experimentId varchar(255) DEFAULT NULL,
  experimentName varchar(255) DEFAULT NULL,
  publicExperiment smallint NOT NULL,
  owner_id int NOT NULL,
  PRIMARY KEY (id)
 ,
  CONSTRAINT FK71BBB81D7956A1F6 FOREIGN KEY (owner_id) REFERENCES Researcher (id)
   	ON DELETE CASCADE
    ON UPDATE CASCADE
) ;

CREATE INDEX FK71BBB81D7956A1F6 ON Experiment (owner_id);

-- SocialNetworkConfiguration
-- ------------------------------------------------------------

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE SocialNetworkConfiguration (
  id int NOT NULL,
  version int NOT NULL,
  notifyWhenExperimentExecutionFinished smallint NOT NULL,
  publishExistingExperimentMadePublic smallint NOT NULL,
  publishNewExperimentExecutionFinished smallint NOT NULL,
  publishNewPublicExperimentCreated smallint NOT NULL,
  publishNewPublicExperimentExecutionStarted smallint NOT NULL,
  service varchar(255) DEFAULT NULL,
  actor_id int NOT NULL,
  PRIMARY KEY (id)
 ,
  CONSTRAINT FK3B9FB495B3D38B74 FOREIGN KEY (actor_id) REFERENCES Researcher (id)
   	ON DELETE CASCADE
    ON UPDATE CASCADE
) ;

CREATE INDEX FK3B9FB495B3D38B74 ON SocialNetworkConfiguration (actor_id);


-- Tag
-- ------------------------------------------------------------

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Tag (
  id int NOT NULL,
  version int NOT NULL,
  name varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (id)
)  ;

-- UserAccount_authorities
-- ------------------------------------------------------------

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE UserAccount_authorities (
  UserAccount_id int NOT NULL,
  authority varchar(255) DEFAULT NULL
 ,
  CONSTRAINT FKA380F224FFC733F2 FOREIGN KEY (UserAccount_id) REFERENCES UserAccount (id)
   	ON DELETE CASCADE
    ON UPDATE CASCADE
) ;

CREATE INDEX FKA380F224FFC733F2 ON UserAccount_authorities (UserAccount_id);

-- Workspace
-- ------------------------------------------------------------

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Workspace (
  id int NOT NULL,
  version varchar(20)  NOT NULL,
  owner_id int NOT NULL,
  description varchar(200) DEFAULT '""',
  downloads int DEFAULT '0',
  launches int DEFAULT '0',
  lastMod timestamp(0) DEFAULT NULL,
  name varchar(100)  NOT NULL DEFAULT '',
  origin_id int DEFAULT NULL,
  wsVersion int NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
 ,
  CONSTRAINT origin FOREIGN KEY (origin_id) REFERENCES Workspace (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT owner FOREIGN KEY (owner_id) REFERENCES Researcher (id)
)  ;

 CREATE INDEX owner ON Workspace (owner_id);
 CREATE INDEX origin ON Workspace (origin_id);

-- WorkspaceTags
-- ------------------------------------------------------------

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE WorkspaceTags (
  id_ws int NOT NULL,
  id_tag int NOT NULL
 ,
  CONSTRAINT taggedWorkspaces FOREIGN KEY (id_ws) REFERENCES Workspace (id),
  CONSTRAINT workspaceTags FOREIGN KEY (id_tag) REFERENCES Tag (id)
)  ;

 CREATE INDEX taggedWorkspaces ON WorkspaceTags (id_ws);
 CREATE INDEX workspaceTags ON WorkspaceTags (id_tag);