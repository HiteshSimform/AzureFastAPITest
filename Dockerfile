# Use official Python image as a base
FROM python:3.11-slim

# Set environment variables to prevent Python from writing .pyc files to disc
# and to ensure that stdout and stderr are immediately flushed
ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY AzureFastAPITest/requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire app into the container (excluding __pycache__)
COPY AzureFastAPITest/ /app/

# Expose port 80 (required by Azure)
EXPOSE 80

# Command to run the app using Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
