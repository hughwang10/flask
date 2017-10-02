# our base image
FROM alpine:edge
# Install python and pip
RUN apk add --update py2-pip
# install Python modules needed by the Python app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt
# copy files required for the app to run
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/
# tell the port number the container should expose
EXPOSE 5000
# run the application
CMD ["python", "/usr/src/app/app.py"]


# # our base image
# FROM ubuntu:16.04

# RUN \
# 	apt-get update && \
# 	apt-get -y upgrade && \
# 	apt-get autoremove && apt-get autoclean

# RUN \
# 	apt-get -y install python-pip && \
# 	pip install --upgrade pip

# # install Python modules needed by the Python app
# COPY requirements.txt /usr/src/app/
# RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# # copy files required for the app to run
# COPY app.py /usr/src/app/
# COPY templates/index.html /usr/src/app/templates/

# # tell the port number the container should expose
# EXPOSE 5000

# # run the application
# CMD ["python", "/usr/src/app/app.py"]