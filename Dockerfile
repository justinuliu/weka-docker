FROM nvidia/cuda:11.0-base
RUN apt-get update && apt-get install -y wget unzip firefox
RUN apt-get install -y nvidia-cuda-toolkit
RUN wget https://prdownloads.sourceforge.net/weka/weka-3-8-5-azul-zulu-linux.zip \
    && unzip weka-3-8-5-azul-zulu-linux.zip \
    && rm -rf /var/lib/apt/lists/* weka-3-8-5-azul-zulu-linux.zip
RUN mkdir -p ~/wekafiles/props
WORKDIR /tmp
RUN unzip /weka-3-8-5/weka.jar \
    && cp weka/experiment/DatabaseUtils.props.hsql ~/wekafiles/props/DatabaseUtils.props
WORKDIR /weka-3-8-5
RUN jre/*/bin/java -classpath ./weka.jar weka.core.WekaPackageManager -install-package wekaDeeplearning4j
RUN wget https://github.com/Waikato/wekaDeeplearning4j/releases/download/v1.7.1/install-cuda-libs.sh \
    && bash install-cuda-libs.sh
CMD jre/*/bin/java -classpath ./weka.jar:/jars/* weka.gui.GUIChooser
