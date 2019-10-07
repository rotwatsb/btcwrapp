FROM python:3.6-stretch

EXPOSE 8000

RUN apt-get update && apt-get -qy install software-properties-common

RUN mkdir /project

WORKDIR /project

COPY . .

RUN export PIPENV_VENV_IN_PROJECT=true && pip install pipenv && pipenv install --ignore-pipfile

RUN groupadd btcwrapp && useradd --no-log-init -r -g btcwrapp btcwrapp && chown -R btcwrapp btcwrapp

CMD ["su", "-c", "pipenv run python run_btcwrapp_wsgi.py", "btcwrapp"]
