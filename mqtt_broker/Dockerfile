FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y mosquitto mosquitto-clients python3 python3-pip && \
    pip3 install paho-mqtt

COPY mosquitto.conf /etc/mosquitto/

EXPOSE 1883

CMD /usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf
