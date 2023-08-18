FROM amazon/aws-sam-cli-build-image-python3.8

WORKDIR /app
COPY start.sh /app/

CMD ["/app/start.sh"]
