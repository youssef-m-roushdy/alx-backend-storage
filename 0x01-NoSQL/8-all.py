#!/usr/bin/env python3
"""
Module description or purpose
"""
from pymongo import MongoClient


def list_all(mongo_collection):
    """
    Retrieve all documents from a MongoDB collection.
    """
    return mongo_collection.find({})
