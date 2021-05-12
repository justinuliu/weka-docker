FROM ubuntu:latest
RUN apt-get update && apt-get install -y wget unzip firefox
RUN wget https://prdownloads.sourceforge.net/weka/weka-3-8-5-azul-zulu-linux.zip \
    && unzip weka-3-8-5-azul-zulu-linux.zip \
    && rm -rf /var/lib/apt/lists/* weka-3-8-5-azul-zulu-linux.zip
RUN mkdir -p ~/wekafiles/props
WORKDIR /tmp
RUN unzip /weka-3-8-5/weka.jar \
    && cp weka/experiment/DatabaseUtils.props.hsql ~/wekafiles/props/DatabaseUtils.props
WORKDIR /weka-3-8-5
CMD jre/*/bin/java -classpath ./weka.jar:/jars/hsqldb.jar weka.gui.GUIChooser
