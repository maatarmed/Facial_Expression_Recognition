# set base image (host OS)
FROM python:3.7

# set the working directory in the container
WORKDIR /code

# copy the dependencies file to the working directory
COPY requirements.txt /code

RUN apt-get update ##[edited]
RUN apt-get install 'ffmpeg'\
    'libsm6'\ 
    'libxext6'  -y

# install dependencies
RUN pip install -r requirements.txt

# copy the content of the local src directory to the working directory
COPY camera.py /code
COPY haarcascade_frontalface_default.xml /code
COPY main.py /code
COPY model.json /code
COPY model.py /code
COPY model_weights.h5 /code
COPY ./templates /code
COPY ./utils /code

# command to run on container start
CMD [ "python", "./main.py" ] 