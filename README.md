## iii-docker

Run Innovative Millennium via Docker and VNC

## Using this build

You will need to throw milup160_02.bin into the copyables after cloning the repo. Then enter the repo and

`docker build . -t millennium`

`docker run -e III_IP=my.iiiserver.com -p 127.0.0.1:9999:5900 millennium`

Where you set the III_IP to the ip of your Millennium server and 9999 is the local port you want to connect to VNC on.
