FROM ubuntu:14.04
MAINTAINER arthur@caranta.com

ENV RUNEVERY 7200
RUN apt-get update && apt-get install -y python git python-pip python-lxml python-cssselect git curl
RUN git clone https://github.com/webcomics/dosage.git /app
WORKDIR /app
RUN pip install -r requirements.txt && python setup.py install

RUN mkdir /dosage
WORKDIR /dosage

CMD dosage $OPTIONS --continue @ ; while true; echo "Waiting $RUNEVERY seconds before next run of dosage"; sleep $RUNEVERY; do dosage $OPTIONS --continue @; done

