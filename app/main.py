from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {
        "status": "ok",
        "service": "devops-project"
    }

@app.get("/health")
def health():
    return {"health":"healthy"}
