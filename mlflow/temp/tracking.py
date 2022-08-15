import mlflow
# endpoint for tracking server: mlflow-utils-917663024.eu-central-1.elb.amazonaws.com
def main():
    remote_server_uri = "http://mlflow-utils-917663024.eu-central-1.elb.amazonaws.com"
    # remote_server_uri = "http://127.0.0.1:80"
    mlflow.set_tracking_uri(remote_server_uri)
    # mlflow.set_experiment("/my-experiment")
    with mlflow.start_run():
        mlflow.log_param("a", 1)
        mlflow.log_metric("b", 2)
        mlflow.log_artifact("tracking.py", "source")
    return

if __name__=="__main__":
    main()
