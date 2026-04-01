FROM python:3.10-slim-buster

RUN apt-get update && apt-get install -y \
    git \
    imagemagick \
    libmagickcore-dev \
    libmagickwand-dev \
    python3-pip \
    ffmpeg \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

RUN pip3 install --no-cache-dir -U pip setuptools
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python3", "-m", "FallenRobot"]
