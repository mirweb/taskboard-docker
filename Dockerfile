FROM ubuntu:14.10
MAINTAINER Mirko Weber <mirko.weber@gmail.com>

RUN apt-get update
RUN apt-get install -yq apache2 php5 php5-sqlite sqlite3
RUN a2enmod rewrite expires

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh
ADD etc/000-default.conf /etc/apache2/sites-available/000-default.conf

# Configure /app folder with sample app
RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html
ADD TaskBoard/ /app
RUN chmod 777 $(find /app -type d)

EXPOSE 80
WORKDIR /app
CMD ["/run.sh"]
