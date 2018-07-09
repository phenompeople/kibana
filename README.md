[![Docker Automated build](https://img.shields.io/docker/automated/phenompeople/kibana.svg?style=plastic)](https://hub.docker.com/r/phenompeople/kibana/)
[![Docker Build Status](https://img.shields.io/docker/build/phenompeople/kibana.svg?style=plastic)](https://hub.docker.com/r/phenompeople/kibana/)
[![Docker Pulls](https://img.shields.io/docker/pulls/phenompeople/kibana.svg?style=plastic)](https://hub.docker.com/r/phenompeople/kibana/)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Kibana 

Dockerfiles for building Centos based Kibana images. 

### Supported tags and respective Dockerfile links

#### phenompeople/kibana

* **`latest`		([6.3.0/Dockerfile](https://bitbucket.org/phenompeople/kibana/src/master/6.3.0/Dockerfile))**
* **`6.3.0` 		([6.3.0/Dockerfile](https://bitbucket.org/phenompeople/kibana/src/master/6.3.0/Dockerfile))**
* **`5.6.9` 		([5.6.9/Dockerfile](https://bitbucket.org/phenompeople/kibana/src/master/5.6.9/Dockerfile))**
* **`5.1.2` 		([5.1.2/Dockerfile](https://bitbucket.org/phenompeople/kibana/src/master/5.1.2/Dockerfile))**

#### Pre-Requisites

- install docker-engine [https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/)

#### Whats New?

Latest Image is having Logtrail plugin which helps to have live log viewer. LogTrail is a plugin for Kibana to view, analyze, search and tail log events from multiple hosts in realtime with devops friendly interface inspired by Papertrail. 

### How to use this image 

1.  This image can be used by simply running 

```$ docker run --name=kibana -p 5601:5601 -td phenompeople/kibana```

Above command runs kibana container with port 5601 mapped to host and connecting to elasticsearch running at http://localhost:9200 and kibana index mapped to `.kibana`. 

1. To make image run even after reboot use extra option --restart=always

```$ docker run --restart=always --name=kibana -p 5601:5601 -td phenompeople/kibana```

1. Please define below variables during run time to replace default values, variables defined during run time will take the highest priority, each variable should be passed differently with option -e 

|Attribute name        | Default Value            |
|----------------------|--------------------------|
|ELASTICSEARCH_URL     | htpp://localhost:9200    |
|KIBANA_INDEX          | .kibana                  |
|SERVER_HOST           | localhost                |
|ES_REQUEST_TIMEOUT		  | 60000									  | 

For example

```$ docker run --restart=always --name kibana -p 5601:5601 -e ELASTICSEARCH_URL="http://<ES FQDN/IP ADDRESS>:9200" -e SERVER_HOST="0.0.0.0" -e KIBANA_INDEX="$USER" -td phenompeople/kibana```

1. ES Cluster if protected with credentials add below additional variables  with option -e 

|Attribute name       | Default Value    |
|---------------------|------------------|
|ES_USERNAME          | USERNAME         |
|ES_PASSEWORD         | PASSWORD         |

**Note:** These two variables are optional and commented out by default

For example

```$ docker run --restart=always --name kibana -p 5601:5601 -e ELASTICSEARCH_URL="http://<ES FQDN/IP ADDRESS>:9200" -e ES_USERNAME="admin" -e ES_PASSWORD="password" -e SERVER_HOST="0.0.0.0" -e KIBANA_INDEX="$USER" -td phenompeople/kibana```

## Maintainers

* Rajesh Jonnalagadda (<rajesh.jonnalagadda@phenompeople.com>)

## License and Authors

**License:**	Apache License

**Author :** Phenompeople Pvt Ltd (<admin.squad@phenompeople.com>)