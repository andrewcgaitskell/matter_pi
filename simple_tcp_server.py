
# python3

import socket

import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import wget
import os
from sqlalchemy import create_engine
import psycopg2

import os

# Create server socket.
serv_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM, proto=0)
serv_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
serv_sock.settimeout(10)


# Bind server socket to loopback network interface.
serv_sock.bind(('', 5010))

# Turn server socket into listening mode.
serv_sock.listen(10)
index = 0

try:
  while 1:
      while 1:
          newSocket, address = sock.accept(  )
          print("Connected from", address)
          # loop serving the new client
          while 1:
              receivedData = newSocket.recv(1024)
              if not receivedData: break
              # Echo back the same data you just received
              newSocket.send(receivedData)
          newSocket.close(  )
          print("Disconnected from", address)
finally:
    sock.close(  )
