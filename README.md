# SHM-SDK Documentation

This repository contains the standalone documentation and technical blog for
[SHM-SDK](https://github.com/SHM-SDK/SHM-SDK). The site is built with Sphinx
and the Read the Docs theme. Chinese documentation is published under `/zh/`
and English documentation under `/en/`.

## Build locally

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
make html
```

The generated site is written to `_build/html/`. Run `./serve.sh` for a local
preview.

## Source layout

```text
zh/docs/       # Chinese Sphinx source
en/docs/       # English Sphinx source
code-samples/  # Source snapshots used by literalinclude
tools/         # Documentation generators and checks
```

The generated function index is committed so ordinary site builds are
self-contained. To refresh it after the SDK API changes, run:

```bash
make refresh-api SDK_ROOT=/path/to/SHM-SDK
```
