# Projet DevOps : Conteneurisation et Déploiement d'un Site Web Statique

## 📋 Description du Projet

Ce projet démontre la mise en place d'une solution complète de conteneurisation et de déploiement d'un site web statique utilisant Docker et Nginx. Il met en œuvre les meilleures pratiques DevOps en matière de configuration, de sécurité et de performance.

## 🎯 Objectifs du Projet

- Conteneurisation d'une application web statique
- Configuration optimisée de Nginx
- Mise en place de bonnes pratiques de sécurité
- Automatisation du déploiement
- Monitoring et health checks
- Tests automatisés

## 🛠️ Technologies Utilisées

- **Docker** : Conteneurisation de l'application
- **Nginx** : Serveur web haute performance
- **Shell Script** : Automatisation des processus
- **HTML/CSS et JS** : Site web statique
- **Docker Compose** : Orchestration basic des conteneurs

## 🏗️ Architecture du Projet

```plaintext
.
├── Dockerfile              # Configuration de l'image Docker
├── docker-compose.yml      # Orchestration des services
├── nginx.conf             # Configuration globale de Nginx
├── default.conf          # Configuration spécifique du site
├── scripts/
│   ├── build.sh          # Script de construction
│   ├── deploy.sh         # Script de déploiement
│   └── test.sh           # Tests automatisés
└── website/              # Contenu du site web statique
    ├── index.html
    ├── css/
    └── images/
```

## ✨ Fonctionnalités

### 🔒 Sécurité
- Headers de sécurité configurés
- Utilisateur non-root dans le conteneur
- Protection contre les fichiers cachés
- Désactivation des tokens du serveur

### ⚡ Performance
- Compression Gzip activée
- Cache optimisé pour les assets statiques
- Configuration fine des workers Nginx
- Optimisation des connexions

### 📊 Monitoring
- Endpoint de health check
- Logs structurés
- Métriques de conteneur
- Surveillance de l'état du service

## 🚀 Installation et Déploiement

### Prérequis
- Docker
- Docker Compose
- Bash
- trivy (optionnel)

### Installation
```bash
# Cloner le repository
git clone https://github.com/prncnano2000/Docker__Conteneurisation_et_Deploiement_Site_Web_Statique.git
cd Docker__Conteneurisation_et_Deploiement_Site_Web_Statique

# Rendre les scripts exécutables
chmod +x scripts/*.sh
```

### Construction
```bash
./scripts/build.sh
```

### Déploiement
```bash
./scripts/deploy.sh
```

### Tests
```bash
./scripts/test.sh
```

## 🔍 Tests et Validation

### Tests Automatisés
- Accessibilité du site
- Vérification du health check
- Validation des headers de sécurité
- Test de la compression Gzip

### Points de Vérification
- Configuration Nginx
- Sécurité des conteneurs
- Performance du site
- Gestion des logs

## 📊 Métriques et Performance

### Performances
- Taille de l'image : < 60MB
- Temps de démarrage : < 5s
- Disponibilité : 99.9%

### Optimisations
- Configuration Nginx optimisée
- Mise en cache efficace
- Compression des assets
- Gestion optimale des ressources

## 🛡️ Sécurité

### Mesures Implémentées
- Headers de sécurité HTTP
- Isolation des conteneurs
- Protection des fichiers sensibles

### Bonnes Pratiques
- Configuration sécurisée de Nginx
- Gestion des permissions
- Surveillance des vulnérabilités
- Mise à jour régulière des dépendances

## 📝 Maintenance et Surveillance

### Logs
- Logs d'accès et d'erreurs
- Format structuré
- Redirection vers stdout/stderr
- Rotation automatique

### Monitoring
- Health checks
- Métriques de conteneur
- Surveillance des performances
- Alertes automatisées

## 🤝 Contribution
Les contributions sont les bienvenues ! N'hésitez pas à :
1. Fork le projet
2. Créer une branche pour votre fonctionnalité
3. Commiter vos changements
4. Pousser vers la branche
5. Ouvrir une Pull Request

## 📜 Licence
Ce projet est sous licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus de détails.

## 👤 Auteur
**Noumabeu Moutacdie jordan**
- GitHub: [@prncnano2000](https://github.com/prncnano2000)

## 🙏 Remerciements
- La communauté Docker
- Les contributeurs du projet Nginx
- Tous ceux qui ont contribué au projet

---
⭐️ Si ce projet vous a été utile, n'hésitez pas à lui donner une étoile sur GitHub!