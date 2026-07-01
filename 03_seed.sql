USE tifosi;

-- Nettoyage avant repeuplement (ordre inverse des dépendances)
DELETE FROM comprend;
DELETE FROM contient;
DELETE FROM achete;
DELETE FROM boisson;
DELETE FROM menu;
DELETE FROM focaccia;
DELETE FROM client;
DELETE FROM marque;
DELETE FROM ingredient;

-- 1. Marques
INSERT INTO marque (id_marque, nom) VALUES (1, 'Coca-cola');
INSERT INTO marque (id_marque, nom) VALUES (2, 'Cristalline');
INSERT INTO marque (id_marque, nom) VALUES (3, 'Monster');
INSERT INTO marque (id_marque, nom) VALUES (4, 'Pepsico');

-- 2. Ingredients
INSERT INTO ingredient (id_ingredient, nom) VALUES (1, 'Ail');
INSERT INTO ingredient (id_ingredient, nom) VALUES (2, 'Ananas');
INSERT INTO ingredient (id_ingredient, nom) VALUES (3, 'Artichaut');
INSERT INTO ingredient (id_ingredient, nom) VALUES (4, 'Bacon');
INSERT INTO ingredient (id_ingredient, nom) VALUES (5, 'Base Tomate');
INSERT INTO ingredient (id_ingredient, nom) VALUES (6, 'Base crème');
INSERT INTO ingredient (id_ingredient, nom) VALUES (7, 'Champignon');
INSERT INTO ingredient (id_ingredient, nom) VALUES (8, 'Chevre');
INSERT INTO ingredient (id_ingredient, nom) VALUES (9, 'Cresson');
INSERT INTO ingredient (id_ingredient, nom) VALUES (10, 'Emmental');
INSERT INTO ingredient (id_ingredient, nom) VALUES (11, 'Gorgonzola');
INSERT INTO ingredient (id_ingredient, nom) VALUES (12, 'Jambon cuit');
INSERT INTO ingredient (id_ingredient, nom) VALUES (13, 'Jambon fumé');
INSERT INTO ingredient (id_ingredient, nom) VALUES (14, 'Oeuf');
INSERT INTO ingredient (id_ingredient, nom) VALUES (15, 'Oignon');
INSERT INTO ingredient (id_ingredient, nom) VALUES (16, 'Olive noire');
INSERT INTO ingredient (id_ingredient, nom) VALUES (17, 'Olive verte');
INSERT INTO ingredient (id_ingredient, nom) VALUES (18, 'Parmesan');
INSERT INTO ingredient (id_ingredient, nom) VALUES (19, 'Piment');
INSERT INTO ingredient (id_ingredient, nom) VALUES (20, 'Poivre');
INSERT INTO ingredient (id_ingredient, nom) VALUES (21, 'Pomme de terre');
INSERT INTO ingredient (id_ingredient, nom) VALUES (22, 'Raclette');
INSERT INTO ingredient (id_ingredient, nom) VALUES (23, 'Salami');
INSERT INTO ingredient (id_ingredient, nom) VALUES (24, 'Tomate cerise');
INSERT INTO ingredient (id_ingredient, nom) VALUES (25, 'Mozarella');

-- 3. Focaccias
INSERT INTO focaccia (id_focaccia, nom, prix) VALUES (1, 'Mozaccia', 9.80);
INSERT INTO focaccia (id_focaccia, nom, prix) VALUES (2, 'Gorgonzollaccia', 10.80);
INSERT INTO focaccia (id_focaccia, nom, prix) VALUES (3, 'Raclaccia', 8.90);
INSERT INTO focaccia (id_focaccia, nom, prix) VALUES (4, 'Emmentalaccia', 9.80);
INSERT INTO focaccia (id_focaccia, nom, prix) VALUES (5, 'Tradizione', 8.90);
INSERT INTO focaccia (id_focaccia, nom, prix) VALUES (6, 'Hawaienne', 11.20);
INSERT INTO focaccia (id_focaccia, nom, prix) VALUES (7, 'Américaine', 10.80);
INSERT INTO focaccia (id_focaccia, nom, prix) VALUES (8, 'Paysanne', 12.80);

-- 4. Boissons (jointure marque par nom -> id_marque)
INSERT INTO boisson (id_boisson, nom, id_marque) VALUES (1, 'Coca-cola zéro', 1);
INSERT INTO boisson (id_boisson, nom, id_marque) VALUES (2, 'Coca-cola original', 1);
INSERT INTO boisson (id_boisson, nom, id_marque) VALUES (3, 'Fanta citron', 1);
INSERT INTO boisson (id_boisson, nom, id_marque) VALUES (4, 'Fanta orange', 1);
INSERT INTO boisson (id_boisson, nom, id_marque) VALUES (5, 'Capri-sun', 1);
INSERT INTO boisson (id_boisson, nom, id_marque) VALUES (6, 'Pepsi', 4);
INSERT INTO boisson (id_boisson, nom, id_marque) VALUES (7, 'Pepsi Max Zéro', 4);
INSERT INTO boisson (id_boisson, nom, id_marque) VALUES (8, 'Lipton zéro citron', 4);
INSERT INTO boisson (id_boisson, nom, id_marque) VALUES (9, 'Lipton Peach', 4);
INSERT INTO boisson (id_boisson, nom, id_marque) VALUES (10, 'Monster energy ultra gold', 3);
INSERT INTO boisson (id_boisson, nom, id_marque) VALUES (11, 'Monster energy ultra blue', 3);
INSERT INTO boisson (id_boisson, nom, id_marque) VALUES (12, 'Eau de source', 2);

-- 5. Comprend (composition de chaque focaccia, quantites en grammes)
-- Mozaccia
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (5, 1, 200);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (25, 1, 50);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (9, 1, 20);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (13, 1, 80);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (1, 1, 2);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (3, 1, 20);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (7, 1, 40);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (18, 1, 50);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (20, 1, 1);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (16, 1, 20);

-- Gorgonzollaccia
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (5, 2, 200);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (11, 2, 50);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (9, 2, 20);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (1, 2, 2);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (7, 2, 40);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (18, 2, 50);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (20, 2, 1);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (16, 2, 20);

-- Raclaccia
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (5, 3, 200);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (22, 3, 50);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (9, 3, 20);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (1, 3, 2);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (7, 3, 40);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (18, 3, 50);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (20, 3, 1);

-- Emmentalaccia
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (6, 4, 200);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (10, 4, 50);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (9, 4, 20);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (7, 4, 40);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (18, 4, 50);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (20, 4, 1);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (15, 4, 20);

-- Tradizione
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (5, 5, 200);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (25, 5, 50);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (9, 5, 20);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (12, 5, 80);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (7, 5, 80);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (18, 5, 50);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (20, 5, 1);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (16, 5, 10);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (17, 5, 10);

-- Hawaienne
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (5, 6, 200);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (25, 6, 50);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (9, 6, 20);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (4, 6, 80);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (2, 6, 40);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (19, 6, 2);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (18, 6, 50);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (20, 6, 1);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (16, 6, 20);

-- Américaine
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (5, 7, 200);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (25, 7, 50);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (9, 7, 20);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (4, 7, 80);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (21, 7, 40);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (18, 7, 50);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (20, 7, 1);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (16, 7, 20);

-- Paysanne
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (6, 8, 200);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (8, 8, 50);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (9, 8, 20);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (21, 8, 80);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (13, 8, 80);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (1, 8, 2);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (3, 8, 20);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (7, 8, 40);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (18, 8, 50);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (20, 8, 1);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (16, 8, 20);
INSERT INTO comprend (id_ingredient, id_focaccia, quantite) VALUES (14, 8, 50);