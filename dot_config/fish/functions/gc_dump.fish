function gc_dump
    PGPASSWORD=postgres pg_dump \
    --dbname=goldcard \
    --data-only \
    --file="/Users/alangou/data/dumps/goldcard.sql" \
    --schema='public' \
    -h localhost \
    -p 5432 \
    -U postgres
end
