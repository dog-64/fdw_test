-- Заполнение БД тестовыми данными 

DROP TABLE IF EXISTS fwd_test;

CREATE EXTENSION IF NOT EXISTS postgres_fdw;

CREATE SERVER imdb_server
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (host 'localhost', port '5432', dbname 'imdb');

DROP USER MAPPING FOR postgres
    SERVER imdb_server;

CREATE USER MAPPING FOR postgres
    SERVER imdb_server
    OPTIONS (user 'postgres', password 'grace-beagle-SHAVE');

CREATE FOREIGN TABLE actors_fdw (
    name text,
    height text,
    imdb_id integer,
    roles jsonb,
    kind text,
    random_order bigint
    )
    SERVER imdb_server
    OPTIONS (schema_name 'public', table_name 'actors');

SELECT * FROM actors_fdw;
