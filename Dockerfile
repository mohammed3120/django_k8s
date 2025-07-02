# Use official lightweight Python image
FROM python:3.11.2-alpine3.17

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PATH="/scripts:/py/bin:$PATH"

# Install system dependencies
RUN apk add --update --no-cache \
    postgresql-client \
    build-base \
    postgresql-dev \
    musl-dev \
    zlib \
    zlib-dev \
    linux-headers

# Create virtual environment and install dependencies
COPY ./requirements.txt /requirements.txt
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /requirements.txt && \
    rm -rf /root/.cache/pip

# Copy scripts and make them executable
COPY ./scripts /scripts
RUN chmod -R +x /scripts

# Copy application code
COPY ./app /app
WORKDIR /app

# Expose port 80
EXPOSE 80

# Start command
CMD ["/scripts/run.sh"]