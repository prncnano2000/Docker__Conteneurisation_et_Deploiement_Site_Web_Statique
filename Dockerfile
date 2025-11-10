# Dockerfile - Image pour le site web statique
FROM nginx:alpine

# Installer des outils de développement
RUN apk add --no-cache \
    curl \
    vim \
    bash \
    && rm -rf /var/cache/apk/*

# Créer les répertoires nécessaires avec les bonnes permissions
RUN mkdir -p /var/cache/nginx \
    /var/log/nginx \
    /var/lib/nginx \
    /var/run/nginx \
    && chown -R nginx:nginx /var/cache/nginx \
    /var/log/nginx \
    /var/lib/nginx \
    /var/run/nginx \
    && chmod -R 755 /var/cache/nginx \
    /var/log/nginx \
    /var/lib/nginx \
    /var/run/nginx

# Copier les fichiers du site web
COPY website/ /usr/share/nginx/html/

# Configuration Nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# S'assurer que les fichiers du site ont les bonnes permissions
RUN chown -R nginx:nginx /usr/share/nginx/html \
    && chmod -R 755 /usr/share/nginx/html

# Le code sera monté via volume en développement
WORKDIR /usr/share/nginx/html

# Exposer le port 80 (port par défaut de nginx)
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]