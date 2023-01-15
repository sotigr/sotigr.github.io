FROM python:3.9.16-slim-bullseye

WORKDIR /src

RUN pip install mkdocs

CMD ["/bin/bash", "-c", "mkdocs serve --dev-addr 0.0.0.0:8000"]