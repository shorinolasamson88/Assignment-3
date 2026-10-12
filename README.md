# DevOps Assignment 3 — Bash System and Network Tool

## About the Project

This project is a simple Bash command-line tool I built as part of my DevOps learning. The tool can display system information, check if a hostname is valid, and test connectivity to a TCP port.

I also used Docker to package the application into a container and GitHub Actions to automate the validation, testing, and Docker build process.

The main aim of this assignment was to practise Bash scripting, testing, Docker, and CI/CD.

## Project Structure

```text
assignment-3/
├── app/
│   └── app.sh
├── scripts/
│   ├── lint.sh
│   └── build.sh
├── tests/
│   └── test.sh
├── .github/
│   └── workflows/
│       └── ci.yml
├── Dockerfile
├── compose.yaml
├── .dockerignore
├── grade.sh
└── README.md
```

## Requirements

The following tools are needed to run and test the project:

* Bash
* Git
* Docker
* GitHub account (to run the GitHub Actions workflow)

## How to Run the Application

First, clone the repository and move into the project directory.

```bash
git clone <your-repository-url>
cd assignment-3
```

Make the scripts executable:

```bash
chmod +x app/app.sh scripts/*.sh tests/*.sh grade.sh
```

### Available Commands

**1. Display system information**

```bash
./app/app.sh system-info
```

This displays information such as the hostname, current user, operating system, kernel version, CPU, memory, uptime, and current working directory.

**2. Check a hostname**

```bash
./app/app.sh check-host google.com
```

This checks whether the hostname can be resolved and displays its IP address.

**3. Check a TCP port**

```bash
./app/app.sh check-port google.com 443
```

This validates the port number and attempts to establish a TCP connection to the specified host and port.

**4. Display help**

```bash
./app/app.sh help
```

This displays the available commands and how to use them.

Invalid commands and incorrect arguments return an error exit code.

## Testing and Validation

I created scripts to check the project and make sure the application behaves as expected.

* `scripts/lint.sh` checks for required project files and Bash syntax errors.
* `tests/test.sh` tests commands such as `help`, `system-info`, invalid commands, missing arguments, and invalid port numbers.
* `scripts/build.sh` builds the Docker image and runs smoke tests to check that the container works.
* `grade.sh` checks the project structure, script permissions, workflow configuration, application tests, Docker behaviour, and Git history.

To run the validation and tests manually:

```bash
./scripts/lint.sh
./tests/test.sh
./scripts/build.sh
```

To run the grader:

```bash
./grade.sh
```

## Docker

I used Docker to package the Bash application so that it can run inside a container.

Build the image:

```bash
docker build -t devops-tool .
```

Run the application inside the container:

```bash
docker run --rm devops-tool help
docker run --rm devops-tool system-info
```

Test how the application handles an invalid command:

```bash
docker run --rm devops-tool invalid-command
```

The application should reject the invalid command and return exit code `2`.

The `compose.yaml` file is also included for running the application with Docker Compose where needed.

## GitHub Actions CI Pipeline

I created a GitHub Actions workflow in `.github/workflows/ci.yml`. It runs when I push changes to the `main` branch or open a pull request targeting `main`.

The workflow has three jobs:

1. **Validate:** runs the lint script to check the required files and Bash syntax.
2. **Test:** runs the application test script after validation succeeds.
3. **Docker:** builds the Docker image and runs smoke tests after the application tests succeed.

I used job dependencies with `needs` so that the next job runs only after its required previous job succeeds.

## What I Learned

While working on this assignment, I practised writing Bash scripts, handling command-line arguments, checking exit codes, and testing valid and invalid inputs.

I also learned how to build and test a Docker image, and how GitHub Actions can automate checks whenever code is pushed to a repository. Working on the pipeline helped me understand why automated testing is useful before moving on to the next stage of a project.

