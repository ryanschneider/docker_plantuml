FROM openjdk:18-slim-buster
MAINTAINER think@hotmail.de
ENV PLANTUML_VERSION=1.2021.9
ENV LANG en_US.UTF-8
RUN \
  apt-get update -y && apt-get install -y graphviz wget && \
  wget "http://downloads.sourceforge.net/project/plantuml/${PLANTUML_VERSION}/plantuml.${PLANTUML_VERSION}.jar" -O plantuml.jar
RUN ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar", "-version"]
RUN ["dot", "-version"]
ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar", "-p"]
CMD ["-tsvg"]
