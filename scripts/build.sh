#!/bin/bash
# build.sh - Script de construction de l'image Docker
set -e

# Couleurs
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

IMAGE_NAME="static-website"
IMAGE_TAG="${1:-latest}"

echo -e "${YELLOW}🔨 Construction de l'image Docker...${NC}"

# Construction de l'image
docker build -t "${IMAGE_NAME}:${IMAGE_TAG}" .

echo -e "${GREEN}✓ Image construite avec succès: ${IMAGE_NAME}:${IMAGE_TAG}${NC}"

# Afficher la taille de l'image
echo -e "${YELLOW}📦 Taille de l'image:${NC}"
docker images "${IMAGE_NAME}:${IMAGE_TAG}"

# Scanner les vulnérabilités (si Trivy est installé)
if command -v trivy &> /dev/null; then
    echo -e "${YELLOW}🔍 Scan de sécurité avec Trivy...${NC}"
    trivy image "${IMAGE_NAME}:${IMAGE_TAG}"
fi