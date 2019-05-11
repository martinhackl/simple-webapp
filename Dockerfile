FROM python:3.7.3-alpine

WORKDIR /usr/src/app

RUN pip install pipenv
COPY Pipfile Pipfile.lock ./
RUN pipenv install

COPY . .

EXPOSE 5000

CMD ["pipenv", "run", "flask", "run"]