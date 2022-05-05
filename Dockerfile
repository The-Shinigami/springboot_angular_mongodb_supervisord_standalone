#stage setop mongodb
FROM mongo:latest


#stage setop jdk jre
RUN apt-get update && apt-get  install -y openjdk-11-jre

#stage sperviser
RUN  apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

#stage node js 
RUN apt-get install curl
RUN curl -sL https://deb.nodesource.com/setup_13.x 
RUN apt-get -y install nodejs npm

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY  /service-registry.jar micro_services/app/
COPY  /cloud-gatway.jar micro_services/app/
COPY  /gest-contracts-finale.jar micro_services/app/
COPY  /gest-ownership.jar micro_services/app/
COPY  /gest-proprety.jar micro_services/app/
COPY  /gest-user.jar micro_services/app/
COPY  /token_test.jar micro_services/app/
COPY  /gest-complaints.jar micro_services/app/

COPY mongo-seed /mongo-seed

COPY import.sh /
RUN chmod +x /import.sh
COPY run.sh /
COPY run_2.sh /
COPY run_3.sh /
COPY run_4.sh /
COPY run_5.sh /
COPY run_6.sh /
COPY run_7.sh /
COPY run_8.sh /

RUN chmod +x /run.sh
RUN chmod +x /run_2.sh
RUN chmod +x /run_3.sh
RUN chmod +x /run_4.sh
RUN chmod +x /run_5.sh
RUN chmod +x /run_6.sh
RUN chmod +x /run_7.sh
RUN chmod +x /run_8.sh

COPY /angular/package.json /angular
RUN npm i -f /angular
COPY . .


EXPOSE 27017 9191

CMD ["/usr/bin/supervisord"]
