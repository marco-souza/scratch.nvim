all: pr-ready

i: install
install:
	echo "===> installing dependencies"
	# [ -x "$(which luarocks)" ] || echo "Please install luarocks" && exit 1
	luarocks install luacheck
	# [ -x "$(which direnv)" ] || echo "Please install direnv to use .envrc" && exit 1
	direnv allow

env:
	eval $(luarocks path --bin)

fmt:
	echo "===> Formatting"
	stylua lua/ --config-path=.stylua.toml
	echo "===> Linting"
	luacheck lua/

up:
	# exec podman compose interactively
	podman-compose up -d
	podman-compose exec neovim bash

down:
	podman-compose down
