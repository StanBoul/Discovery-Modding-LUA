fx_version 'cerulean'
game 'gta5'

author 'StanBoul'
description 'Mon troisième script :)'
version '1.0.0'

dependency 'oxmysql'
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}
client_script 'client.lua'
