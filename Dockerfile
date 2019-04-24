FROM ubuntu:18.04

WORKDIR /opt
VOLUME /opt/coin

# daemon, wallet
EXPOSE 20209 20206

RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/deroproject/derosuite/releases/download/v2.1.6-1/dero_linux_amd64_2.1.6-1.alpha.atlantis.07032019.tar.gz -O - | tar --strip-components 2 -C /opt/ -xzf -

# cleanup
RUN rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
