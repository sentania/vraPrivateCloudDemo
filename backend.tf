terraform {
  backend "pg" {
    conn_str = "postgres://{var.backend_db_user}:{var.backend_db_pass}@{var.backend_db_host}:5433/{var.backend_db_name}?sslmode=disable"
  }
}
