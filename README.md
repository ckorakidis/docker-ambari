# docker-ambari

Based on https://github.com/arturobayo/docker-ambari

# Build images
* cd utils
* ./build.sh

# Setup Services (Ambari)
* localhost:8080
* install remote cluster
* set
    - name
    - nodes:
        - namenode    
        - node01
        - node02
        - node03
        - resourcemanager
        - master
        - db
        - meta
        - admin
    - private key: _utils$>_`docker cp ambari-server:/root/.ssh/id_rsa .`

# Services

| Service | Node | [Ports](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.3/bk_reference/content/reference_chap2.html) |
| ------- | ---- | ----- |
| [HBase Region Server](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.3/bk_reference/content/hbase-ports.html) | node01 | 16030:16030  |
| [Data Node](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.3/bk_reference/content/hdfs-ports.html) | node01 | 50075:50075, 50475:50475 |
| [HBase Region Server](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.3/bk_reference/content/hbase-ports.html) | node02 | 16031:16030  |
| [Data Node](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.3/bk_reference/content/hdfs-ports.html) | node02 | 50076:50075, 50476:50475 |
| [HBase Region Server](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.3/bk_reference/content/hbase-ports.html) | node03 | 16032:16030  |
| [Data Node](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.3/bk_reference/content/hdfs-ports.html) | node03 | 50077:50075, 50477:50475 |
| Kafka Broker | master |  |
| [SNameNode](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.3/bk_reference/content/hdfs-ports.html) | master | 50090 |
| [Spark History Server](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.4/bk_spark-component-guide/content/configuring-shs.html) | master | 18080, 18081 |
| Zeppelin | master | 9995 |  |
| Activity Analyzer | meta |  |
| Activity Explorer | meta |  |
| [Atlas Metadata Server](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.3/bk_reference/content/atlas-ports.html) | meta | 21000, 21443 |
| [History Server](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.4/bk_reference/content/mapreduce-ports.html) | meta | 19888 |
| HST Server | meta | 9060, 9441 |
| [Grafana](https://hortonworks.com/tutorial/hortonworks-sandbox-guide/section/3/) | admin | 3000 |
| ZooKeeper Server | admin |  |
| Metrics Collector | admin | 6188 |
| Infra Solr Instance | namenode | 8886 |
| [NameNode](https://hortonworks.com/tutorial/hortonworks-sandbox-guide/section/3/) | namenode | 8082, 8086, 8090, 8091, [50070, 50470](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.3/bk_reference/content/hdfs-ports.html) |
| ZooKeeper Server | namenode |  |
| [ResourceManager](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.3/bk_reference/content/yarn-ports.html) | resourcemanager | 8088, 8025, 8030, 8141, 45454, 8042, 10200, 8188 |
| [App Timeline Server](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.3/bk_reference/content/yarn-ports.html) | resourcemanager | 10200, 8188, 8190 |
| ZooKeeper Server | resourcemanager |  |
| [WebHCat Server](https://hortonworks.com/tutorial/hortonworks-sandbox-guide/section/3/) | db | 50111 |
| [HBase Master](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.3/bk_reference/content/hbase-ports.html) | db | 16010  |
| Hive Metastore | db |  |
| HiveServer2 | db | [9999, 9083](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.3/bk_reference/content/hive-ports.html), [10001, 10502](https://hortonworks.com/tutorial/hortonworks-sandbox-guide/section/3/) |