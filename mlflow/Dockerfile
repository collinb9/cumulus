FROM python:3.8.13

ENV MLFLOW_VERSION 1.27.0
RUN pip install boto3 mlflow==${MLFLOW_VERSION} psycopg2-binary==2.8.6
# RUN pip install protobuf==3.20.1

# These environment variables should be set at runtime
ENV BACKEND_STORE_URI=
ENV DEFAULT_ARTIFACT_ROOT=

EXPOSE 5000
EXPOSE 80

CMD mlflow server \
    --backend-store-uri ${BACKEND_STORE_URI} \
    --default-artifact-root ${DEFAULT_ARTIFACT_ROOT} \
    --host 0.0.0.0

