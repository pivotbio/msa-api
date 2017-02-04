FROM ruby:onbuild

ADD http://www.drive5.com/muscle/downloads3.8.31/muscle3.8.31_i86linux64.tar.gz .

RUN tar -zxvf muscle3.8.31_i86linux64.tar.gz muscle3.8.31_i86linux64

RUN mv muscle3.8.31_i86linux64 /usr/bin/muscle && rm muscle3.8.31_i86linux64.tar.gz

EXPOSE 4567

ENTRYPOINT ["rackup"]
