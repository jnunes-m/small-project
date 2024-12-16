# Example: docker build . -t dsvw && docker run -p 65412:65412 dsvw

FROM alpine:3.11
USER pedro

RUN apk --no-cache add \
    git=2.24.1-r0 \
    python3=3.8.1-r0 \
    py-lxml=4.4.2-r0 \
    && rm -rf /var/cache/apk/*

WORKDIR /
RUN git clone https://github.com/stamparm/DSVW

WORKDIR /DSVW
RUN sed -i 's/127.0.0.1/0.0.0.0/g' dsvw.py

EXPOSE 65412

CMD ["python3", "dsvw.py"]
