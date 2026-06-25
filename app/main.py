import os
import psycopg2
from fastapi import FastAPI, HTTPException
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = FastAPI(title="My Cloud App", version="1.0.0")

def get_db_connection():
    try:
        conn = psycopg2.connect(
            host=os.getenv("DB_HOST", "localhost"),
            database=os.getenv("DB_NAME", "myappdb"),
            user=os.getenv("DB_USER", "postgres"),
            password=os.getenv("DB_PASSWORD", "password"),
            port=int(os.getenv("DB_PORT", 5432))
        )
        return conn
    except Exception as e:
        logger.error(f"Database connection failed: {e}")
        return None

@app.get("/health")
async def health_check():
    return {"status": "healthy", "service": "my-cloud-app"}

@app.get("/data")
async def get_data():
    conn = get_db_connection()
    if not conn:
        raise HTTPException(status_code=503, detail="Database unavailable")
    
    try:
        cur = conn.cursor()
        cur.execute("SELECT NOW();")
        result = cur.fetchone()
        cur.close()
        conn.close()
        return {"message": "Data fetched successfully!", "timestamp": str(result[0])}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))