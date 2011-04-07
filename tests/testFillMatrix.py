#!/usr/bin/env python
# -*- coding: utf-8 -*-

def __fill_matrix(x=50, y=50, value=0):
    """
    Simply fill a matrix with the same value.

    Keywords arguments:
    x -- x size of the matrix
    y -- y size of the matrix
    value - value that we want to fill with
    """
    m = []
    for i in range(x):
        f = []
        for j in range(y):
            f.append(value)
        m.append(f)
        
    return m

def nuevoFill(x=50, y=50, value=0):
    m = [[value for nx in xrange(x)] for ny in xrange(y)]
    return m
        

import timeit

t = timeit.Timer(nuevoFill)       # outside the try/except
val1=  t.timeit(10000)    # or t.repeat(...)

t = timeit.Timer(__fill_matrix )       # outside the try/except
val2= t.timeit(10000)    # or t.repeat(...)

print val2/val1



