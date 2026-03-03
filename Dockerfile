#  Copyright (c) Juniper Networks, Inc., 2025-2026.
#  All rights reserved.
#  SPDX-License-Identifier: MIT

FROM python:3.10.15

# OCI Image Labels - Required for ApstraHub container metadata extraction
# Note: version, title, description are set by docker/metadata-action in CI
LABEL org.opencontainers.image.title="ApstraHub Container - Snow Demo Pack"
LABEL org.opencontainers.image.description="ServiceNow integration for Apstra anomaly ticket creation"
LABEL org.opencontainers.image.authors="ApstraHub Team <apstrahub@juniper.net>"
LABEL org.opencontainers.image.documentation="https://github.com/Juniper/apstrahub-container-snowdemopack"
LABEL org.opencontainers.image.source="https://github.com/Juniper/apstrahub-container-snowdemopack"
LABEL org.opencontainers.image.vendor="Juniper Networks"
LABEL org.opencontainers.image.licenses="MIT"

WORKDIR /SnowApp

COPY ./snow_tickets.py .
COPY ./requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
#RUN pip install pip-system-certs --use-feature=truststore
CMD ["python3", "snow_tickets.py"]

