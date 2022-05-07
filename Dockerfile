#stage setop mongodb
FROM mongo:latest


#stage setop jdk jre
RUN apt-get update && apt-get  install -y openjdk-11-jre

#stage sperviser
RUN  apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

#stage node js and angular
RUN apt-get install curl
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get -y install nodejs 

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY . .

COPY mongo-seed /mongo-seed

RUN chmod +x /import.sh


RUN chmod +x /run.sh
RUN chmod +x /run_2.sh
RUN chmod +x /run_3.sh
RUN chmod +x /run_4.sh
RUN chmod +x /run_5.sh
RUN chmod +x /run_6.sh
RUN chmod +x /run_7.sh
RUN chmod +x /run_8.sh
RUN chmod +x /npm.sh


RUN npm install -g @angular/cli --registry=https://registry.npmjs.org

EXPOSE 27017 4200 9191

CMD ["/usr/bin/supervisord"]
