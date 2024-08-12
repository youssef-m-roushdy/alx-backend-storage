#!/usr/bin/env python3
"""
Script to count and display HTTP request logs from a MongoDB collection.
"""
from pymongo import MongoClient


def main():
    """
    Connects to the MongoDB server, retrieves the 'nginx' collection,
    and prints counts of logs based on HTTP methods and status checks.
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
    main()
