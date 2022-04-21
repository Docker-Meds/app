FROM python:3.9.4-slim

COPY . C:/Env/app/

WORKDIR C:/Env/app/

RUN pip install  --no-cache-dir --upgrade -r requirements.txt

CMD ["uvicorn", "src.main:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]