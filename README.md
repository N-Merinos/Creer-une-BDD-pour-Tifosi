# Base de données Tifosi — MySQL

Base de données pour le restaurant de street-food italien **Tifosi**, conçue à partir du modèle conceptuel de données (MCD) fourni, gérant les focaccias, ingrédients, boissons et marques.

## Contenu du dépôt

| Fichier | Rôle |
|---|---|
| `01_setup.sql` | Création de la base `tifosi` et de l'utilisateur dédié `tifosi` |
| `02_schema.sql` | Création du schéma des 9 tables avec contraintes d'intégrité |
| `03_seed.sql` | Peuplement de la base avec les données de test |
| `04_queries.sql` | Les 10 requêtes de test demandées dans le brief |

## Modèle de données

À partir du MCD fourni, 9 tables ont été créées :

- **Entités** : `ingredient`, `marque`, `client`, `focaccia`, `menu`, `boisson`
- **Tables de jonction** (associations n,n) : `comprend` (ingredient ↔ focaccia), `achete` (client ↔ menu), `contient` (menu ↔ boisson)

Contraintes de sécurité appliquées : clés primaires/étrangères, `NOT NULL` sur les champs obligatoires, `UNIQUE` sur les noms et emails, `CHECK` sur les prix et quantités (> 0).

## Résultats des requêtes de test

### 1. Liste des noms des focaccias par ordre alphabétique croissant

```sql
SELECT nom FROM focaccia ORDER BY nom ASC;
```

**Résultat attendu / obtenu** : Américaine, Emmentalaccia, Gorgonzollaccia, Hawaienne, Mozaccia, Paysanne, Raclaccia, Tradizione (8 lignes)

**Écart** : aucun.

---

### 2. Nombre total d'ingrédients

```sql
SELECT COUNT(*) AS nombre_total_ingredients FROM ingredient;
```

**Résultat attendu / obtenu** : 25

**Écart** : aucun.

---

### 3. Prix moyen des focaccias

```sql
SELECT ROUND(AVG(prix), 2) AS prix_moyen FROM focaccia;
```

**Résultat attendu / obtenu** : 10.38 €

**Écart** : aucun.

---

### 4. Liste des boissons avec leur marque, triée par nom de boisson

```sql
SELECT b.nom AS boisson, m.nom AS marque
FROM boisson b
INNER JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom ASC;
```

**Résultat attendu / obtenu** : 12 lignes, de "Capri-sun" (Coca-cola) à "Pepsi Max Zéro" (Pepsico)

**Écart** : aucun.

---

### 5. Liste des ingrédients pour une Raclaccia

```sql
SELECT i.nom AS ingredient, c.quantite
FROM comprend c
INNER JOIN ingredient i ON c.id_ingredient = i.id_ingredient
INNER JOIN focaccia f ON c.id_focaccia = f.id_focaccia
WHERE f.nom = 'Raclaccia';
```

**Résultat attendu / obtenu** : Base Tomate, Raclette, Cresson, Ail, Champignon, Parmesan, Poivre (7 lignes)

**Écart** : aucun.

---

### 6. Nom et nombre d'ingrédients pour chaque focaccia

```sql
SELECT f.nom AS focaccia, COUNT(c.id_ingredient) AS nombre_ingredients
FROM focaccia f
INNER JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY f.nom;
```

**Résultat attendu / obtenu** :

| Focaccia | Nb ingrédients |
|---|---|
| Américaine | 8 |
| Emmentalaccia | 7 |
| Gorgonzollaccia | 8 |
| Hawaienne | 9 |
| Mozaccia | 10 |
| Paysanne | 12 |
| Raclaccia | 7 |
| Tradizione | 9 |

**Écart** : aucun.

---

### 7. Focaccia qui a le plus d'ingrédients

```sql
SELECT f.nom AS focaccia, COUNT(c.id_ingredient) AS nombre_ingredients
FROM focaccia f
INNER JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY nombre_ingredients DESC
LIMIT 1;
```

**Résultat attendu / obtenu** : Paysanne (12 ingrédients)

**Écart** : aucun.

---

### 8. Focaccias qui contiennent de l'ail

```sql
SELECT DISTINCT f.nom AS focaccia
FROM focaccia f
INNER JOIN comprend c ON f.id_focaccia = c.id_focaccia
INNER JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE i.nom = 'Ail';
```

**Résultat attendu / obtenu** : Mozaccia, Gorgonzollaccia, Raclaccia, Paysanne (4 lignes)

**Écart** : aucun.

---

### 9. Liste des ingrédients inutilisés

```sql
SELECT nom FROM ingredient
WHERE id_ingredient NOT IN (SELECT DISTINCT id_ingredient FROM comprend);
```

**Résultat attendu / obtenu** : Salami, Tomate cerise (2 lignes)

**Écart** : aucun.

---

### 10. Focaccias qui n'ont pas de champignons

```sql
SELECT nom FROM focaccia
WHERE id_focaccia NOT IN (
    SELECT c.id_focaccia
    FROM comprend c
    INNER JOIN ingredient i ON c.id_ingredient = i.id_ingredient
    WHERE i.nom = 'Champignon'
);
```

**Résultat attendu / obtenu** : Américaine, Hawaienne (2 lignes)

**Écart** : aucun.

---

## Notes techniques

- **Encodage** : la base utilise `utf8mb4` pour gérer correctement les accents. Pour exécuter les scripts sans corruption des caractères spéciaux, se connecter avec :
  ```
  mysql -u root -p --default-character-set=utf8mb4 tifosi
  ```
  puis utiliser `source nom_du_fichier.sql;` depuis le client MySQL (éviter les pipes PowerShell type `Get-Content | mysql`, qui peuvent altérer l'encodage des caractères accentués selon la configuration de la console).
