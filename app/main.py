import psycopg2
from dotenv import load_dotenv
from tabulate import tabulate
import os

# Função para ler e executar script SQL
def execute(caminho_arquivo, cursor):
    with open(caminho_arquivo, 'r', encoding='utf-8') as f:
        sql = f.read()
        cursor.execute(sql)
        print(f"[✓] Script {caminho_arquivo} executado com sucesso.")

# Função para executar múltiplas consultas SQL de um arquivo
def execute_multiple_queries(path, cursor):
    with open(path, 'r', encoding='utf-8') as f:
        sql = f.read()

    # Divide em consultas usando ponto e vírgula como delimitador
    queries = [q.strip() for q in sql.split(';') if q.strip()]

    for i, querie in enumerate(queries, 1):

        try:
            cursor.execute(querie)
            try:

                results = cursor.fetchall()
                colnames = [desc[0] for desc in cursor.description]

                print(f"\n🔍 Consulta {i}:\n\n{querie}\n")
                print(tabulate(results, headers=colnames, tablefmt='grid'))

            except psycopg2.ProgrammingError:

                # Nenhum dado retornado
                print(f"\n✅ Consulta {i} executada (sem retorno): {querie}")

        except Exception as e:
            print(f"\n❌ Erro na consulta {i}: {e}")

load_dotenv()

# Conexão com o banco no Docker
con = psycopg2.connect(
    dbname = os.getenv("DB_NAME"),
    user = os.getenv("DB_USER"),
    password = os.getenv("DB_PASSWORD"),
    host = os.getenv("DB_HOST"),
    port = os.getenv("DB_PORT")
)

# Criar cursor
cur = con.cursor()

try:
    # Executar criação de tabelas
    execute('../sql/create.sql', cur)
    con.commit()

    # Executar inserção de dados
    execute('../sql/insert.sql', cur)
    con.commit()

except psycopg2.errors.DuplicateTable: # Exceção para tabela já existente
    print("\n[!] Tabelas já existem, pulando criação e inserção.")
    con.rollback()

# Executar consultas
execute_multiple_queries('../sql/queries.sql', cur)

# Perguntar se deseja deletar as tabelas
delete = input("\nDeseja deletar as tabelas? (s/n): ")
if(delete.lower() == 's'):
    execute('../sql/delete.sql', cur)
    con.commit()
    print("\n[✓] Tabelas deletadas com sucesso.")

# Finalizar
cur.close()
con.close()
print("\n[✓] Finalizado.")