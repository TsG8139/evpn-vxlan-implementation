# -------------------------------------------------------------------------
# Bazuje na oficjalnej dokumentacji Docker Caddy
# https://hub.docker.com/_/caddy#adding-custom-caddy-modules
# Licencja źródła: Apache License 2.0 (Caddy)
# -------------------------------------------------------------------------

FROM caddy:builder AS builder
RUN xcaddy build --with github.com/corazawaf/coraza-caddy/v2

FROM caddy
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

