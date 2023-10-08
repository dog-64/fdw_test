echo 5m benchmark

echo Benchmark For ActorsFdw
 
sudo pg_ctlcluster 14 main restart
pgbench -U postgres -f actors_fdw_table_select.sql -c 10 -T 300 fdw_test

pgbench -U postgres -f actors_table_select.sql -c 10 -T 300 imdb
