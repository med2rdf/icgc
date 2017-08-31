CREATE USER icgc_user IDENTIFIED BY oracle
QUOTA UNLIMITED ON users;
GRANT connect, resource TO icgc_user;
