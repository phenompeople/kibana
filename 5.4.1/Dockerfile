#Base image
FROM centos:7.3.1611
MAINTAINER Rajesh Jonnalagadda "admin.squad@phenompeople.com"
LABEL Description="Kibana Docker image based on Centos 7" \
	  License="Apache License 2.0" \
	  Usage="docker run -td -p [HOST PORT NUMBER]:5601 -e ELASTICSEARCH_URL=[ELASTICSEARCH_URL:ELASTICSEARCH_PORT] -e KIBANA_INDEX=$USER -e SERVER_HOST=0.0.0.0"  \
	  Version="5.4.1" \
	  project="kibana"
ARG PACKAGE_VERSION=5.4.1
ENV container docker \
    PACKAGE_VERSION=${PACKAGE_VERSION}
EXPOSE 5601
ADD kibana.repo /etc/yum.repos.d/kibana.repo
RUN yum install -y -q kibana-${PACKAGE_VERSION}-1 && \
    mkdir -p /opt/kibana/logs && \
    touch /opt/kibana/logs/kibana.log && \
    rm -rf /etc/yum.repos.d/kibana.repo && \
    yum clean all

ADD setup /opt/kibana

ENTRYPOINT ["/opt/kibana/scripts/kibana.sh"]
