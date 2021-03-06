-- *********************************************************************
-- SQL to add all changesets to database history table
-- *********************************************************************
-- Change Log: changelog.groovy
-- Ran at: 2011-12-10 18:58
-- Against: bulletin-dev@localhost@jdbc:mysql://localhost/bulletin-dev
-- Liquibase version: 2.0.1
-- *********************************************************************

-- Create Database Lock Table
CREATE TABLE `DATABASECHANGELOGLOCK` (`ID` INT NOT NULL, `LOCKED` TINYINT(1) NOT NULL, `LOCKGRANTED` DATETIME, `LOCKEDBY` VARCHAR(255), CONSTRAINT `PK_DATABASECHANGELOGLOCK` PRIMARY KEY (`ID`)) ENGINE=InnoDB;

INSERT INTO `DATABASECHANGELOGLOCK` (`ID`, `LOCKED`) VALUES (1, 0);

-- Lock Database
-- Create Database Change Log Table
CREATE TABLE `DATABASECHANGELOG` (`ID` VARCHAR(63) NOT NULL, `AUTHOR` VARCHAR(63) NOT NULL, `FILENAME` VARCHAR(200) NOT NULL, `DATEEXECUTED` DATETIME NOT NULL, `ORDEREXECUTED` INT NOT NULL, `EXECTYPE` VARCHAR(10) NOT NULL, `MD5SUM` VARCHAR(35), `DESCRIPTION` VARCHAR(255), `COMMENTS` VARCHAR(255), `TAG` VARCHAR(255), `LIQUIBASE` VARCHAR(20), CONSTRAINT `PK_DATABASECHANGELOG` PRIMARY KEY (`ID`, `AUTHOR`, `FILENAME`)) ENGINE=InnoDB;

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jmbe (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'changelog-baseline.groovy', '1323539606973-1', '2.0.1', '3:3b8a7ddd88acf4dbc5f598c03ac54827', 1);

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jmbe (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'changelog-baseline.groovy', '1323539606973-2', '2.0.1', '3:f5e3015cdddfaa70408fc7b280a706dd', 2);

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jmbe (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'changelog-baseline.groovy', '1323539606973-3', '2.0.1', '3:f45ab6432c805617a43497eba6e58f03', 3);

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jmbe (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'changelog-baseline.groovy', '1323539606973-4', '2.0.1', '3:3c273785673a40853d43a007b8dad7be', 4);

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jmbe (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'changelog-baseline.groovy', '1323539606973-5', '2.0.1', '3:8e1b2277e0aa08f40ef04493d798b010', 5);

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jmbe (generated)', '', NOW(), 'Create Table', 'EXECUTED', 'changelog-baseline.groovy', '1323539606973-6', '2.0.1', '3:ec8322d5cfa3806d7ca6f7de9694c214', 6);

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jmbe (generated)', '', NOW(), 'Add Primary Key', 'EXECUTED', 'changelog-baseline.groovy', '1323539606973-7', '2.0.1', '3:2ae4e160c09e2a7dca00d099d415ead8', 7);

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jmbe (generated)', '', NOW(), 'Create Index', 'EXECUTED', 'changelog-baseline.groovy', '1323539606973-8', '2.0.1', '3:1cd375210a7f6b9a55eb88e9959b280f', 8);

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jmbe (generated)', '', NOW(), 'Create Index', 'EXECUTED', 'changelog-baseline.groovy', '1323539606973-9', '2.0.1', '3:a9469d5c659d2844cca8f351a492edeb', 9);

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jmbe (generated)', '', NOW(), 'Create Index', 'EXECUTED', 'changelog-baseline.groovy', '1323539606973-10', '2.0.1', '3:6638a6f0f6adbe47f7d370d4920c6f1c', 10);

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jmbe (generated)', '', NOW(), 'Create Index', 'EXECUTED', 'changelog-baseline.groovy', '1323539606973-11', '2.0.1', '3:2cb87765de66196d262f7efe9bc7a94f', 11);

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jmbe (generated)', '', NOW(), 'Create Index', 'EXECUTED', 'changelog-baseline.groovy', '1323539606973-12', '2.0.1', '3:4189f75f19c9650c939cc1b4ed40b879', 12);

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jmbe (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'changelog-baseline.groovy', '1323539606973-13', '2.0.1', '3:fec23ed9c71e3ff314d891e487bc104d', 13);

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jmbe (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'changelog-baseline.groovy', '1323539606973-14', '2.0.1', '3:2adfee59b68df02d6eaeb073c7963b10', 14);

INSERT INTO `DATABASECHANGELOG` (`AUTHOR`, `COMMENTS`, `DATEEXECUTED`, `DESCRIPTION`, `EXECTYPE`, `FILENAME`, `ID`, `LIQUIBASE`, `MD5SUM`, `ORDEREXECUTED`) VALUES ('jmbe (generated)', '', NOW(), 'Add Foreign Key Constraint', 'EXECUTED', 'changelog-baseline.groovy', '1323539606973-15', '2.0.1', '3:09d2bf209980d3d2ad85dfd3c41b2be3', 15);

