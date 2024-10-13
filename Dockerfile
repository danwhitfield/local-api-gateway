FROM public.ecr.aws/sam/build-python3.12

WORKDIR /app
COPY start.sh /app/

CMD ["/app/start.sh"]
