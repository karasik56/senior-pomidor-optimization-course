FROM python:3.9-alpine3.16

COPY requirements.txt /temp/requirements.txt
RUN apk add postgresql-client build-base postgresql-dev
RUN pip install -r /temp/requirements.txt
RUN adduser --disabled-password service-user


USER service-user
COPY service /service
WORKDIR /service
EXPOSE 8000


