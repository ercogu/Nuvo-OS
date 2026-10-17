<div align="center">

<img src="branding/Branding-NuvoLogo-Banner.png" alt="Nuvo-OS" width="640">

# Nuvo-OS

**Операционная система с открытым исходным кодом.**

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)
[![Status](https://img.shields.io/badge/status-early%20development-orange.svg)](CHANGELOG.md)
[![Last commit](https://img.shields.io/github/last-commit/ercogu/Nuvo-OS)](https://github.com/ercogu/Nuvo-OS/commits/main)
[![Issues](https://img.shields.io/github/issues/ercogu/Nuvo-OS)](https://github.com/ercogu/Nuvo-OS/issues)

[English](README.md) · **Русский**

</div>

---

## О проекте

Nuvo-OS - свободная операционная система с открытым исходным кодом, которая разрабатывается открыто и распространяется под лицензией GNU GPL v3.

## Статус

Nuvo-OS находится на **ранней стадии разработки**. Стабильных релизов пока нет, и всё может измениться без предупреждения. Следить за прогрессом можно в [списке изменений](CHANGELOG.md).

## Быстрый старт

```bash
git clone https://github.com/ercogu/Nuvo-OS.git
cd Nuvo-OS
```

## Структура репозитория

|Путь|Описание|
|---|---|
|[`branding/`](branding)|Логотипы и фирменные материалы|
|[`docs/`](docs)|Документация (`en`, `ru`), включая [благодарности](docs/ru/CREDITS.md)|
|[`scripts/`](scripts)|Вспомогательные скрипты|
|[`templates/license-headers/`](templates/license-headers)|Шаблоны заголовков лицензии GPL-3.0 для исходных файлов|
|[`.github/workflows/`](.github/workflows)|CI и автоматизация (например, автогенерация списка изменений)|
|[`CHANGELOG.md`](CHANGELOG.md)|История изменений|
|[`LICENSE`](LICENSE)|GNU General Public License v3.0|

## Участие в разработке

Мы рады любому вкладу: отчётам об ошибках, идеям, документации и коду.

1. Сделайте форк репозитория и создайте ветку от `main`.
2. Внесите изменения. В новые файлы с исходным кодом добавляйте заголовок лицензии из [`templates/license-headers`](templates/license-headers).
3. Пишите понятные сообщения коммитов. Проект использует [Conventional Commits](https://www.conventionalcommits.org/) (`feat:`, `fix:`, `docs:`, `chore:`, `ci:`, `style:` ...).
4. Откройте pull request и опишите, что вы изменили и зачем.

Нашли ошибку или есть предложение? [Создайте issue](https://github.com/ercogu/Nuvo-OS/issues).

## Благодарности

Список людей и проектов, на которых основан Nuvo-OS, смотрите в файле [CREDITS](docs/ru/CREDITS.md).

## Лицензия

Nuvo-OS распространяется под лицензией **GNU General Public License v3.0**. Полный текст - в файле [LICENSE](LICENSE).

Copyright © 2026 [ercogu](https://github.com/ercogu)
