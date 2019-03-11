FROM debian:stretch
ENV DEBIAN_FRONTEND noninteractive
SHELL ["/bin/bash","--login", "-c"]
RUN apt-get update && apt-get install apt-utils -y
RUN apt-get dist-upgrade -y
RUN apt-get install nginx -y
ADD /site /site
ADD deployment /etc/nginx/sites-available/deployment
RUN ln -s /etc/nginx/sites-available/deployment /etc/nginx/sites-enabled/deployment
RUN rm /etc/nginx/sites-enabled/default
CMD ["nginx", "-g", "daemon off;"]