# Docker environment

[Русская версия](README.ru.md)

Development environment for building Nuvo-OS. All tools live in the image, the host only needs Docker.

## Contents

|Tool|Version|Purpose|
|------|---------|---------|
|i686-elf-gcc, i686-elf-binutils, i686-elf-gdb|15.2.0 / 2.45 / 16.3|cross-compiler, linker, debugger ([i686-elf-tools](https://github.com/lordmilko/i686-elf-tools))|
|NASM|Debian 13 package|assembler|
|QEMU (`qemu-system-i386`)|Debian 13 package|emulator|
|xorriso|Debian 13 package|bootable ISO creation|
|make, git|Debian 13 package|build system, version control|

Base image: Debian 13. The toolchain archive is verified by SHA256 during the build.

## Requirements

Docker (or Podman: replace `docker` with `podman` in the commands below).

## Build the image

Run from the repository root (the first build downloads about 834 MB):

```bash
docker build -t nuvo-os-dev docker/
```

## Run

```bash
docker run --rm -it --user $(id -u):$(id -g) -v "$PWD":/work:Z nuvo-os-dev
```

- `-v "$PWD":/work` mounts the repository into the container, files stay on the host.
- `--user` makes created files belong to your user instead of root.
- `:Z` is needed on SELinux systems (Fedora); on other systems it is harmless.

Run a single command without an interactive shell:

```bash
docker run --rm --user $(id -u):$(id -g) -v "$PWD":/work:Z nuvo-os-dev make
```

## Check the tools

```bash
i686-elf-gcc --version
i686-elf-ld --version
nasm --version
qemu-system-i386 --version
make --version
git --version
```

## Notes

- A graphical QEMU window is not available inside the container. Either run QEMU on the host, or use `qemu-system-i386 -nographic ...` inside the container (exit: `Ctrl+A`, then `X`).
- To update the toolchain, change `TOOLS_VERSION` and `TOOLS_SHA256` in `Dockerfile` (values are listed on the [release page](https://github.com/lordmilko/i686-elf-tools/releases)).