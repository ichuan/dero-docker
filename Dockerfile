FROM ubuntu:18.04

WORKDIR /opt
VOLUME /opt/coin

# daemon, wallet
EXPOSE 20209 20206

RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/deroproject/derosuite/releases/download/Version_P2P_bug_fix/dero_linux_amd64_2.2.1-0.Atlantis.Astrobwt+03072020.tar.gz -O - | tar --strip-components 2 -C /opt/ -xzf -

# cleanup
RUN rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
