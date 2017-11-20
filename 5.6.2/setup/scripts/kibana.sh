#!/usr/bin/env bash
set -o nounset # Treat unset variables as an error
ELASTICSEARCH_URL=${ELASTICSEARCH_URL:-http://localhost:9200}
KIBANA_INDEX=${KIBANA_INDEX:-.kibana}
SERVER_HOST=${SERVER_HOST:-localhost}
ES_REQUEST_TIMEOUT=${ES_REQUEST_TIMEOUT:-60000}
sed -ri "s|^(\\#\\s*)?(elasticsearch.url:).*|\\2 '$ELASTICSEARCH_URL'|; \
                s|^(\\#\\s*)?(server.host:).*|\\2 '$SERVER_HOST'|; \
                s|^(\\#\\s*)?(elasticsearch.requestTimeout:).*|\\2 '$ES_REQUEST_TIMEOUT'|; \
                s|^(\\#\\s*)?(kibana.index:).*|\\2 '$KIBANA_INDEX'|; " /opt/kibana/config/kibana.yml
exec su -l kibana -s /bin/bash -c "/usr/share/kibana/bin/kibana -c /opt/kibana/config/kibana.yml" > /opt/kibana/logs/kibana.log