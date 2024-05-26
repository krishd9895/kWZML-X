FROM mysterysd/wzmlx:latest

# Set the working directory
WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

# Install Python dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Ensure start.sh is executable
RUN chmod +x start.sh

# Expose the port the application runs on (e.g., 8080)
EXPOSE 8080

# Run the start.sh script followed by Gunicorn
CMD ["bash", "-c", "./start.sh && gunicorn -w 4 -b 0.0.0.0:8080 app:app"]
