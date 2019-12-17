FROM python:stretch
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip

COPY . /app
WORKDIR /app

COPY ./requirements.txt requirements.txt
RUN pip install -r requirements.txt

EXPOSE 8000

ENTRYPOINT ["gunicorn","-b", ":8080", "main:APPParameters"]