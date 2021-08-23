import os
import signal
import subprocess

command = "netstat -ano | findstr 5010"
c = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr = subprocess.PIPE)
stdout, stderr = c.communicate()
pid = int(stdout.decode().strip().split(' ')[-1])
os.kill(pid, signal.SIGTERM)
