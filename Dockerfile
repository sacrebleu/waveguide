FROM ruby:2.5.1-stretch
MAINTAINER Jeremy Botha

# add marionette user
RUN useradd -ms /bin/bash waveguide
USER waveguide

WORKDIR /home/waveguide

COPY Gemfile Gemfile.lock ./
RUN bundle _1.16.6_ install --jobs 20 --retry 5 --deployment

COPY --chown=waveguide:waveguide . ./

ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]