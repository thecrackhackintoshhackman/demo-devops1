FROM nginx:alpine

# Supprimer le contenu par défaut de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copier TOUT ton projet (HTML/CSS/JS)
COPY . /usr/share/nginx/html/

EXPOSE 80
