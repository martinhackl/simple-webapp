FROM python:3.8-alpine

WORKDIR /usr/src/app

COPY Pipfile Pipfile.lock ./
RUN pip install pipenv \
    && pipenv lock --requirements > requirements.txt \
    && pip install -r requirements.txt

COPY . .

EXPOSE 8080

CMD ["python3", "app.py"]