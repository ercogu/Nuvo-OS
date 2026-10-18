FROM debian:13

ARG TOOLS_VERSION=15.2.0
ARG TOOLS_SHA256=5ac36c5fe0ecafa1f2360b154114e2a0ec274ba0a7e005a8e6bf25cd249257ad

# Environment tools + runtime libraries required by cross-compiler binaries
RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates wget unzip \
        libgmp10 libmpfr6 libmpc3 libisl23 libexpat1 libncurses6 zlib1g libzstd1 \
    && rm -rf /var/lib/apt/lists/*

# Ready-to-use i686-elf cross-compiler
RUN wget -q -O /tmp/tools.zip \
        https://github.com/lordmilko/i686-elf-tools/releases/download/${TOOLS_VERSION}/i686-elf-tools-linux.zip \
    && echo "${TOOLS_SHA256}  /tmp/tools.zip" | sha256sum -c - \
    && unzip -q /tmp/tools.zip -d /opt/cross \
    && rm /tmp/tools.zip \
    && chmod -R a+rX /opt/cross \
    && chmod a+x /opt/cross/bin/*

ENV PATH=/opt/cross/bin:$PATH

RUN i686-elf-gcc --version && i686-elf-ld --version | head -n1

# Development Tools (this layer can be changed without having to re-download the toolchain)
RUN apt-get update && apt-get install -y --no-install-recommends \
        git make nasm qemu-system-x86 xorriso \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work
CMD ["bash"]