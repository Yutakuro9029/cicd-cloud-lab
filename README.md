# Cloud Computing Lab: Automated CI/CD Pipeline with Docker and GitHub Actions

This repository is created as part of a Cloud Computing lab assignment, focusing on practicing and implementing automated Continuous Integration (CI) and Continuous Deployment (CD) workflows for a Node.js application.

The pipeline automatically builds a Docker image upon code updates and deploys it directly to a Google Cloud Platform (GCP) Virtual Machine.

---

## Project Structure

```text
.
├── .github/
│   └── workflows/
│       └── deploy.yml
├── public/
│   ├── index.html
│   └── style.css
├── .gitignore
├── Dockerfile
├── README.md
├── index.js
├── package-lock.json
└── package.json

```

## Technologies Used

* **Node.js**: Application backend runtime
* **Docker & DockerHub**: Containerization and image registry
* **GitHub Actions**: CI/CD pipeline automation
* **Google Cloud Platform (GCP)**: Compute Engine virtual machine server

## Configuration & Prerequisites

To successfully run this CI/CD pipeline, the following GitHub Secrets must be configured in your repository (`Settings > Secrets and variables > Actions`):

| Secret Name | Description |
| --- | --- |
| `DOCKERHUB_USERNAME` | Your DockerHub username |
| `DOCKERHUB_PASSWORD` | Your DockerHub password or Access Token |
| `SERVER_IP` | The External IP address of your Google Cloud VM |
| `SERVER_USERNAME` | The SSH username for your GCP VM (e.g., `phuminan`) |
| `SERVER_SSH_KEY` | The private SSH key contents for secure server authentication |

## How It Works

1. **Trigger**: A developer pushes code changes to the `main` branch on GitHub.
2. **Build and Push**: GitHub Actions triggers the workflow, builds the application into a Docker image, and pushes it to DockerHub.
3. **Automated Deployment**: GitHub Actions securely connects to the GCP VM via SSH, pulls the latest Docker image, stops the old container, and starts a new container running the updated version.