FROM python:3.9-slim

# Install Java for PySpark (use default JDK available in Debian)
RUN apt-get update && apt-get install -y default-jdk && rm -rf /var/lib/apt/lists/*

# Set environment variables (point JAVA_HOME to default JDK)
ENV JAVA_HOME=/usr/lib/jvm/default-java
ENV PATH="$JAVA_HOME/bin:$PATH"

# Install Python packages
RUN pip install pandas pyspark sqlalchemy jupyter

# Copy project files
COPY . /app
WORKDIR /app

# Expose port for Jupyter if needed
EXPOSE 8888

# Default command
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]