"""Transform kinesis firehose payloads"""
import os
import base64
import logging
import logmatic

LOGGER = logging.getLogger(os.environ["AWS_LAMBDA_FUNCTION_NAME"])
LOGGER.propogate = False
LOG_HANDLER = logging.StreamHandler()
LOG_HANDLER.setFormatter(logmatic.JsonFormatter())
LOG_LEVEL = os.environ.get("LOG_LEVEL", "INFO")
LOGGER.addHandler(LOG_HANDLER)
LOGGER.setLevel(LOG_LEVEL)


def lambda_handler(event, context):
    """
    Perform the following transformations to the firehose payload:
        * Add a newline character after each json object

    https://gist.github.com/AmiriMc/3a3a0dc253797646ab221eb055c00506#file-kinesis-fh-json-newline-py
    """
    LOGGER.debug(event)
    output = []
    delivery_stream_arn = event["deliveryStreamArn"]
    for record in event["records"]:
        payload = base64.b64decode(record["data"]).decode("utf-8")
        row_w_newline = payload + "\n"
        row_w_newline = base64.b64encode(row_w_newline.encode("utf-8"))
        output_record = {
            "recordId": record["recordId"],
            "result": "Ok",
            "data": row_w_newline,
        }
        output.append(output_record)

    LOGGER.info(
        "Processed %d records.",
        len(event["records"]),
        extra=dict(dilvery_stream=delivery_stream_arn),
    )

    return {"records": output}

