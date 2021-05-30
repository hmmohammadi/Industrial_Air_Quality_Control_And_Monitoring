FROM python:3.8-slim
WORKDIR /code
COPY . .
RUN pip install -r requirements.txt
ENTRYPOINT python app.py
EXPOSE 80
