# 🍽️ Restaurant Delivery Database Project

This project is an academic exercise that simulates a real-world relational database system for a restaurant's delivery service. It involves the complete cycle of database design, implementation, data population, querying, and integration with a Python program.

The main goal is to model and manage data related to restaurant staff, customers, food orders, deliveries, and transportation. The system includes roles like managers, attendants, cooks, delivery personnel (both employees and third-party), and vehicle tracking.

---

## 🚀 How to Run the Project

### 📁 Project Structure

```
.
├── app/
│   └── main.py                # Python script to execute the SQL routines
├── sql/
│   ├── create.sql             # SQL script to create the tables
│   ├── insert.sql             # SQL script to populate the tables
│   ├── queries.sql            # SQL script containing SELECT queries
│   └── delete.sql             # SQL script to delete all tables
├── docker-compose.yml         # Docker services for PostgreSQL and pgAdmin
├── .env                       # Environment variables (for local development only)
└── requirements.txt           # Python dependencies
```

### ✅ Prerequisites

Make sure you have installed:

- [Docker](https://www.docker.com/)
- [Python 3.8+](https://www.python.org/)
- `pip` (Python package manager)

### 🧪 Step-by-Step Guide

#### 1. Clone the repository

```bash
git clone https://github.com/pedroStelzer/database-project.git
cd database-project
```

#### 2. Start the PostgreSQL and pgAdmin containers

```bash
docker-compose up -d
```

> This will start:
>
> - A PostgreSQL container with your database
> - A pgAdmin container accessible at [http://localhost:8080](http://localhost:8080)

#### 3. Install the Python dependencies

```bash
pip install -r requirements.txt
```

#### 4. Go to app directory

```bash
cd app
```

#### 5. Execute the application

```bash
python main.py
```

The script will:

1. Connect to the PostgreSQL container using the credentials from `.env`.
2. Run `create.sql` to create the tables (if not already created).
3. Run `insert.sql` to populate the tables.
4. Execute all SELECT queries in `queries.sql` and print formatted results.

---

## 🔐 Environment Variables

All connection parameters are stored in a `.env` file:

```env
DB_NAME=meubanco
DB_USER=meuusuario
DB_PASSWORD=minhasenha
DB_HOST=localhost
DB_PORT=5440
```

> ℹ️ Since this setup is for local testing only, the `.env` file is visible in the project.

---

## 🧠 Accessing pgAdmin (optional)

You can access the database visually via pgAdmin:

- URL: [http://localhost:8080](http://localhost:8080)
- Email: `admin@admin.com`
- Password: `admin123`

After logging in, add a new server manually:

- **Name**: `local`
- **Host**: `db`
- **Port**: `5432`
- **Username**: `meuusuario`
- **Password**: `minhasenha`

> The hostname is `db` because it matches the service name in `docker-compose.yml`.

---

## 📦 Technologies Used

- PostgreSQL (relational database)
- Docker & Docker Compose
- pgAdmin 4 (web-based database admin tool)
- Python (automation and integration)
  - `psycopg2-binary`
  - `python-dotenv`
  - `tabulate`

---

## 📈 Example Queries Output

When running `main.py`, you will see outputs like:

```
 Consulta 2:

-- 2. Mostrar os nomes e salários dos funcionários que ganham mais de R$ 3.000
SELECT
 nome,
 salario
FROM Funcionario
WHERE salario > 3000
ORDER BY salario DESC

+------------------+-----------+
| nome             |   salario |
+==================+===========+
| João Silva       |      6000 |
+------------------+-----------+
| Larissa Oliveira |      3500 |
+------------------+-----------+
| Rafael Costa     |      3500 |
+------------------+-----------+
```

---

## 🧠 Authors and Credits

Project developed as part of a database systems course.

Feel free to fork, test, or adapt the code for your own learning purposes.

This project was developed by:

- **Pedro Augusto Stelzer da Silva**
- **Maria Clara Gomes Alves**
- **Breno Augusto Ferreira da Silva Arruda**

> Developed for the Database course at Centro de Informática - UFPE, 2025.
