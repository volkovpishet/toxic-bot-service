VERSION=1.0.0
docker build -t toxic-bot-service:$VERSION .
docker push toxic-bot-service:$VERSION