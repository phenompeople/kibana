FROM amazonlinux:2
LABEL maintainer="rajesh.jonnalagadda@phenompeople.com" \
	  version="7.2.0" \
	  project="kibana"
EXPOSE 5601
ARG KIBANA_VERSION=7.2.0
ENV container docker \
    PACKAGE_VERSION=${KIBANA_VERSION}
ARG APP_HOME=/usr/local/kibana
RUN yum install -y -q util-linux wget shadow-utils tar gzip&& \
	groupadd -g 405 kibana && \
	useradd -u 405 -g 405 kibana && \
	wget -q -O /tmp/kibana.tar.gz https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz && \
	tar -xzf /tmp/kibana.tar.gz -C /usr/local && \
	ln -sf /usr/local/kibana-${KIBANA_VERSION}-linux-x86_64 ${APP_HOME} && \
	mkdir -p /var/log/kibana /etc/kibana && \
	rm -rf /tmp/kibana.tar.gz && \
    touch /var/log/kibana/kibana.log 
COPY setup/config/kibana.yml /etc/kibana/kibana.yml
ADD setup/scripts /usr/local/kibana/
RUN chown -R kibana:kibana /usr/local/kibana-${KIBANA_VERSION}-linux-x86_64 /var/log/kibana /etc/kibana
ENTRYPOINT ["/usr/local/kibana/kibana.sh"]
