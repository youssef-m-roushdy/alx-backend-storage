#!/usr/bin/env python3
"""
Module for inserting a school document into a MongoDB collection.
"""

def insert_school(mongo_collection, **kwargs):
    """
    Insert a new school document into the MongoDB collection.
    """
    document = {
        'name': kwargs.get('name'),
        'address': kwargs.get('address')
    }

    result = mongo_collection.insert_one(document)

    return result.inserted_id
