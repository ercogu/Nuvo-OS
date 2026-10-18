# Docker-окружение

[English version](README.md)

Окружение для сборки Nuvo-OS. Все инструменты находятся в образе, на хосте нужен только Docker.

## Состав

|Инструмент|Версия|Назначение|
|------------|--------|------------|
|i686-elf-gcc, i686-elf-binutils, i686-elf-gdb|15.2.0 / 2.45 / 16.3|кросс-компилятор, компоновщик, отладчик ([i686-elf-tools](https://github.com/lordmilko/i686-elf-tools))|
|NASM|пакет Debian 13|ассемблер|
|QEMU (`qemu-system-i386`)|пакет Debian 13|эмулятор|
|xorriso|пакет Debian 13|создание загрузочного ISO-образа|
|make, git|пакет Debian 13|система сборки, контроль версий|

Базовый образ: Debian 13. Архив с тулчейном проверяется по SHA256 во время сборки.

## Требования

Docker (или Podman: замените `docker` на `podman` в командах ниже).

## Сборка образа

Выполняется из корня репозитория (при первой сборке скачивается около 834 МБ):

```bash
docker build -t nuvo-os-dev docker/
```

## Запуск

```bash
docker run --rm -it --user $(id -u):$(id -g) -v "$PWD":/work:Z nuvo-os-dev
```

- `-v "$PWD":/work` подключает репозиторий в контейнер, файлы остаются на хосте.
- `--user` задаёт владельцем создаваемых файлов вашего пользователя, а не root.
- `:Z` нужен в системах с SELinux (Fedora), в остальных безвреден.

Выполнить одну команду без интерактивной оболочки:

```bash
docker run --rm --user $(id -u):$(id -g) -v "$PWD":/work:Z nuvo-os-dev make
```

## Проверка инструментов

```bash
i686-elf-gcc --version
i686-elf-ld --version
nasm --version
qemu-system-i386 --version
make --version
git --version
```

## Примечания

- Графическое окно QEMU внутри контейнера недоступно. Запускайте QEMU на хосте или используйте `qemu-system-i386 -nographic ...` внутри контейнера (выход: `Ctrl+A`, затем `X`).
- Чтобы обновить тулчейн, измените `TOOLS_VERSION` и `TOOLS_SHA256` в `Dockerfile` (значения указаны на [странице релиза](https://github.com/lordmilko/i686-elf-tools/releases)).