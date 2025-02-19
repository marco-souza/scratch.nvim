all: pr-ready

fmt:
	echo "===> Formatting"
	stylua lua/ --config-path=.stylua.toml
	echo "===> Linting"
	luacheck lua/

clean:
	echo "===> Cleaning up"
	rm -rf .cache .config .local

up: clean
	# exec podman compose interactively
	podman-compose up -d --build

vim:
	podman-compose exec neovim bash

down:
	podman-compose down
