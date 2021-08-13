sudo apt update
sudo apt upgrade -y

sudo apt install sudo

sudo apt install -y software-properties-common
sudo apt install -y postgresql
sudo apt install -y postgresql-client

sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"

sudo -u postgres psql -c "CREATE EXTENSION adminpack;"

psqluser="pythonuser"   # Database username
psqlpass="pythonuser"  # Database password
psqldb="data"   # Database name

sudo printf "CREATE ROLE pythonuser WITH LOGIN SUPERUSER INHERIT CREATEDB CREATEROLE NOREPLICATION PASSWORD 'pythonuser';\nCREATE DATABASE $psqldb WITH OWNER $psqluser;" > createuserdb.sql

sudo -u postgres psql -f createuserdb.sql

# open up "firewall"
# https://opensource.com/article/17/10/set-postgres-database-your-raspberry-pi
