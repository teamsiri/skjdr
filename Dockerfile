FROM python:3.10-buster
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY . /app/
WORKDIR /app/
RUN pip3 install -U pip
RUN curl -fssL https://deb.nodesource.com/setup_19.x | sudo -E bash - && sudo apt-get install nodejs -y
RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt
CMD bash start
