USE modul_141;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.2\\Uploads\\import-nick-gilgen.csv'
INTO TABLE `import`
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(`# count`, `digest`, `path`, `size`, `type`, `perm`, `uid`, `user`, `gid`, `group`, `time`, `compression`, `data`);

SELECT * FROM import;