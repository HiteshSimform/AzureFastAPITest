#!/bin/bash

# Install dependencies
pip install -r requirements.txt

# Start FastAPI app
exec uvicorn main:app --host=0.0.0.0 --port=8000
