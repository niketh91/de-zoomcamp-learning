# base Docker image that we will build on
FROM python:3.13.11-slim

# set up our image by installing prerequisites; pandas & pyarrow in this case
#RUN pip install pandas pyarrow

# the venv already has the above pre-requisites
# Copy uv binary from official uv image (multi-stage build pattern)
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/

# Working Directory inside container
WORKDIR /code

# Add virtual environment to PATH so we can use installed packages
ENV PATH="/code/.venv/bin:$PATH"

# Copy dependency files first
COPY "pyproject.toml" "uv.lock" ".python-version" ./

# Install dependencies from lock file (ensures reproducible builds)
RUN uv sync --locked

# copy script to container's /code directory
# COPY <source> <destination>
# <source> → the file/folder on your local machine
# <destination> → where it should go inside the container
# . = current working directory inside the container, which is whatever you set with WORKDIR
COPY ingest_data.py .

# define what to do first when the container runs
# in this example, we will just run the script
# python → program to run
# ingest_data.py → argument to Python (your script)
ENTRYPOINT ["python", "ingest_data.py"]