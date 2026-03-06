FROM ubuntu:latest

WORKDIR /app

COPY . .

# Added the --break-system-packages flag at the end
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install flask --break-system-packages

EXPOSE 5000

CMD ["python3", "app.py"]
