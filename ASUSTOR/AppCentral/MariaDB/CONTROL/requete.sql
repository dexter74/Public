/* Suppression des Databases */
DROP SCHEMA IF EXISTS bitwarden;
DROP SCHEMA IF EXISTS nextcloud;

/* Suppression des Utilisateurs */
DROP USER IF EXISTS bitwarden;
DROP USER IF EXISTS nextcloud;

/* Création Des Base de données */
CREATE DATABASE bitwarden;
CREATE DATABASE nextcloud;

/* Création Utilisateurs */
CREATE USER 'bitwarden'@'%' IDENTIFIED BY 'bitwarden';
CREATE USER 'nextcloud'@'%' IDENTIFIED BY 'nextcloud';

/* Edtiion des Permissions */
GRANT ALL PRIVILEGES ON `bitwarden`.* TO `bitwarden`@`%` WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON `nextcloud`.* TO `nextcloud`@`%` WITH GRANT OPTION;


/* SELECT user,host FROM mysql.user; %/
/* SHOW DATABASES; */
/* SHOW SCHEMAS;   */
/* SELECT user FROM mysql.user; */
 
