"""Download webpage, put it in a json document and send to firehose"""
import os
import urllib.request as request
import logging
import json
import logmatic

LAMBDA_FUNCTION_NAME = os.environ.get("AWS_LAMBDA_FUNCTION_NAME")

LOGGER = logging.getLogger(LAMBDA_FUNCTION_NAME)
LOGGER.propogate = False
LOG_HANDLER = logging.StreamHandler()
LOG_HANDLER.setFormatter(logmatic.JsonFormatter())
LOG_LEVEL = os.environ.get("LOG_LEVEL")
LOGGER.addHandler(LOG_HANDLER)
LOGGER.setLevel(LOG_LEVEL)


def lambda_handler(event, context):
    """
    :param event: An SQS event with the url to download the html page for
    """
    LOGGER.debug(event)
    LOGGER.debug(context)
    url = json.loads(event["Records"][0]["body"])["url"]
    response = request.urlopen(url)
    html_page = response.fp.read()
    payload = dict(url=url, html=html_page)
    return payload
