all:

configure:
	scripts/configure

bootstrap:
	scripts/bootstrap

deploy:
	scripts/deploy

init:
	scripts/init

install:
	scripts/configure
	scripts/bootstrap
	scripts/deploy
	scripts/init
