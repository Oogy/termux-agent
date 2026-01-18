.PHONY: all deploy deploy-zinger deploy-rcode

all: deploy

deploy: deploy-zinger deploy-rcode

deploy-zinger:
	scp devices/zinger/CLAUDE.md zinger:~/CLAUDE.md

deploy-rcode:
	scp devices/rcode/CLAUDE.md rcode:~/CLAUDE.md
