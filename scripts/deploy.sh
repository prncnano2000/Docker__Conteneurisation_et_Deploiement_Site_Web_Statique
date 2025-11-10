#!/bin/bash
# deploy.sh - Script de déploiement

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}🚀 Déploiement du site web...${NC}"

# Arrêter et supprimer les anciens conteneurs
docker compose down

# Démarrer les services
docker compose up -d

# Attendre que le service soit prêt
echo -e "${YELLOW}⏳ Attente du démarrage du service...${NC}"
sleep 10

# Vérifier si le conteneur est en cours d'exécution
if ! docker ps | grep -q static-website; then
    echo -e "${RED}✗ Le conteneur n'est pas en cours d'exécution${NC}"
    echo -e "${YELLOW}Logs du conteneur :${NC}"
    docker logs static-website
    exit 1
fi

# Vérifier l'accessibilité du site
if curl -s -f http://localhost:8080 > /dev/null; then
    echo -e "${GREEN}✓ Déploiement réussi!${NC}"
    echo -e "${GREEN}🌐 Site accessible sur: http://localhost:8080${NC}"
else
    echo -e "${RED}✗ Le site web n'est pas accessible${NC}"
    echo -e "${YELLOW}Logs du conteneur :${NC}"
    docker logs static-website
    exit 1
fi