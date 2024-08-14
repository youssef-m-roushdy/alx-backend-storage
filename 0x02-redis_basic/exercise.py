#!/usr/bin/env python3
"""
    This module provides a Cache class to interact with Redis.
"""

import redis
import uuid
from typing import Union


class Cache:
    """
        A class to represent a cache system using Redis.
    """
    def __init__(self):
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, float, bytes, int]) -> str:
        """
            Stores the given data in the Redis cache.
        """
        user_key = str(uuid.uuid4())
        self._redis.set(user_key, data)
        return user_key
