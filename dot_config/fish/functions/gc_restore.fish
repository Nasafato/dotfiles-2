function gc_restore
    PGPASSWORD=postgres psql -U postgres -h localhost -p 5432 --file="/Users/alangou/data/dumps/goldcard.sql" goldcard
end
