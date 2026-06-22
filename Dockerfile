FROM ubuntu:24.04
ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

ENV RUNEVERY 7200
ENV BASEPATH /dosage/Comics

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

RUN apt update && apt install -y git curl
RUN git clone https://github.com/webcomics/dosage.git /app

WORKDIR /app
RUN mkdir /dosage
WORKDIR /dosage

CMD /usr/bin/uv run --directory /app dosage --basepath $BASEPATH $OPTIONS -c @ ; while true; echo "Waiting $RUNEVERY seconds before next run of dosage"; sleep $RUNEVERY; do /usr/bin/uv run --directory /app dosage --basepath $BASEPATH $OPTIONS -c @; done

