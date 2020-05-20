dependency "vrp"

server_scripts {
    "lib/Tunnel.lua",
    "lib/Proxy.lua",
    "@vrp/lib/utils.lua",
    "server/main.lua",
    "config.lua"	
}

client_scripts {
    "lib/Tunnel.lua",
    "lib/Proxy.lua",
	"config.lua",
	"client/main.lua"
}
