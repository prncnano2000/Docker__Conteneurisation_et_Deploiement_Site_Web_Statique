#!/bin/bash
# test.sh - Tests de validation

set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

BASE_URL="http://localhost:8080"

echo -e "${YELLOW}🧪 Exécution des tests...${NC}"

# Test 1: Le site répond
if curl -f -s "${BASE_URL}" > /dev/null; then
    echo -e "${GREEN}✓ Test 1: Site accessible${NC}"
else
    echo -e "${RED}✗ Test 1: Site inaccessible${NC}"
    exit 1
fi

# Test 2: Health check
if curl -f -s "${BASE_URL}/health" | grep -q "healthy"; then
    echo -e "${GREEN}✓ Test 2: Health check OK${NC}"
else
    echo -e "${RED}✗ Test 2: Health check échoué${NC}"
    exit 1
fi

# Test 3: Vérifier les headers de sécurité
HEADERS=$(curl -s -I "${BASE_URL}")

if echo "$HEADERS" | grep -q "X-Frame-Options"; then
    echo -e "${GREEN}✓ Test 3: Headers de sécurité présents${NC}"
else
    echo -e "${RED}✗ Test 3: Headers de sécurité manquants${NC}"
    exit 1
fi

# Test 4: Compression Gzip
if curl -s -H "Accept-Encoding: gzip" -I "${BASE_URL}" | grep -q "Content-Encoding: gzip"; then
    echo -e "${GREEN}✓ Test 4: Compression Gzip activée${NC}"
else
    echo -e "${YELLOW}⚠ Test 4: Compression Gzip non détectée${NC}"
fi

echo -e "${GREEN}✓ Tous les tests sont passés!${NC}"