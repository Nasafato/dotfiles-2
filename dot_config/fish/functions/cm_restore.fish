function cm_restore
    PGPASSWORD=common_postgres psql -U common_postgres -h localhost -p 5433 --file="/Users/alangou/data/dumps/common.sql" common
end
