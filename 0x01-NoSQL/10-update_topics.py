#!/usr/bin/env python3
"""
Module for updating topics in a MongoDB collection.
"""

def update_topics(mongo_collection, name, topics):
    """
    Update the 'topics' field for documents with the specified
    'name' in the MongoDB collection.
    """
    mongo_collection.update_many(
        {"name": name},
        {"$set": {"topics": topics}}
    )
