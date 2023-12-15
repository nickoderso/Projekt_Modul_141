DROP DATABASE IF EXISTS Modul_141;
CREATE DATABASE Modul_141;

USE Modul_141;

CREATE TABLE Import (
    `# Count` INT NOT NULL UNIQUE,
    Digest VARCHAR(50) NOT NULL,
    path text NOT NULL,
    size INT NOT NULL,
    type NVARCHAR(50) NOT NULL,
    perm INT NOT NULL,
    uid INT NOT NULL,
    user VARCHAR(50) NOT NULL,
    gid INT NOT NULL,
    `group` VARCHAR(50) NOT NULL,
    time INT NOT NULL,
    compression INT NOT NULL,
    data text NOT NULL,
    PRIMARY KEY (`# COUNT`)
);

CREATE TABLE Type (
    ID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50) UNIQUE,
    PRIMARY KEY (ID)
);

CREATE TABLE Tag (
    ID INT NOT NULL AUTO_INCREMENT,
    Name Varchar(50) UNIQUE,
    PRIMARY KEY (ID)
);

CREATE TABLE Usergroup (
    GID INT NOT NULL UNIQUE,
    `Group` Varchar(50) NOT NULL UNIQUE,
    PRIMARY KEY (GID)
);

CREATE TABLE Systemuser (
    UID INT NOT NULL UNIQUE,
    User Varchar(50) NOT NULL UNIQUE,
    PRIMARY KEY (UID)
);

CREATE TABLE Data (
    digest Varchar(50) NOT NULL,
    Content text NOT NULL,
    Size INT NOT NULL,
    Compression INT NOT NULL,
    Type_ID INT,
    PRIMARY KEY (digest),
    FOREIGN KEY (Type_ID) REFERENCES Type(ID) ON DELETE CASCADE
);

CREATE TABLE Meta (
    ID INT NOT NULL AUTO_INCREMENT,
    path Varchar(250) NOT NULL,
    perm INT NOT NUll,
    time INT NOT NULL,
    Systemuser_UID INT,
    Usergroup_GID INT,
    Data_digest Varchar(50) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (Systemuser_UID) REFERENCES Systemuser(UID) ON DELETE CASCADE,
    FOREIGN KEY (Usergroup_GID) REFERENCES Usergroup(GID) ON DELETE CASCADE,
    FOREIGN KEY (Data_digest) REFERENCES Data(digest) ON DELETE CASCADE 
);

CREATE TABLE Data_Tag (
    Data_Digest Varchar(50) NOT NULL,
    Tag_ID INT,
    PRIMARY KEY (Data_Digest, Tag_ID),
    FOREIGN KEY (Data_Digest) REFERENCES Data(Digest) ON DELETE CASCADE,
    FOREIGN KEY (Tag_ID) REFERENCES Tag(ID) ON DELETE CASCADE
);
