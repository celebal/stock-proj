#!/usr/bin/env python
# Haversine formula 
import math
import os.path
import sys

from math import radians, sin, cos, sqrt, asin

def kmToMile(count):
    kilometers = count
    miles = kilometers * 0.621371
    return miles

def distance(val1, val2, val3, val4):
  lat1,lon1 = float(val1),float(val2)
  lat2,lon2 = float(val3),float(val4)
  R = 6372.8 # Earth radius in kilometers
 
  dLat = radians(lat2 - lat1)
  dLon = radians(lon2 - lon1)
  lat1 = radians(lat1)
  lat2 = radians(lat2)
 
  a = sin(dLat/2)**2 + cos(lat1)*cos(lat2)*sin(dLon/2)**2
  c = 2*asin(sqrt(a))
  print (kmToMile(R*c))

def printSys(arg1, arg2, arg3, arg4):
    print(float(arg1))
    print(float(arg2))
    print(float(arg3))
    print(float(arg4))

if __name__ == '__main__':
    distance(sys.argv[1],sys.argv[2],sys.argv[3], sys.argv[4])
    