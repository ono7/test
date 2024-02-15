#!/usr/bin/env python3
"""
    Date:    2024-02-12  00:33

"""

from app import add, subtract


def test_app():
    assert add(1, 3) == 4

def test_subtract():
    assert subtract(4, 2) == 2
