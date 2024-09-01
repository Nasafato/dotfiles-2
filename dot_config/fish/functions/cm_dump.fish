function cm_dump
    PGPASSWORD=common_postgres pg_dump --dbname=common --data-only --file="/Users/alangou/data/dumps/common.sql" --schema='public' -h localhost -p 5433 -U common_postgres
end
