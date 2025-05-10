# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container at /app
COPY ./app ./app

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable (optional, if you need to set defaults)
# ENV GEMINI_API_KEY YOUR_GEMINI_API_KEY_HERE

# Run app.main:app when the container launches
# Use 0.0.0.0 to make it accessible from outside the container
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]