
# Hello DevOps Application

A simple Python Flask web application containerized using Docker, with Docker Compose and GitHub Actions CI.

## Project Features

- Python Flask web application
- Docker containerization
- Lightweight Python base image
- Non-root container user
- Application health check
- Docker Compose configuration
- Automated tests using pytest
- GitHub Actions CI pipeline

## Project Structure

```text
hello-devops/
├── app.py
├── Dockerfile
├── compose.yaml
├── requirements.txt
├── requirements-dev.txt
├── .dockerignore
├── tests/
│   └── test_app.py
└── .github/
    └── workflows/
        └── main.yml
```

## Application Endpoints

| Endpoint | Description |
|---|---|
| `/` | Returns Hello DevOps message |
| `/health` | Checks application health |

Application port: `6969`

## Build Docker Image

```bash
docker build -t hello-devops:v1 .
```

## Run Docker Container

```bash
docker run -d --name hello-devops-container -p 6969:6969 hello-devops:v1
```

## Run Using Docker Compose

Start:

```bash
docker compose up -d --build
```

Check status:

```bash
docker compose ps
```

Stop:

```bash
docker compose down
```

## Verify Application

Open these URLs in your browser:

- http://localhost:6969/
- http://localhost:6969/health

## Run Automated Tests

Create and activate a Python virtual environment, then install development dependencies:

```bash
python3 -m venv venv
source venv/bin/activate
python -m pip install -r requirements-dev.txt
```

Run tests:

```bash
python -m pytest -v
```

## View Container Logs

```bash
docker logs hello-devops-container
```

## Troubleshooting

**Container is not running:**

```bash
docker compose ps
docker compose logs
```

**Port already in use:**

Stop the conflicting application or container using port 6969.

**Check container health:**

```bash
docker inspect --format='{{.State.Health.Status}}' hello-devops-container
```

## CI Pipeline

GitHub Actions automatically:

1. Checks out the source code.
2. Sets up Python 3.12.
3. Installs dependencies.
4. Runs automated tests.
5. Builds the Docker image.

The workflow runs on pushes and pull requests targeting the `main` branch.

## Production Improvements

- Add application monitoring and centralized logging.
- Use HTTPS and a reverse proxy.
- Add vulnerability scanning for Docker images.
- Store secrets securely.
- Push versioned images to a container registry.
- Implement automated deployment.
