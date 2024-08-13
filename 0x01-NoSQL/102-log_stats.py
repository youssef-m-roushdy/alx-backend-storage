#!/usr/bin/env python3
"""
    12. Log stats Ips
"""


from pymongo import MongoClient


def log_status_ips():
    """
        log_status_ips
    """
    client = MongoClient('mongodb://127.0.0.1:27017')
    logs_collection = client.logs.nginx
    total = logs_collection.count_documents({})
    get = logs_collection.count_documents({"method": "GET"})
    post = logs_collection.count_documents({"method": "POST"})
    put = logs_collection.count_documents({"method": "PUT"})
    patch = logs_collection.count_documents({"method": "PATCH"})
    delete = logs_collection.count_documents({"method": "DELETE"})
    path = logs_collection.count_documents(
        {"method": "GET", "path": "/status"})
    ips_present = logs_collection.aggregate([
        {"$group": {"_id": "$ip", "count": {"$sum": 1}}},
        {"$project": {"_id": 0, "ip": "$_id", "count": 1}},
        {"$sort": {"count": -1}},
        {"$limit": 10}])

    print(f"{total} logs")
    print("Methods:")
    print(f"\tmethod GET: {get}")
    print(f"\tmethod POST: {post}")
    print(f"\tmethod PUT: {put}")
    print(f"\tmethod PATCH: {patch}")
    print(f"\tmethod DELETE: {delete}")
    print(f"{path} status check")

    print("IPS")
    for ip_present in ips_present:
        print(f"\t{ip_present.get("ip")}: {ip_present.get("count")}")


if __name__ == "__main__":
    log_status_ips()
