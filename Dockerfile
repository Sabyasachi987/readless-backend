# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app
COPY . .

# Expose port (Railway uses $PORT env variable)
EXPOSE 8000

# Set environment variables (optional, Railway prefers dashboard config)
# ENV GROQ_API_KEY=your_groq_api_key_here
# ENV GROQ_MODEL=openai/gpt-oss-120b

# Start FastAPI server
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]