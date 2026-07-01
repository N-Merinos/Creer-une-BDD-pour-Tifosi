USE tifosi;

-- ============================================================
-- Requête 1 : Afficher la liste des noms des focaccias
--             par ordre alphabétique croissant
-- Résultat attendu : Américaine, Emmentalaccia, Gorgonzollaccia,
--   Hawaienne, Mozaccia, Paysanne, Raclaccia, Tradizione (8 lignes)
-- ============================================================
SELECT nom
FROM focaccia
ORDER BY nom ASC;


-- ============================================================
-- Requête 2 : Afficher le nombre total d'ingrédients
-- Résultat attendu : 25
-- ============================================================
SELECT COUNT(*) AS nombre_total_ingredients
FROM ingredient;


-- ============================================================
-- Requête 3 : Afficher le prix moyen des focaccias
-- Résultat attendu : 10.38 (moyenne des 8 prix, arrondie à 2 décimales)
-- ============================================================
SELECT ROUND(AVG(prix), 2) AS prix_moyen
FROM focaccia;


-- ============================================================
-- Requête 4 : Afficher la liste des boissons avec leur marque,
--             triée par nom de boisson
-- Résultat attendu : 12 lignes, de "Capri-sun" à "Pepsi Max Zéro"
-- ============================================================
SELECT b.nom AS boisson, m.nom AS marque
FROM boisson b
INNER JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom ASC;


-- ============================================================
-- Requête 5 : Afficher la liste des ingrédients pour une Raclaccia
-- Résultat attendu : Base Tomate, Raclette, Cresson, Ail,
--   Champignon, Parmesan, Poivre (7 lignes)
-- ============================================================
SELECT i.nom AS ingredient, c.quantite
FROM comprend c
INNER JOIN ingredient i ON c.id_ingredient = i.id_ingredient
INNER JOIN focaccia f ON c.id_focaccia = f.id_focaccia
WHERE f.nom = 'Raclaccia';


-- ============================================================
-- Requête 6 : Afficher le nom et le nombre d'ingrédients
--             pour chaque focaccia
-- Résultat attendu : Mozaccia:10, Gorgonzollaccia:8, Raclaccia:7,
--   Emmentalaccia:7, Tradizione:9, Hawaienne:9, Américaine:8,
--   Paysanne:12
-- ============================================================
SELECT f.nom AS focaccia, COUNT(c.id_ingredient) AS nombre_ingredients
FROM focaccia f
INNER JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY f.nom;


-- ============================================================
-- Requête 7 : Afficher le nom de la focaccia qui a
--             le plus d'ingrédients
-- Résultat attendu : Paysanne (12 ingrédients)
-- ============================================================
SELECT f.nom AS focaccia, COUNT(c.id_ingredient) AS nombre_ingredients
FROM focaccia f
INNER JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY nombre_ingredients DESC
LIMIT 1;


-- ============================================================
-- Requête 8 : Afficher la liste des focaccia qui contiennent
--             de l'ail
-- Résultat attendu : Mozaccia, Gorgonzollaccia, Raclaccia,
--   Paysanne (4 lignes)
-- ============================================================
SELECT DISTINCT f.nom AS focaccia
FROM focaccia f
INNER JOIN comprend c ON f.id_focaccia = c.id_focaccia
INNER JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE i.nom = 'Ail';


-- ============================================================
-- Requête 9 : Afficher la liste des ingrédients inutilisés
-- Résultat attendu : Salami, Tomate cerise (2 lignes)
-- ============================================================
SELECT nom
FROM ingredient
WHERE id_ingredient NOT IN (
    SELECT DISTINCT id_ingredient FROM comprend
);


-- ============================================================
-- Requête 10 : Afficher la liste des focaccia qui n'ont pas
--              de champignons
-- Résultat attendu : Hawaienne, Américaine (2 lignes)
-- ============================================================
SELECT nom
FROM focaccia
WHERE id_focaccia NOT IN (
    SELECT c.id_focaccia
    FROM comprend c
    INNER JOIN ingredient i ON c.id_ingredient = i.id_ingredient
    WHERE i.nom = 'Champignon'
);