FROM ubuntu:latest 
RUN  apt-get update && apt install -y git
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
  apt-get -y install default-jre-headless && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/FadhlounDaly/Debezium_CDC.git
RUN mkdir Debezium_CDC/conf
RUN mkdir Debezium_CDC/lib
RUN mkdir Debezium_CDC/data
RUN touch Debezium_CDC/data/offsets.dat
COPY conf Debezium_CDC/conf
COPY lib Debezium_CDC/lib
WORKDIR /Debezium_CDC/
ENTRYPOINT ["sh" , "run.sh"]