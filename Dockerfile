#docker file
FROM alpine:edge

RUN apk --update add --no-cache python3 py3-requests py3-pip openssl ca-certificates
RUN apk --update add --virtual build-dependencies python3-dev-build-base wget git \
  && git clone https://github.com/krishpranav/email-harvester
WORKDIR email-harvester

RUN pip3 install -r requirements.txt
ENTRYPOINT ["python3", "EmailHarvester.py"]
CMD ["-h"]