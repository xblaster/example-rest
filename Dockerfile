from python:2

ENV https_proxy http://proxy_framework_dev:vMfcb2C2012@proxyha.curia.europa.eu:8080
ENV http_proxy http://proxy_framework_dev:vMfcb2C2012@proxyha.curia.europa.eu:8080
RUN pip install web.py
ADD rest.py /src/
ADD user_data.xml /src/

EXPOSE 8080

CMD python /src/rest.py