USE Modul_141;
INSERT INTO Modul_141.Type(name) 
SELECT DISTINCT type
FROM Import;

INSERT INTO Modul_141.Usergroup(`GID`, `Group`)
SELECT DISTINCT gid, `group`
FROM Import;

INSERT INTO Modul_141.Systemuser(`UID`, `User`)
SELECT DISTINCT uid, `user`
FROM Import;

INSERT INTO Modul_141.Data(`digest`, `content`, `size`, `compression`, `Type_ID`)
SELECT DISTINCT `digest`, `data`, `size`, `compression`, (SELECT ID FROM Modul_141.Type where Type.Name = Import.Type)
FROM Import;

INSERT INTO Modul_141.Meta(`path`, `perm`, `time`, `Systemuser_UID`, `USergroup_GID`, `Data_digest`)
SELECT DISTINCT `path`, `perm`, `time`, `uid`, `gid`, `digest`
FROM Import;

DROP TABLE Import;+
