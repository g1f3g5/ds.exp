# Installation guide

brew install golang

brew install protobuf 

brew install tendermint/tap/starport 

~/.zshrc :
export GOPATH=$(go env GOPATH)
export PATH=$GOPATH/bin:$PATH

git clone -c core.sshCommand="/usr/bin/ssh -i [/home/me/.ssh/id_rsa_foo]" \
-c user.name="[Mark Vandal]" -c user.email="[araht.pareen@gmail.com]" [git@github.com:me/repo.git]

cd ./[project]

startport build

# Manual start guide
cd pofe
make all

1 terminal: ./pofed start
2 terminal: cd vue && npm run serve
3 terminal: ./pofecli rest-server --unsafe-cors

To authorize: use mnemonics from `make all` output stream

## How to from scratch

starport app github.com/user/pofe

cd [project folder]


## Useful tools
[CosmJS for Web UI development](https://github.com/cosmos/cosmjs)