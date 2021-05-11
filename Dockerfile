FROM ubuntu:latest
RUN apt-get update && apt-get install -y wget unzip firefox
RUN wget https://prdownloads.sourceforge.net/weka/weka-3-8-5-azul-zulu-linux.zip \
    && unzip weka-3-8-5-azul-zulu-linux.zip \
    && rm -rf /var/lib/apt/lists/* weka-3-8-5-azul-zulu-linux.zip
CMD ["weka-3-8-5/weka.sh"]
