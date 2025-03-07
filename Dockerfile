FROM python:3.10


#copy everything to the container
RUN mkdir -p /opt/status-page
COPY . /opt/status-page
WORKDIR /opt/status-page

# update package list and install dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv python3-dev build-essential \
    libxml2-dev libxslt1-dev libffi-dev libpq-dev libssl-dev zlib1g-dev

RUN pip install --no-cache-dir -r requirements.txt

#ALLOW PORTS
EXPOSE 8000

#RUN THE APP
CMD ["python3", "./statuspage/manage.py", "runserver", "0.0.0.0:8000", "--insecure"]
