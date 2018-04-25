FROM python:2
RUN apt-get update -y && apt-get install -y python-pip python-dev build-essential

# Copy the current directory contents into the container at /flaskapp
ADD . /flaskApp
# Set working directory to /flaskApp
WORKDIR /flaskApp
COPY requirements.txt ./
RUN pip install -r requirements.txt
# Make port 80 available to the world outside this container
EXPOSE 80
# Run app.py when the container launches
CMD ["python", "app.py"]

