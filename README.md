# tbd-gf-model
## Points discutés
1. **Approche de l'utilisateur :**
   - Utilisation de branches `master` pour les versions de production
   - Branches `project/` issues de `master` pour le développement continu
   - Branches `feature/` pouvant partir de `master` (TBD) ou des `project/` (GitFlow)
   - Branches `release/` issues de `master` pour le TBD et des `project/` pour GitFlow
   - Fusions via Pull Requests

2. **Conseils apportés :**
   - Utiliser des conventions claires et une bonne documentation
   - Automatiser les tests et les déploiements
   - Maintenir une communication régulière au sein de l'équipe
   - Utiliser des drapeaux de fonctionnalité et des stratégies de merge appropriées
   - Créer des branches `hotfix/` pour les correctifs urgents

3. **Gestion des calendriers différents par branche `project/` :**
   - Synchronisation des calendriers avec des outils de gestion de projet
   - Automatisation via CI/CD
   - Équipes dédiées et utilisation d'outils de collaboration
   - Documentation claire et à jour

4. **Conventions de nommage suggérées :**
   - Branches TBD :
     - `tbd-feature/<nom-de-la-fonctionnalité>`
     - `tbd-release/<version>`
   - Branches GitFlow :
     - `gf-feature/<nom-de-la-fonctionnalité>`
     - `gf-release/<version>`

## Modèle de Branches Git
```plaintext
master
  |
  |------> hotfix/
  |
  |------> tbd-release/ (depuis master)
  |
  |------> tbd-feature/ (TBD depuis master)
  |
  |------> project/
             |
             |------> gf-feature/ (GitFlow depuis project/)
             |
             |------> gf-release/ (depuis project/)

```
### Explications des Branches :
**master** : Branche principale pour les versions en production.

**hotfix/** : Branches pour les correctifs urgents en production.

**tbd-release/** (depuis master) : Branches de pré-production pour intégrer les fonctionnalités prêtes à être déployées en production.

**tbd-feature/** (TBD depuis master) : Branches de développement de fonctionnalités issues directement de master.

**project/** : Branches de développement continu pour des projets spécifiques.

**gf-feature/** (GitFlow depuis project) : Branches de développement de fonctionnalités issues des branches project.

**gf-release/** (depuis project) : Branches de pré-production pour les projets spécifiques.

## Avantages du modèle
- Clarté et transparence des branches et des flux de travail
- Automatisation simplifiée pour les pipelines CI/CD
- Maintenance facilitée avec des conventions de nommage claires



