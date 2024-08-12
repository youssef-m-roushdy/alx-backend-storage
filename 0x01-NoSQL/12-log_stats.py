#!/usr/bin/env python3
""" 12. Log stats
"""


from pymongo import MongoClient


def log_stats():
    """ log_stats.
    """
    client = MongoClient('mongodb://127.0.0.1:27017')
    nginx_collection = client.logs.nginx

    total_logs = nginx_collection.count_documents({})
    print("{} logs".format(total_logs))

    methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]
    for method in methods:
        count = nginx_collection.count_documents({"method": method})
        print("\tmethod {}: {}".format(method, count))

    status_check = nginx_collection.count_documents({"method": "GET",
                                                     "path": "/status"})
    print("{} status check".format(status_check))


if __name__ == "__main__":
    log_stats()
