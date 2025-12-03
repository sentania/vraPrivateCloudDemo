terraform {
  backend "pg" {
    conn_str = "postgres://${PSQL_TF_USER}:${TF_VAR_db_pass}@${TF_VAR_db_host}:5433/${TF_VAR_db_name}?sslmode=disable"
  }
}
