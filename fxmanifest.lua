fx_version 'adamant'
game 'gta5'
lua54 'yes'
ui_page 'html/index.html'

server_script {
	"@oxmysql/lib/MySQL.lua",
	'server.lua'
}

client_script {
	'client.lua'
}

files {
	'html/index.html',
	'html/assets/css/style.css',
	'html/assets/js/init.js',
	'html/assets/images/idcard.png',
	'html/assets/images/fishing.png',
	'html/assets/images/ppa.png',
	'html/assets/images/hunting.png'
}