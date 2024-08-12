#!/usr/bin/env python3
"""
Module for querying schools by topic in a MongoDB collection.
"""

def schools_by_topic(mongo_collection, topic):
    """
    Find documents in the MongoDB collection where the 'topics'
    field contains the specified topic.
    """
    return mongo_collection.find({"topics": {"$in": [topic]}})
