# 1. Use an official, lightweight Python image
FROM python:3.9-slim

# 2. Create a non-root user for security (Avoid running as root!)
RUN useradd -m secureuser

# 3. Set the working directory inside the container
WORKDIR /app

# 4. Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of your application code
COPY . .

# 6. Transfer ownership of the app directory to our non-root user
RUN chown -R secureuser:secureuser /app

# 7. Tell Docker to switch to the non-root user before running the app
USER secureuser

# 8. Expose the port Flask runs on
EXPOSE 8080

# 9. Define the command to start the application
CMD ["python", "app.py"]
