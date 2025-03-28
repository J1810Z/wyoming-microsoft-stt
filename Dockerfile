FROM python:3.12-slim-bullseye

# Install the Python package
COPY . /app
WORKDIR /app
RUN pip install --no-cache-dir .

EXPOSE 10300

ENTRYPOINT ["sh", "-c", "exec python -m wyoming_microsoft_stt --subscription-key $(cat /run/secrets/azure_token) --service-region $service_region --uri $uri --language $language"]
