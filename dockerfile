# Use an official Python runtime as a parent image
FROM python:3.11

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /code

# Install any needed dependencies specified in requirements.txt
COPY requirements.txt /code/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /code
COPY . /code/

# Expose the port that Django runs on
EXPOSE 8000

# Define the command to run your application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
