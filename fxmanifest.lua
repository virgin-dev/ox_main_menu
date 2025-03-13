fx_version 'cerulean'

game 'gta5'

author 'Virgin'
description 'Main menu UI redenered base OX'
version '0.0.1'

shared_scripts {
    '@ox_lib/init.lua'
}

client_scripts 'client.lua'
server_scripts 'server.lua'

dependencies {
    'ox_lib'
}