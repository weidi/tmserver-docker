FROM alpine:latest

RUN mkdir /opt/tmserver

WORKDIR /opt/tmserver

COPY TrackmaniaServer/ /opt/tmserver/
COPY custom_game_settings.txt /opt/tmserver/GameData/Tracks/MatchSettings/
COPY RunTrackmaniaServer.sh /opt/tmserver/

ARG SERVER_NAME='Trackmania Server'
ARG SERVER_DESC='This is a Trackmania Server'
ARG SERVER_SA_PASSWORD='SuperAdmin'
ARG SERVER_ADM_PASSWORD='Admin'
ENV SERVER_NAME $SERVER_NAME
ENV SERVER_DESC $SERVER_DESC
ENV SERVER_SA_PASSWORD $SERVER_SA_PASSWORD
ENV SERVER_ADM_PASSWORD $SERVER_ADM_PASSWORD

VOLUME /opt/tmserver/GameData/Tracks

EXPOSE 5000 2350 3450
EXPOSE 2350/udp


CMD ["/opt/tmserver/RunTrackmaniaServer.sh"]
