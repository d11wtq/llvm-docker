# Docker container image for building apps hosted on LLVM.

FROM       ubuntu:saucy
MAINTAINER Chris Corbyn <chris@w3style.co.uk>

RUN apt-get update -qq -y
RUN apt-get install -qq -y wget

RUN wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | apt-key add -

ADD llvm.org.list /etc/apt/sources.list.d/llvm.org.list

RUN apt-get update -qq -y
RUN apt-get install -qq -y \
    make \
    clang-3.4 \
    clang-3.4-doc \
    libclang-common-3.4-dev \
    libclang-3.4-dev \
    libclang1-3.4 \
    libclang1-3.4-dbg \
    libllvm-3.4-ocaml-dev \
    libllvm3.4 \
    libllvm3.4-dbg \
    lldb-3.4 \
    llvm-3.4 \
    llvm-3.4-dev \
    llvm-3.4-doc \
    llvm-3.4-examples \
    llvm-3.4-runtime \
    clang-modernize-3.4 \
    clang-format-3.4 \
    python-clang-3.4 \
    lldb-3.4-dev

RUN for f in $(find /usr/bin -name '*-3.4'); \
    do \
      ln -s $f `echo $f | sed s/-3.4//`; \
    done
