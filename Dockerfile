FROM python:3.9.16-slim-bullseye

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

WORKDIR /src

 
CMD ["/bin/bash", "-c", "mkdocs serve --dev-addr 0.0.0.0:8000"]