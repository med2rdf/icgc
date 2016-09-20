DROP DATABASE IF EXISTS linked_icgc;
DROP USER linked_icgc@localhost;
CREATE DATABASE linked_icgc DEFAULT CHARACTER SET utf8;
CREATE USER linked_icgc@localhost IDENTIFIED BY 'p';
GRANT ALL ON linked_icgc.* to linked_icgc@localhost;

