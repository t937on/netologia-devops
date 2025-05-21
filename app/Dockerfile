FROM nginx:1.28.0
RUN rm -rf /usr/share/nginx/html
COPY content/ /usr/share/nginx/html/
RUN chmod -R a+rX /usr/share/nginx/html 
EXPOSE 80
