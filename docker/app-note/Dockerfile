FROM oydeu/oyd-shiny:latest
MAINTAINER "Christoph Fabianek" christoph@ownyourdata.eu

RUN cd /srv/shiny-server \
        && rm -rf * \
        && git clone https://github.com/OwnYourData/app-note.git \ 
        && mv app-note/* . \
        && rm -r app-note \
        && R -e "source('init.R')"

EXPOSE 3838

CMD ["/usr/bin/shiny-server.sh"]
