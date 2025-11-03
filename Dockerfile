FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container
COPY app.py .
COPY static/ ./static/
COPY templates/ ./templates/

# Expose the port 
EXPOSE 5000

RUN useradd appuser
USER appuser

# Run the application
CMD ["python", "app.py"]