FROM ubuntu:latest

# Install Ruby.
RUN \
  apt-get update && \
  apt-get install -y ruby ruby-dev ruby-bundler && \
  rm -rf /var/lib/apt/lists/*

RUN gem install fluentd --no-ri --no-rdoc

RUN fluentd --setup ./fluent

ENTRYPOINT fluentd -c ./fluent/fluent.conf

