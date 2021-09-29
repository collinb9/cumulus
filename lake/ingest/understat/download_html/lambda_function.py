"""Download webpage, put it in a json document and send to firehose"""
import os
import urllib.request as request
import logging
import json
import uuid
import logmatic
import boto3
import botocore

LAMBDA_FUNCTION_NAME = os.environ.get("AWS_LAMBDA_FUNCTION_NAME")
FIREHOSE_DELIVERY_STREAM = os.environ.get("FIREHOSE_DELIVERY_STREAM")

LOGGER = logging.getLogger(LAMBDA_FUNCTION_NAME)
LOGGER.propogate = False
LOG_HANDLER = logging.StreamHandler()
LOG_HANDLER.setFormatter(logmatic.JsonFormatter())
LOG_LEVEL = os.environ.get("LOG_LEVEL")
LOGGER.addHandler(LOG_HANDLER)
LOGGER.setLevel(LOG_LEVEL)

FIREHOSE = boto3.client("firehose")


def put_kinesis_message(message: str):
    pass


def lambda_handler(event, context):
    """
    :param event: An SQS event with the url to download the html page for
    """
    LOGGER.debug(event)
    LOGGER.debug(context)
    url = json.loads(event["Records"][0]["body"])["url"]
    # encapsulate in a function
    with request.urlopen(url) as response:
        html_page = response.read().decode(
            response.headers.get_content_charset()
        )
    payload = dict(url=url, html=html_page)
    LOGGER.debug("payload", extra=payload)
    # From this line down needs to be refined and put into a function
    data = json.dumps(payload)
    try:
        response = FIREHOSE.put_record(
            DeliveryStreamName=FIREHOSE_DELIVERY_STREAM,
            Record=dict(Data=data),  # This needs to be compressed
        )
    except botocore.exceptions.ClientError as err:
        LOGGER.error(
            "Failed to put record to stream: %s",
            FIREHOSE_DELIVERY_STREAM,
            extra=dict(error=err),
        )
    else:
        if response:
            LOGGER.info(
                "Message successfully sent to firehose stream %s",
                FIREHOSE_DELIVERY_STREAM,
                extra=response,
            )
        else:
            LOGGER.warning(
                "Encountered a problem trying to put record to firehose",
                extra=response,
            )
    # return payload
