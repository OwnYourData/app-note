FROM oydeu/oyd-shiny:latest
MAINTAINER "Christoph Fabianek" christoph@ownyourdata.eu

RUN apt-get -y update \
  && apt-get install -y --no-install-recommends libv8-3.14-dev libsodium-dev \
  && rm -rf /var/lib/apt/lists/*


RUN cd /srv/shiny-server \
        && rm -rf * \
        && git clone https://github.com/OwnYourData/app-note.git \ 
        && mv app-note/* . \
        && rm -r app-note \
        && R -e "source('init.R')"

EXPOSE 3838

CMD ["/usr/bin/shiny-server.sh"]
