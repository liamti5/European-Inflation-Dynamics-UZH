# Use the official Python image
FROM python:3.12-slim

# Install required system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    make \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the necessary files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install Jupyter
RUN pip install jupyter

# Expose port for Jupyter Notebook
EXPOSE 8888

# Set the default command to bash for a interactive session
CMD ["bash"]