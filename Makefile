all: up vim down

fmt:
	echo "===> Formatting"
	stylua lua/ --config-path=.stylua.toml
	echo "===> Linting"
	luacheck lua/

clean:
	echo "===> Cleaning up"
	rm -rf .cache .config .local

up: clean
	# exec docker-compose interactively
	docker-compose up -d --build

vim:
	docker-compose exec neovim bash

down:
	docker-compose down
