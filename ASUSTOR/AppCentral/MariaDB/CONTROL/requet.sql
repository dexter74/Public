/* Création des Bases de données */
CREATE DATABASE bitwarden;
CREATE DATABASE nextcloud;

/* Création des utilisateurs */
CREATE USER 'bitwarden'@'%' IDENTIFIED BY 'bitwarden';
CREATE USER 'nextcloud'@'%' IDENTIFIED BY 'nextcloud';

/* Edtiion des Permissions */
GRANT ALL PRIVILEGES ON `bitwarden`.* TO `bitwarden`@`%` WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON `nextcloud`.* TO `nextcloud`@`%` WITH GRANT OPTION;
