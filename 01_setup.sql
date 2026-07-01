-- Création de la base de données
CREATE DATABASE IF NOT EXISTS tifosi
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

-- Création de l'utilisateur dédié
CREATE USER IF NOT EXISTS 'tifosi'@'localhost' IDENTIFIED BY 'Tifosi2026!';

-- Attribution des droits sur la base tifosi uniquement
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';

-- Application immédiate des droits
FLUSH PRIVILEGES;