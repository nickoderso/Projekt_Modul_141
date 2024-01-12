USE Modul_141;
INSERT INTO Modul_141.type(name) 
SELECT DISTINCT type
FROM Import;

INSERT INTO Modul_141.usergroup(`GID`, `Group`)
SELECT DISTINCT gid, `group`
FROM Import;

INSERT INTO Modul_141.systemuser(`UID`, `User`)
SELECT DISTINCT uid, `user`
FROM Import;

INSERT INTO Modul_141.data(`digest`, `content`, `size`, `compression`, `Type_ID`)
SELECT DISTINCT `digest`, `data`, `size`, `compression`, (SELECT ID FROM modul_141.type where type.name = import.type)
FROM Import;

INSERT INTO Modul_141.meta(`path`, `perm`, `time`, `Systemuser_UID`, `USergroup_GID`, `Data_digest`)
SELECT DISTINCT `path`, `perm`, `time`, `uid`, `gid`, `digest`
FROM Import;

DROP TABLE Import;+
