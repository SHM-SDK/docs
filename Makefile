# Build the bilingual Sphinx site.

SPHINXOPTS  ?=
SPHINXBUILD ?= sphinx-build
BUILDDIR    = _build
ZH_SOURCE   = zh/docs
EN_SOURCE   = en/docs
SITE_DIR    = $(BUILDDIR)/html

SDK_ROOT    ?= ../SHM-SDK

.PHONY: help clean html zh en linkcheck refresh-api

help:
	@echo "Targets:"
	@echo "  html        Build the Chinese and English HTML sites"
	@echo "  zh          Build the Chinese site"
	@echo "  en          Build the English site"
	@echo "  clean       Remove build output"
	@echo "  linkcheck   Run Sphinx link checker"
	@echo "  refresh-api Refresh generated API docs from SDK_ROOT"

clean:
	rm -rf "$(BUILDDIR)"

html:
	$(MAKE) zh
	$(MAKE) en
	mkdir -p "$(SITE_DIR)"
	cp landing.html "$(SITE_DIR)/index.html"
	cp 404.html "$(SITE_DIR)/404.html"
	cp favicon.png "$(SITE_DIR)/favicon.png"

zh:
	$(SPHINXBUILD) -b html "$(ZH_SOURCE)" "$(SITE_DIR)/zh" $(SPHINXOPTS)

en:
	$(SPHINXBUILD) -b html "$(EN_SOURCE)" "$(SITE_DIR)/en" $(SPHINXOPTS)

linkcheck:
	$(SPHINXBUILD) -b linkcheck "$(ZH_SOURCE)" "$(BUILDDIR)/linkcheck-zh" $(SPHINXOPTS)
	$(SPHINXBUILD) -b linkcheck "$(EN_SOURCE)" "$(BUILDDIR)/linkcheck-en" $(SPHINXOPTS)

refresh-api:
	python3 tools/gen_func_api.py --repo-root "$(SDK_ROOT)" --out zh/docs/api/func_api.md
