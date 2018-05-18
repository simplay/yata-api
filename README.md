# Yata-API

## Installation

1 . Clone this repository and run `bundle`

2 . Create a new database user:

```
sudo -u postgres createuser -s YOUR_USER_NAME
sudo -u postgres psql
postgres=# \password YOUR_USER_NAME
```

3 . Copy the dotenv file `cp .env.example .env` and fill-in your database's user credentials.

4 . `rails db:setup`

## Troubleshooting

+ Restart the postgres database service: `sudo service postgresql restart`
+ RIP-Database: `rails db:drop`
