from python:2-slim

RUN pip install web.py
ADD rest.py /src/
ADD user_data.xml /src/

EXPOSE 8080
HEALTHCHECK CMD curl --fail http://localhost:8080/version || exit 1
CMD python /src/rest.py
