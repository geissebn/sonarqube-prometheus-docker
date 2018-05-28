FROM sonarqube:latest

RUN mkdir /usr/bin/jmx_exporter \
 && wget -O /usr/bin/jmx_exporter/jmx_prometheus_javaagent.jar https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.3.1/jmx_prometheus_javaagent-0.3.1.jar \
 # Export everything: https://github.com/prometheus/jmx_exporter#configuration
 && echo "{}" > /usr/bin/jmx_exporter/config.yaml

ENV SONARQUBE_WEB_JVM_OPTS=-javaagent:/usr/bin/jmx_exporter/jmx_prometheus_javaagent.jar=9100:/usr/bin/jmx_exporter/config.yaml
