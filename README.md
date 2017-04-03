# Postgresql 9.6.2 - Postgis 2.3.3 dev - Alpine Docker

```docker
docker build -t minhcuong/postgis .
```

Then run it
```docker
docker run -p 127.0.0.1:5432:5432 --name gis -e POSTGRES_PASSWORD=abc -d -t minhcuong/postgis
```

See this instruction for more
[Install postgis](http://postgis.net/docs/manual-3.3/postgis_installation.html#install_getting_source)
