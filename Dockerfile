from python:2

RUN pip install web.py
ADD rest.py /src/
ADD user_data.xml /src/

EXPOSE 8080

CMD python /src/rest.py