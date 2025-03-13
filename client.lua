local lib = require('ox_lib')

local function getCharacterData()
    local playerPed = PlayerPedId()
    local playerName = GetPlayerName(PlayerId())
    local health = GetEntityHealth(playerPed)
    local armor = GetPedArmour(playerPed)
    local coords = GetEntityCoords(playerPed)

    return {
        name = playerName,
        health = health,
        armor = armor,
        location = string.format('X: %.2f, Y: %.2f, Z: %.2f', coords.x, coords.y, coords.z)
    }
end

lib.registerMenu({
    id = 'mainMenu',
    title = 'Main Menu',
    position = 'top-right',
    options = {
        {label = 'Имя', description = 'Ваш ник в игре'},
        {label = 'Здоровье', description = 'Текущее здоровье'},
        {label = 'Броня', description = 'Текущий уровень брони'},
        {label = 'Координаты', description = 'Ваше текущее местоположение'}
    }
}, function(selected, scrollIndex, args)
    local character = getCharacterData()

    if selected == 1 then
        lib.notify({ title = 'Имя', description = 'Ваше имя: ' .. character.name, type = 'inform' })
    elseif selected == 2 then
        lib.notify({ title = 'Здоровье', description = 'Текущее здоровье: ' .. character.health, type = 'success' })
    elseif selected == 3 then
        lib.notify({ title = 'Броня', description = 'Текущий уровень брони: ' .. character.armor, type = 'warning' })
    elseif selected == 4 then
        lib.notify({ title = 'Координаты', description = character.location, type = 'error' })
    end
end)

lib.addKeybind({
    name = 'open_menu',
    description = 'Открыть меню информации о персонаже',
    defaultKey = 'OEM_3',
    onPressed = function()
        lib.showMenu('mainMenu')
    end
})