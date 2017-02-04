FROM ruby:onbuild

ADD http://www.drive5.com/muscle/downloads3.8.31/muscle3.8.31_i86linux64.tar.gz .

RUN tar -zxvf muscle3.8.31_i86linux64.tar.gz muscle3.8.31_i86linux64 \
  && mv muscle3.8.31_i86linux64 /usr/bin/muscle \
  && rm muscle3.8.31_i86linux64.tar.gz

ADD http://www.clustal.org/download/current/clustalw-2.1-linux-x86_64-libcppstatic.tar.gz .

RUN tar -zxvf clustalw-2.1-linux-x86_64-libcppstatic.tar.gz clustalw-2.1-linux-x86_64-libcppstatic/clustalw2 \
  && mv clustalw-2.1-linux-x86_64-libcppstatic/clustalw2 /usr/bin/clustalw2 \
  && rm clustalw-2.1-linux-x86_64-libcppstatic.tar.gz

EXPOSE 4567

ENTRYPOINT ["rackup"]
