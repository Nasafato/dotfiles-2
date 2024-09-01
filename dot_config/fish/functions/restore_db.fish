function restore_db
    set -l db $argv[1]
    switch $db
        case gc
            PGPASSWORD=postgres psql -U postgres -h localhost -p 5432 --file="/Users/alangou/data/dumps/goldcard.sql" goldcard
        case common
            PGPASSWORD=postgres psql -U common_postgres -h localhost -p 5433 --file="/Users/alangou/data/dumps/common.sql" common
        case 340b
            PGPASSWORD=postgres psql -U postgres -h localhost -p 5432 --file="/Users/alangou/data/dumps/340b.sql" 340b
        case '*'
            echo "Invalid database specified. Use 'gc', 'common', or '340b'."
            return 1

    end
end
