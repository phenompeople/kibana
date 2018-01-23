FROM phenompeople/centos-sunjre
LABEL maintainer="rajesh.jonnalagadda@phenompeople.com" \
	  version="6.1.2" \
	  project="kibana"
EXPOSE 5601
ARG KIBANA_VERSION=6.1.2
ENV container docker \
    PACKAGE_VERSION=${KIBANA_VERSION}
ARG APP_HOME=/usr/local/kibana
RUN groupadd -g 405 kibana && \
	useradd -u 405 -g 405 kibana && \
	wget -q -O /tmp/kibana.tar.gz https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz && \
	tar -xzf /tmp/kibana.tar.gz -C /usr/local && \
	ln -sf /usr/local/kibana-${KIBANA_VERSION}-linux-x86_64 ${APP_HOME} && \
	mkdir -p /var/log/kibana /etc/kibana && \
	chown -R kibana:kibana /usr/local/kibana-${KIBANA_VERSION}-linux-x86_64 && \
    	touch /var/log/kibana/kibana.log
COPY setup/config/kibana.yml /etc/kibana/kibana.yml
ADD setup/scripts /usr/local/kibana/
#USER kibana
ENTRYPOINT ["/usr/local/kibana/kibana.sh"]
