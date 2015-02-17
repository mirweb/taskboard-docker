FROM ubuntu:14.10
MAINTAINER Mirko Weber <mirko.weber@gmail.com>

RUN apt-get update
RUN apt-get install -yq apache2 php5 php5-sqlite sqlite
RUN a2enmod rewrite expires

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Configure /app folder with sample app
RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html
ADD TaskBoard-0.2.7/ /app

EXPOSE 80
WORKDIR /app
CMD ["/run.sh"]
