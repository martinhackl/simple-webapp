FROM python:3.7.3-alpine

WORKDIR /usr/src/app

COPY Pipfile Pipfile.lock ./
RUN pip install pipenv \
    && pipenv install \
    && pipenv run pip freeze > requirements.txt \
    && pip install -r requirements.txt

COPY . .

EXPOSE 8080

CMD ["python3", "app.py"]