```json
# =============================================================
# Environment variables — copy this file to .env and fill in
# the values for your environment before running the app.
# Never commit .env to version control.
# =============================================================

# ── App ───────────────────────────────────────────────────────
NODE_ENV=development
TZ=America/Sao_Paulo
PORT=3001

# ── Auth / Internal URLs ──────────────────────────────────────
AUTH_VALIDATE_URL=https://erp-server-dev.lawop.com.br/v1/auth/validate/jwt
URL_API=https://server-dev.lexxy.com.br
URL_MAIN=https://erp-server-dev.lawop.com.br/
FILES_API=https://erp-server-dev.lawop.com.br/

# AUTH_VALIDATE_URL=https://erp-server.lawop.com.br/v1/auth/validate/jwt
# URL_API=https://erp-server.lawop.com.br/
# URL_MAIN=https://erp-server.lawop.com.br/
# FILES_API=https://erp-server.lawop.com.br/

# ── Database ──────────────────────────────────────────────────
DB_USERNAME=lawop_erp
DB_PASSWORD=Dev5565Sempm2023apTest
DB_DATABASE=postgres
DB_HOST=lawop-erp-dev.cysgbndnb8yz.us-east-1.rds.amazonaws.com
DB_DIALECT=postgres
DB_SCHEMA=register
DB_SSL=true
DB_POOL_MAX=10
DB_POOL_MIN=0
DB_POOL_ACQUIRE=60000
DB_POOL_IDLE=0

# DB_USERNAME=lawop_erp
# DB_PASSWORD=SAse019490mPeMjAykwC2023
# DB_DATABASE=postgres
# DB_HOST=lawop-erp-prod.cysgbndnb8yz.us-east-1.rds.amazonaws.com
# DB_DIALECT=postgres
# DB_SCHEMA=register
# DB_SSL=true
# DB_POOL_MAX=2
# DB_POOL_MIN=0
# DB_POOL_ACQUIRE=60000
# DB_POOL_IDLE=0

# ── AWS ───────────────────────────────────────────────────────
# AWS_ACCESS_KEY=I5xgNi49+gtnR8rg5fD/oJIdPIWQj17Vr8QSduhf
# AWS_SECRET=AKIAVBLLM4MBPTLAQTMJ

# ── Jenkins ───────────────────────────────────────────────────
JENKINS_URL=
JENKINS_USER=
JENKINS_PASS=

# ── Plane ─────────────────────────────────────────────────────
PLANE_WORKSPACE=
PLANE_API_KEY=
PLANE_LEXXY_PROJECT_ID=
PLANE_URL=

# ── Solucionare ───────────────────────────────────────────────
SOLUCIONARE_BASE_URL=
SOLUCIONARE_OFFICER_URL=
SOLUCIONARE_REGISTER_TERM_URL=
SOLUCIONARE_PUBLICATION_URL=
SOLUCIONARE_REGISTER_OFFICE_URL=
SOLUCIONARE_TOKEN=
SOLUCIONARE_NOME_RELACIONAL=

# ── Core ──────────────────────────────────────────────────────
CORE_URL=
CORE_TOKEN=

# ── Discord ───────────────────────────────────────────────────
LEXXY_LOGS_URL=
LEXXY_BUG_REPORT_URL=

# ── LIA ───────────────────────────────────────────────────────
N8N_API_URL=
N8N_LIA_ENDPOINT=

