/* SQLINES DEMO *** rejo
 * Created: 21-feb-2019
 */

-- ------------------------------------------------------------
-- hibernate_sequences
-- ------------------------------------------------------------

/* SQLINES DEMO *** E `hibernate_sequences` DISABLE KEYS ; */

INSERT INTO hibernate_sequences (sequence_name, next_val)
VALUES
	('DomainEntity',10),
    ('default',10);



/* SQLINES DEMO *** E `hibernate_sequences` ENABLE KEYS ; */
UNLOCK TABLES;

-- ------------------------------------------------------------
-- User Accounts
-- ------------------------------------------------------------

LOCK TABLES UserAccount WRITE;
/* SQLINES DEMO *** E `UserAccount` DISABLE KEYS */;

INSERT INTO UserAccount (id, version, password, username)
VALUES
	(21,1,'084e0343a0486ff05530df6c705c8bb4','guest'),
	(22,1,'1d11608a12a5a8347ae8e3577a26e001','DemoMaster'),
	(23,1,'cfe0613e4ccf4e08bf75e712f8597f55','AutoTester'),
	(24,1,'1d11608a12a5a8347ae8e3577a26e001','admin');

/* SQLINES DEMO *** E `UserAccount` ENABLE KEYS */;
UNLOCK TABLES;

-- ------------------------------------------------------------
-- Researchers
-- ------------------------------------------------------------

LOCK TABLES Researcher WRITE;
/* SQLINES DEMO *** E `Researcher` DISABLE KEYS */;

INSERT INTO Researcher (id, version, address, email, name, phone, userAccount_id)
VALUES
	(1,1,'unknown','iamaguest@us.es','Guest','000',21),
	(2,1,'unknown','demomaser@us.es','DemoMaster','000',22),
	(3,1,'unknown','autotester@us.es','AutoTester','000',23),
	(4,1,'unknown','admin@ideas.isa.us.es','Admin','000',24);
/* SQLINES DEMO *** E `Resaearcher` ENABLE KEYS */;
UNLOCK TABLES;

-- ------------------------------------------------------------
-- UserAccount_authorities
-- ------------------------------------------------------------
LOCK TABLES UserAccount_authorities WRITE;
/* SQLINES DEMO *** E `UserAccount_authorities` DISABLE KEYS */;

INSERT INTO UserAccount_authorities (UserAccount_id, authority)
VALUES
	(21,'RESEARCHER'),
	(22,'RESEARCHER'),
	(23,'RESEARCHER'),
	(24,'ADMIN');

/* SQLINES DEMO *** E `UserAccount_authorities` ENABLE KEYS */;
