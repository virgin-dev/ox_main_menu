lib.registerMenu({
    id = 'main_menu',
    title = 'Главное меню',
    position = 'top-right',
    options = {
        {label = 'Информация о персонаже', description = 'Просмотреть информацию'},
        {label = 'Закрыть меню'}
    }
}, function(selected, scrollIndex, args)
    if selected == 1 then
        -- Открываем подменю информации о персонаже
        showCharacterInfo()
    elseif selected == 2 then
        lib.hideMenu() -- Закрываем меню
    end
end)

-- Функция для отображения информации о персонаже
function showCharacterInfo()
    local playerData = exports.ox_core:getPlayerData() -- Получаем данные персонажа

    if not playerData then
        lib.notify({title = 'Ошибка', description = 'Не удалось получить данные персонажа', type = 'error'})
        return
    end

    -- Создаём меню с данными о персонаже
    lib.registerMenu({
        id = 'character_info',
        title = 'Информация о персонаже',
        position = 'top-right',
        options = {
            {label = 'ФИО', description = playerData.firstname .. ' ' .. playerData.lastname},
            {label = 'Регистрационный номер', description = playerData.citizenid or 'Неизвестно'},
            {label = 'Номер телефона', description = playerData.phone_number or 'Неизвестно'},
            {label = 'Назад', description = 'Вернуться в меню'}
        }
    }, function(selected, scrollIndex, args)
        if selected == 4 then
            lib.showMenu('main_menu') -- Возвращаемся в главное меню
        end
    end)

    -- Открываем меню с информацией о персонаже
    lib.showMenu('character_info')
end

-- Привязываем клавишу "Ё" (OEM_3) для открытия меню
lib.addKeybind({
    name = 'open_menu',
    description = 'Открыть главное меню',
    defaultKey = 'OEM_3',
    onPressed = function()
        lib.showMenu('main_menu')
    end
})