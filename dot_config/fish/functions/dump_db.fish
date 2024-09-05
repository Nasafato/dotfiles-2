function dump_db
    set -l db $argv[1]
    switch $db
        case gc
            PGPASSWORD=postgres pg_dump \
                --dbname=goldcard \
                --data-only \
                --exclude-table=_prisma_migrations \
                --file="/Users/alangou/data/dumps/goldcard.sql" \
                --schema='public' \
                -h localhost \
                -p 5432 \
                -U postgres
        case common
            PGPASSWORD=common_postgres pg_dump \
                --dbname=common \
                --exclude-table=_prisma_migrations \
                --data-only \
                --file="/Users/alangou/data/dumps/common.sql" \
                --schema='public' \
                -h localhost -p 5433 -U common_postgres
        case 340b
            PGPASSWORD=postgres pg_dump \
                --dbname=340b \
                --data-only \
                --exclude-table=_prisma_migrations \
                --file="/Users/alangou/data/dumps/340b.sql" \
                --schema='public' \
                -h localhost \
                -p 5432 \
                -U postgres
        case '*'
            echo "Invalid database specified. Use 'gc', 'common', or '340b'."
            return 1

    end
end
