
# Python image
FROM python:3.12-slim

# Python environment settings
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# dependency file
COPY requirements.txt .

# dependencies
RUN pip install --no-cache-dir -r requirements.txt

# application
COPY app.py .

# non-root user
RUN useradd --create-home --shell /usr/sbin/nologin appuser

# Run as non-root user
USER appuser

# Application port
EXPOSE 6969

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:6969/health', timeout=2)" || exit 1

# Start application  Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:6969", "app:app"]
