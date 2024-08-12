#!/usr/bin/env python3
""" 12. Log stats
"""
from pymongo import MongoClient


def log_stats():
    """ log_stats.
    """
    client = MongoClient('mongodb://127.0.0.1:27017')
    logs_collection = client.logs.nginx

    logs = logs_collection.count_documents({})
    GET = logs_collection.count_documents({"method": "GET"})
    POST = logs_collection.count_documents({"method": "POST"})
    PUT = logs_collection.count_documents({"method": "PUT"})
    PATCH = logs_collection.count_documents({"method": "PATCH"})
    DELETE = logs_collection.count_documents({"method": "DELETE"})
    status_check = logs_collection.count_documents({"method": "GET",
                                                     "path": '/status'})

    print("{} logs".format(logs))
    print("\tmethod GET: {}".format(GET))
    print("\tmethod POST: {}".format(POST))
    print("\tmethod PUT: {}".format(PUT))
    print("\tmethod PATCH: {}".format(PATCH))
    print("\tmethod DELETE: {}".format(DELETE))
    print("{} status check".format(status_check))


if __name__ == "__main__":
    log_stats()
