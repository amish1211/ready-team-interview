# API

## Setup

After cloning the repo, start everything:

```bash
docker compose up -d --build
```

Then load the PostgreSQL dump (run once, into the empty database):

```bash
docker exec -i postgres_db psql -U amish -d readydb < db/readydb_dump.sql
```

On Windows PowerShell, use this instead:

```powershell
docker cp db/readydb_dump.sql postgres_db:/tmp/readydb_dump.sql
docker exec postgres_db psql -U amish -d readydb -f /tmp/readydb_dump.sql
```

Company service runs on port `3000`, user service on port `5000`.

## Users

**Create a user** — `POST /users`
```bash
curl -X POST http://localhost:5000/users \
  -H "Content-Type: application/json" \
  -d '{"name": "Test User", "email": "test.user@acme.com", "company_id": 1}'
```

**List users** — `GET /users`
```bash
curl http://localhost:5000/users
```

**Get user + company details** — `GET /users/:id`
```bash
curl http://localhost:5000/users/1
```

## Companies

**Create a company** — `POST /companies`
```bash
curl -X POST http://localhost:3000/companies \
  -H "Content-Type: application/json" \
  -d '{"name": "Acme Corp", "address_line": "12 MG Road, Bengaluru, Karnataka 560001"}'
```

**List companies** — `GET /companies`
```bash
curl http://localhost:3000/companies
```

**Get company by ID** — `GET /companies/:id`
```bash
curl http://localhost:3000/companies/1
```