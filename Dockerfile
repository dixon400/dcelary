# Use the official Python image from the Docker Hub
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Django project code
COPY . /app/
COPY entrypoint.sh /app/


ENTRYPOINT [ "/app/entrypoint.sh" ]
# Run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
