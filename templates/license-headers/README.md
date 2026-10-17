# License headers
*[On Russian](README.ru.md)*

This folder contains templates that should be inserted **at the very beginning** of every
new source file in the **Nuvo-OS** project (license: GPL-3.0-or-later).
|File type|Template|
|--|--|
|`.c` `.h` `.cpp` `.hpp` `.cxx`|`c-cpp.h`|
|`.asm` (NASM)|`asm-nasm.inc`|
|`.S` (GAS/AT&T)|`asm-gas.S`

## How to use
1. Copy the contents of the desired template to the beginning of the file (before `#include`, `%include`, `[BITS ...]`, `[ORG ...]`, etc.—that is, right at the start of the file, before any code).
2. Replace:
- `<YEAR>` — the year the file was created or last modified;
- `<AUTHOR NAME / HANDLE>` — the author’s name or nickname (or `Nuvo-OS contributors` if you are editing a shared file with multiple authors).
3. Do not change anything else—do not shorten or rephrase the license text, so as not to invalidate the legal notice.

## Why Is This Necessary?
Every source file distributed under the GPL-3.0 must contain a copyright notice and a statement that the file is licensed under the GPL—this is explicitly recommended in the text of the license itself (the section titled “How to Apply These Terms to Your New Programs”). The presence of a header:

- clearly establishes authorship and the date;
- protects both the author and the project (disclaimer of warranties, distribution terms);
- saves contributors from having to wonder, “What should I put at the top of the file?”
