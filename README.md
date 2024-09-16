# Gestion des Secrets dans les Pipelines CI/CD

Ce projet met en œuvre la gestion sécurisée des secrets dans les pipelines CI/CD en utilisant HashiCorp Vault, GitHub Actions et Kubernetes. Il vous guide dans l'intégration, la rotation automatique des secrets et la vérification pour éviter les fuites de secrets dans les logs ou le code source.

## Structure du Projet

- **.github/workflows/** : Contient les workflows GitHub Actions pour CI/CD.
- **k8s/** : Contient les fichiers de configuration Kubernetes pour le déploiement de l'application.
- **scripts/** : Contient les scripts pour la rotation des secrets et le déploiement.

## Prérequis

- [HashiCorp Vault](https://www.vaultproject.io/) : Pour la gestion des secrets.
- [GitHub Actions](https://docs.github.com/en/actions) : Pour l'intégration et le déploiement continus.
- [Kubernetes](https://kubernetes.io/) : Pour l'orchestration des conteneurs.
- [Kubectl](https://kubernetes.io/docs/tasks/tools/) : L'outil en ligne de commande pour interagir avec Kubernetes.

## Installation

### 1. Configurer HashiCorp Vault

1. Installez et configurez [HashiCorp Vault](https://www.vaultproject.io/docs/install).
2. Stockez vos secrets dans Vault en utilisant les commandes suivantes :
   ```
   vault kv put kv/my-secret-path secret-key=your-secret-value
   ```

### 2. Configurer GitHub Actions

Ajoutez les secrets nécessaires à GitHub Actions sous les paramètres du dépôt (Settings > Secrets and variables > Actions). Les secrets doivent inclure les informations nécessaires pour accéder à HashiCorp Vault.
Configurez les workflows CI/CD en modifiant les fichiers .github/workflows/ci.yml et .github/workflows/cd.yml selon vos besoins.

### 3. Configurer Kubernetes
Assurez-vous que votre cluster Kubernetes est opérationnel.
Déployez votre application en utilisant les fichiers de configuration dans k8s/ :
   ```
   kubectl apply -f k8s/deployment.yaml
   ```
## Utilisation
Rotation des Secrets
Pour faire tourner les secrets dans HashiCorp Vault, utilisez le script suivant :

   ``` 
   scripts/rotate_secrets.sh
   ```
Ce script mettra à jour les secrets dans Vault.

## Déploiement
Pour déployer ou mettre à jour l'application sur Kubernetes, utilisez le script suivant :

   ```
   scripts/deploy.sh
   ```
Ce script appliquera les configurations Kubernetes et déploiera l'application.

## Sécurité
Évitez d'exposer les secrets : Assurez-vous que vos secrets ne sont pas inclus dans les logs ou dans le code source.
Rotation des secrets : Configurez la rotation automatique des secrets dans HashiCorp Vault pour éviter les fuites.

## Contribuer
Si vous souhaitez contribuer à ce projet, veuillez suivre les étapes suivantes :

1. Forkez le dépôt.
2. Créez une branche pour votre fonctionnalité ou correction de bogue (git checkout -b feature-branch).
3. Commitez vos modifications (git commit -am 'Add new feature').
4. Poussez la branche (git push origin feature-branch).
5. Ouvrez une Pull Request.
