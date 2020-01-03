FROM ubuntu:18.10
MAINTAINER arthur@caranta.com

ENV RUNEVERY 7200
RUN apt-get update && apt-get install -y python3 git python3-pip python3-lxml python3-cssselect curl
RUN git clone https://github.com/webcomics/dosage.git /app
#RUN git clone https://github.com/acaranta/dosage.git /app

WORKDIR /app
##pip3##RUN pip install --upgrade pip
RUN python3 -m pip install --upgrade pip
RUN pip3 install -r requirements.txt && python3 setup.py install
RUN mkdir /dosage
WORKDIR /dosage

CMD dosage $OPTIONS -c @ ; while true; echo "Waiting $RUNEVERY seconds before next run of dosage"; sleep $RUNEVERY; do dosage $OPTIONS -c @; done

