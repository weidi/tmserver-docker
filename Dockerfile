FROM alpine:latest

RUN mkdir /opt/tmserver

WORKDIR /opt/tmserver

COPY TrackmaniaServer_2011-02-21.zip /opt/tmserver
RUN apk update &&\
    apk add unzip &&\
	unzip TrackmaniaServer_2011-02-21.zip -d /opt/tmserver &&\
    rm TrackmaniaServer_2011-02-21.zip &&\
	rm TrackmaniaServer.exe
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

EXPOSE 5000/tcp
EXPOSE 2350/tcp
EXPOSE 2350/udp
EXPOSE 3450/tcp
EXPOSE 80/tcp

CMD ["/opt/tmserver/RunTrackmaniaServer.sh"]
