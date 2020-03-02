[![dockeri.co](http://dockeri.co/image/phenompeople/kibana)](https://registry.hub.docker.com/phenompeople/kibana)

## Kibana 

Dockerfiles for building Centos based Kibana images. 

### Supported tags and respective Dockerfile links

#### phenompeople/kibana

* **`latest`		([7.6.0/Dockerfile](https://github.com/phenompeople/kibana/blob/master/7.6.0/Dockerfile))**
* **`7.6.0`  		([7.6.0/Dockerfile](https://github.com/phenompeople/kibana/blob/master/7.6.0/Dockerfile))**
* **`7.2.0`			([7.2.0/Dockerfile](https://github.com/phenompeople/kibana/blob/master/7.2.0/Dockerfile))**
* **`6.5.0` 		([6.5.0/Dockerfile](https://github.com/phenompeople/kibana/blob/master/6.5.0/Dockerfile))**
* **`5.6.9` 		([5.6.9/Dockerfile](https://github.com/phenompeople/kibana/blob/master/5.6.9/Dockerfile))**

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
|ES_REQUEST_TIMEOUT	   | 60000					  |

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
* Harshavardhan Baddam (<harshavardhan.baddam@phenompeople.com>)

## License and Authors

**License:**	Apache License

**Author :** Phenompeople Pvt Ltd (<admin.squad@phenompeople.com>)