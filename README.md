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

## Exemple de pipeline

```groovy
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                script {
                    def branchName = env.BRANCH_NAME
                    if (branchName.startsWith('tbd-feature/') || branchName.startsWith('gf-feature/')) {
                        echo "Feature branch detected: ${branchName}"
                        checkout scm
                    } else if (branchName.startsWith('tbd-release/') || branchName.startsWith('gf-release/')) {
                        echo "Release branch detected: ${branchName}"
                        checkout scm
                    } else if (branchName == 'master') {
                        echo "Master branch detected: ${branchName}"
                        checkout scm
                    } else if (branchName.startsWith('project/')) {
                        echo "Project branch detected: ${branchName}"
                        checkout scm
                    } else {
                        error "Unknown branch type: ${branchName}"
                    }
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    def branchName = env.BRANCH_NAME
                    if (branchName.startsWith('tbd-feature/') || branchName.startsWith('gf-feature/')) {
                        echo "Building feature branch: ${branchName}"
                        // Ajoutez vos étapes de build pour les branches feature ici
                    } else if (branchName.startsWith('tbd-release/') || branchName.startsWith('gf-release/')) {
                        echo "Building release branch: ${branchName}"
                        // Ajoutez vos étapes de build pour les branches release ici
                    } else if (branchName == 'master') {
                        echo "Building master branch: ${branchName}"
                        // Ajoutez vos étapes de build pour la branche master ici
                    } else if (branchName.startsWith('project/')) {
                        echo "Building project branch: ${branchName}"
                        // Ajoutez vos étapes de build pour les branches project ici
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    def branchName = env.BRANCH_NAME
                    if (branchName.startsWith('tbd-feature/') || branchName.startsWith('gf-feature/')) {
                        echo "Testing feature branch: ${branchName}"
                        // Ajoutez vos étapes de test pour les branches feature ici
                    } else if (branchName.startsWith('tbd-release/') || branchName.startsWith('gf-release/')) {
                        echo "Testing release branch: ${branchName}"
                        // Ajoutez vos étapes de test pour les branches release ici
                    } else if (branchName == 'master') {
                        echo "Testing master branch: ${branchName}"
                        // Ajoutez vos étapes de test pour la branche master ici
                    } else if (branchName.startsWith('project/')) {
                        echo "Testing project branch: ${branchName}"
                        // Ajoutez vos étapes de test pour les branches project ici
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    def branchName = env.BRANCH_NAME
                    if (branchName.startsWith('tbd-release/') || branchName.startsWith('gf-release/') || branchName == 'master') {
                        echo "Deploying release or master branch: ${branchName}"
                        // Ajoutez vos étapes de déploiement pour les branches release et master ici
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline terminé!'
        }
        success {
            echo 'Pipeline réussi!'
        }
        failure {
            echo 'Pipeline échoué.'
        }
    }
}
```
