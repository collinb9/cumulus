FROM python:3.9.13-slim

RUN apt-get update -y && \
    apt-get install -y python3-dev default-libmysqlclient-dev build-essential

RUN pip install psycopg2-binary==2.8.6 && \
    pip install mlflow[extras]==1.28.0

# These environment variables should be set at runtime
ENV BACKEND_STORE_URI=
ENV DEFAULT_ARTIFACT_ROOT=

EXPOSE 80

CMD ["sh", "-c", "mlflow server --host 0.0.0.0 --port 80 --backend-store-uri $BACKEND_STORE_URI --default-artifact-root $DEFAULT_ARTIFACT_ROOT"]
