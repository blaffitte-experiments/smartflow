#!/bin/bash

# Nombre de commits à générer
NBR_COMMITS=10

# Array de messages de commit
commit_messages=(
    "Ajout de la fonctionnalité X"
    "Correction du bug Y"
    "Amélioration de la performance de Z"
    "Refactorisation du code"
    "Mise à jour de la documentation"
    "Nettoyage du code"
    "Ajout de tests unitaires"
    "Mise à jour des dépendances"
    "Correction des fautes de frappe"
    "Amélioration de l'interface utilisateur"
)

# Boucle pour générer les commits
for i in $(seq 1 $NBR_COMMITS)
do
    # Créer un fichier temporaire pour chaque commit
    touch "tempfile_$i.txt"
    git add .
    
    # Sélectionner un message de commit aléatoire
    commit_message=${commit_messages[$RANDOM % ${#commit_messages[@]}]}
    
    # Créer le commit
    git commit -m "$commit_message"
    git checkout -b "feature/tdb_mafeature$i" master
    
    echo "Commit $i: $commit_message"
done

echo "Génération de $NBR_COMMITS commits terminée."
