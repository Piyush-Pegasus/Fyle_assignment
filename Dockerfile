FROM python:3.8-slim

#Set the working directory in the container
WORKDIR /usr/src/app


COPY . .

RUN pip install --no-cache-dir -r requirements.txt

#Make port 5000 available to the world outside this container
EXPOSE 5000

#Define environment variable
ENV FLASK_APP=core/server.py
ENV FLASK_RUN_HOST=0.0.0.0

#Run app.py when the container launches
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "--log-level", "debug","core.server:app"]