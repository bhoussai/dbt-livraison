# livraison_dbt — projet d'apprentissage dbt (certification Analytics Engineering, dbt Core 1.11)

Société de livraison fictive. Pile : dbt Core 1.11 + DuckDB.

## Démarrage (GitHub Codespaces)
1. Crée un dépôt GitHub (privé ou public), pousse ce dossier dedans.
2. Bouton vert **Code > Codespaces > Create codespace on main**.
3. Attends la fin de l'installation, puis dans le terminal :
   ```
   dbt debug --profiles-dir .
   dbt run --profiles-dir .
   ```
   (Astuce : `export DBT_PROFILES_DIR=.` pour ne plus taper `--profiles-dir .`)

## Régénérer les données brutes
`python scripts/generate_data.py`
