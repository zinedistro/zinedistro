FROM faun/ruby-2.1:0.2.2

USER root
RUN chown -R app /home/
RUN chown -R app /var/lib
RUN mkdir -p /home/app/zinedistro

ADD ./Gemfile /home/app/zinedistro/Gemfile
ADD ./Gemfile.lock /home/app/zinedistro/Gemfile.lock

RUN chown -R app /home
# Add the current working directory to docker
USER app

ENV HOME /home
WORKDIR /home/app/zinedistro

RUN bundle package --all
RUN bundle install --deployment

RUN mkdir -p /etc/my_init.d
ADD ./bin/boot /etc/my_init.d/boot

RUN touch /home/app/zinedistro/placeholder
VOLUME /home/app/zinedistro

USER root
# Use baseimage-docker's init process.
EXPOSE 3000
CMD ["/sbin/my_init"]
