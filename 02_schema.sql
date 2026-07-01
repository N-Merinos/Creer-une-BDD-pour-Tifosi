USE tifosi;

-- Nettoyage avant recréation (ordre inverse des dépendances)
DROP TABLE IF EXISTS contient;
DROP TABLE IF EXISTS achete;
DROP TABLE IF EXISTS comprend;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS focaccia;
DROP TABLE IF EXISTS boisson;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS marque;
DROP TABLE IF EXISTS ingredient;

-- Table ingredient
CREATE TABLE ingredient (
    id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
);

-- Table marque
CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
);

-- Table client
CREATE TABLE client (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    code_postal INT
);

-- Table boisson (dépend de marque)
CREATE TABLE boisson (
    id_boisson INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    id_marque INT NOT NULL,
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
);

-- Table focaccia
CREATE TABLE focaccia (
    id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL CHECK (prix > 0)
);

-- Table menu (dépend de focaccia)
CREATE TABLE menu (
    id_menu INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL CHECK (prix > 0),
    id_focaccia INT NOT NULL,
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
);

-- Table comprend (jonction ingredient <-> focaccia)
CREATE TABLE comprend (
    id_ingredient INT NOT NULL,
    id_focaccia INT NOT NULL,
    quantite INT NOT NULL CHECK (quantite > 0),
    PRIMARY KEY (id_ingredient, id_focaccia),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
);

-- Table achete (jonction client <-> menu)
CREATE TABLE achete (
    id_achat INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT NOT NULL,
    id_menu INT NOT NULL,
    date_achat DATE NOT NULL,
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
);

-- Table contient (jonction menu <-> boisson)
CREATE TABLE contient (
    id_menu INT NOT NULL,
    id_boisson INT NOT NULL,
    PRIMARY KEY (id_menu, id_boisson),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
);