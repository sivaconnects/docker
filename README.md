# Docker Commands Cheat Sheet for DevOps

A practical list of Docker commands used in real-world DevOps and Cloud workflows.

## Build & Run Containers

```bash
# Build Docker image
docker build -t image_name .

# Build without cache
docker build --no-cache -t image_name .

# Build using BuildKit
DOCKER_BUILDKIT=1 docker build .

# Build multi-platform image
docker buildx build --platform linux/amd64,linux/arm64 .

# Create buildx builder
docker buildx create --use

# List builders
docker buildx ls

# Tag image
docker tag image_name repo/image_name:v1

# Run container
docker run -d -p 5000:5000 --name container_name image_name

# Run container with environment variables
docker run -d -p 5000:5000 -e ENV=prod --name container_name image_name

# Run container with volume
docker run -d -p 5000:5000 --name container_name -v volume_name:/app image_name

# Run container on specific network
docker run -d --network network_name --name container_name image_name

# Run container interactively
docker run -it ubuntu bash

# Create container without starting
docker create --name container_name image_name
```

## Container Management

```bash
# List running containers
docker ps

# List all containers
docker ps -a

# Start container
docker start container_name

# Stop container (Graceful)
docker stop container_name

# Kill container (Forceful)
docker kill container_name

# Restart container
docker restart container_name

# Pause container
docker pause container_name

# Unpause container
docker unpause container_name

# Rename container
docker rename old_name new_name

# Remove container
docker rm container_name

# Force remove container
docker rm -f container_name
```

## Container Debugging & Monitoring

```bash
# View logs
docker logs container_name

# Follow logs in real-time
docker logs -f container_name

# Show last 100 logs
docker logs --tail 100 container_name

# Logs with timestamps
docker logs -t container_name

# Show container processes
docker top container_name

# Show container resource usage
docker stats

# Monitor specific container
docker stats container_name

# Inspect container
docker inspect container_name

# Check container exit code
docker inspect container_name --format='{{.State.ExitCode}}'

# Show filesystem changes
docker diff container_name

# Get container IP
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name

# List port mappings
docker port container_name
```

## Access Containers

```bash
# Access container shell
docker exec -it container_name bash

# Execute command inside container
docker exec container_name env

# Attach to container
docker attach container_name

# List files in container
docker exec -it container_name ls /app
```

## Image Management

```bash
# List images
docker images

# Pull image
docker pull nginx

# Push image
docker push repo/image_name

# Remove image
docker rmi image_name

# Remove unused images
docker image prune

# Remove all unused images
docker image prune -a

# View image history
docker history image_name

# Inspect image
docker image inspect image_name

# Save image to tar
docker save -o image.tar image_name

# Load image from tar
docker load -i image.tar
```

## File Operations

```bash
# Copy file from host to container
docker cp file.txt container_name:/app

# Copy file from container to host
docker cp container_name:/app/file.txt .

# Copy folder to container
docker cp ./local_folder container_name:/app

# Export container filesystem
docker export container_name > container.tar

# Import container as image
docker import container.tar new_image
```

## Volumes

```bash
# Create volume
docker volume create volume_name

# List volumes
docker volume ls

# Inspect volume
docker volume inspect volume_name

# Remove volume
docker volume rm volume_name

# Remove unused volumes
docker volume prune
```

## Networks

```bash
# List networks
docker network ls

# Create network
docker network create network_name

# Inspect network
docker network inspect network_name

# Connect container to network
docker network connect network_name container_name

# Disconnect container from network
docker network disconnect network_name container_name

# Remove network
docker network rm network_name

# Remove unused networks
docker network prune
```

## Docker Compose

```bash
# Start services
docker compose up

# Start services in background
docker compose up -d

# Stop services
docker compose down

# Restart services
docker compose restart

# View logs
docker compose logs

# View running services
docker compose ps
```

## Resource Limits

```bash
# Run container with memory limit
docker run -m 512m nginx

# Run container with CPU limit
docker run --cpus="1.5" nginx

# Run container with restart policy
docker run --restart unless-stopped nginx
```

## System Information & Context

```bash
# Docker system info
docker info

# Show disk usage
docker system df

# Detailed disk usage
docker system df -v

# Docker events
docker events

# List Docker contexts (Cloud/Remote)
docker context ls

# Use specific context
docker context use my-cloud-context
```

## Cleanup Commands

```bash
# Remove stopped containers
docker container prune

# Remove unused images
docker image prune

# Remove all unused images
docker image prune -a

# Remove unused volumes
docker volume prune

# Remove unused networks
docker network prune

# Remove everything unused
docker system prune -a --volumes
```

## Bulk Operations

```bash
# Stop all containers
docker stop $(docker ps -aq)

# Remove all containers
docker rm $(docker ps -aq)

# Stop and Remove all containers (One-liner)
docker stop $(docker ps -aq) && docker rm $(docker ps -aq)

# Remove all images
docker rmi $(docker images -q)

# Remove all volumes
docker volume rm $(docker volume ls -q)

# Remove all networks
docker network rm $(docker network ls -q)
```

## Registry Operations

```bash
# Login to registry
docker login

# Logout
docker logout

# Search images
docker search nginx
```

## Advanced Operations

```bash
# Create checkpoint of running container
docker checkpoint create container_name checkpoint1

# Start container from checkpoint
docker start --checkpoint checkpoint1 container_name
```

---

**Quick Reference:**
- `-d`: Detached mode (background)
- `-it`: Interactive terminal
- `-p`: Port mapping
- `-v`: Volume mount
- `-e`: Environment variable
- `--name`: Container name
- `-f`: Force remove / follow logs
  


# Top 15 Daily Commands for DevOps

## Troubleshooting & Debugging (Most Used)


```bash
# Check if containers are running
docker ps

# View real-time logs (Critical for debugging)
docker logs -f <container_name>

# Access container shell to debug internally
docker exec -it <container_name> bash

# Check CPU and Memory usage
docker stats

# Inspect detailed container configuration
docker inspect <container_name>

# Check which ports are mapped
docker port <container_name>
```

### 🛠 Deployment & Build

```bash
# Build an image
docker build -t <image_name> .

# Run a container in background
docker run -d -p 80:80 --name <container_name> <image_name>

# Restart a stuck container
docker restart <container_name>

# Stop and remove a container
docker stop <container_name> && docker rm <container_name>
```

### Maintenance & Cleanup

```bash
# Remove unused data (Free up disk space)
docker system prune -a

# List all images to check versions
docker images

# Remove a specific image
docker rmi <image_name>
```

### Docker Compose (Multi-Container Apps)

```bash
# Start all services
docker compose up -d

# Stop all services
docker compose down

# View logs for all services
docker compose logs -f
```

### File Operations

```bash
# Copy logs or config from container to host
docker cp <container_name>:/var/log/app.log .
```

---

## 💡 Pro Tip: Create Aliases for Speed

Senior DevOps engineers often add these to their `~/.bashrc` or `~/.zshrc` to save time:

```bash
alias dps='docker ps'
alias dlogs='docker logs -f'
alias dexec='docker exec -it'
alias dbuild='docker build -t'
alias dclean='docker system prune -a'
alias dcompose='docker compose'
```

---

## Why These Commands?

| Command | Why It's Used Daily |
| :--- | :--- |
| `docker ps` | First step to verify if services are up. |
| `docker logs -f` | Primary tool for troubleshooting errors. |
| `docker exec` | Needed to check internal state or run migrations. |
| `docker stats` | Monitor performance issues (CPU/Mem leaks). |
| `docker system prune` | CI/CD runners often run out of disk space. |
| `docker compose` | Standard for local development and staging. |
