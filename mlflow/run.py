import mlflow

def main():
    remote_server_uri = "https://67iixhx8jn.eu-west-1.awsapprunner.com"
    # remote_server_uri = "http://127.0.0.1:5000"
    mlflow.set_tracking_uri(remote_server_uri)
    # mlflow.set_experiment("/my-experiment")
    with mlflow.start_run():
        print(mlflow.active_run().to_dictionary())
        mlflow.log_param("a", 1)
        mlflow.log_metric("b", 2)
        mlflow.log_artifact("run.py", "source")
    return

if __name__=="__main__":
    main()
