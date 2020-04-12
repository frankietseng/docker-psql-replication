# Postgresql Replication in Docker

使用Docker建立Postgresql主從。
# Getting Started
#### 1. 製作Master及Slave Image
```sh
docker build -t 
```

# Running
#### 1. 啟動Master
```
docker run -d --name psql-master -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=mypassword POSTGRES_DB=mydb psql-master
```
#### 2. 啟動Slave
```sh
docker run -d --name psql-slave -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=mypassword psql-slave
```

