FROM public.ecr.aws/sam/build-python3.13

WORKDIR /app
COPY start.sh /app/

CMD ["/app/start.sh"]
