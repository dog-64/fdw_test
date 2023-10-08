# fdw_test

Тестирование Postgres FDW

## Вывод 

- Замедление где-то на порядок.
- Можно ускорить при помощи Mat.View.
- При работе по сети еще медленнее будет 

## Условия

- Postgres 14.9
- Ubuntu 22.04.2
- Pgbench (14.9 (Ubuntu 14.9-0ubuntu0.22.04.1))

## Создание БД

В create.sql

## Benchmark

Подготовка /единожды

```shell
pgbench -U postgres -i -s 10 fdw_test
```

Запуск

```shell
./benchmark_5m.sh
```

[v1.sql](v1.sql)

## Результат

| Kind      | Tps  | Tps  | Tps  |
|-----------|------|------|------|
| Fdw Table | 727  | 752  | 762  |     
| Table     | 6965 | 7081 | 7139 |     

Обе таблицы режат на одном хосте.
Но в разных БД.
И fdw-доступ идет не по socket, а по tcp.

