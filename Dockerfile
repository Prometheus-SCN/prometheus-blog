FROM iserko/docker-ubuntu-locale

RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl python build-essential git ca-certificates
RUN mkdir /nodejs && curl https://nodejs.org/dist/v0.10.40/node-v0.10.40-linux-x64.tar.gz | tar xvzf - -C /nodejs --strip-components=1

ENV PATH $PATH:/nodejs/bin

RUN git clone https://github.com/Prometheus-SCN/prometheus-blog
WORKDIR prometheus-blog
CMD ./ghost-server.js
ENTRYPOINT ./ghost-server.js
EXPOSE 2368

