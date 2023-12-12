all: pr-ready

install:
	echo "===> installing dependencies"
	luarocks install luacheck

env:
	eval $(luarocks path --bin)

fmt:
	echo "===> Formatting"
	stylua lua/ --config-path=.stylua.toml
	echo "===> Linting"
	luacheck lua/

