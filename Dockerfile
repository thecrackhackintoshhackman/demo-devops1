# Utilise l'image officielle Nginx
FROM nginx:alpine

# Copie tous les fichiers du site dans le dossier de Nginx
COPY . /usr/share/nginx/html

# Expose le port 80 pour accéder au site
EXPOSE 80
