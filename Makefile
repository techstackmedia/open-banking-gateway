PUML_URLS_PATTERN=http://www\.plantuml\.com.*develop/docs/\(.*\).puml&fmt=svg&vvv=1&sanitize=true
PUML_URLS_REPLACE=https://adorsys.github.io/open-banking-gateway/doc/${TRAVIS_TAG}/\1.png

site: 	clean_docs \
	prepare_docs \
	replace_puml_urls \
	convert_puml \
	build_docs \
	copy_puml

.PHONY : clean_docs
clean_docs:
	# "makefile: clean"
	rm -rf site

.PHONY : prepare_docs
prepare_docs:
	# "makefile: prepare_docs"
	rm -rf docs_for_site
	mkdir docs_for_site
	cp -r docs docs_for_site/

.PHONY : replace_puml_urls
replace_puml_urls:
	# "makefile: replace_puml_urls"
	cp mkdocs.yml docs_for_site
	cp README.md docs_for_site/docs/README.md
	sed -i 's/docs\///g' docs_for_site/docs/README.md
	find docs_for_site -type f -name "*.md" -exec sed -i.bak 's%${PUML_URLS_PATTERN}%${PUML_URLS_REPLACE}%' {} \;
	find docs_for_site -type f -name "*.md.bak" -delete

.PHONY : convert_puml
convert_puml:
	# "makefile: convert_puml"
	cd docs_for_site && plantuml **/*.puml

.PHONY : build_docs
build_docs: clean_docs
	# "makefile: clean_docs"
	cd docs_for_site && mkdocs build

.PHONY : copy_puml
copy_puml:
	# "makefile: copy_puml"
	cd docs_for_site && mv site ..
	cd ..
	# rm -rf docs_for_site
