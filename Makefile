.PHONY: push
push:
	git add . && git commit -m "Update $(shell date +%d.%m.%Y\ %H:%M)" && git push
