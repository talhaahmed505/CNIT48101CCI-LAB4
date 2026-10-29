FROM python:3.13-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends git graphviz make \
    && rm -rf /var/lib/apt/lists/*
RUN git config --global --add safe.directory /work
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

WORKDIR /app
ENV PATH="/app/.venv/bin:$PATH"

COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-install-project

COPY . .
RUN uv sync --frozen

CMD ["make", "-C", "docs", "html"]