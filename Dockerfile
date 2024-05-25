FROM mysterysd/wzmlx:latest

# Set the working directory
WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

# Install Python dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port the application runs on (e.g., 8080)
EXPOSE 8080

# Run the application
CMD ["bash", "start.sh"]
