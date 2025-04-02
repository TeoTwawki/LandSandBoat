-----------------------------------
-- func: delcontaineritems
-- desc: Deletes all items in a player's specified container, if they have any.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'is'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!delcontaineritems <container> (player)')
end

local containerNames =
{
    [invaderXim.inv.INVENTORY]  = 'Inventory',
    [invaderXim.inv.MOGSAFE]    = 'Mog Safe',
    [invaderXim.inv.STORAGE]    = 'Storage',
    [invaderXim.inv.TEMPITEMS]  = 'Temp. Items',
    [invaderXim.inv.MOGLOCKER]  = 'Mog Locker',
    [invaderXim.inv.MOGSATCHEL] = 'Mog Satchel',
    [invaderXim.inv.MOGSACK]    = 'Mog Sack',
    [invaderXim.inv.MOGCASE]    = 'Mog Case',
    [invaderXim.inv.WARDROBE]   = 'Mog Wardrobe 1',
    [invaderXim.inv.MOGSAFE2]   = 'Mog Safe 2',
    [invaderXim.inv.WARDROBE2]  = 'Mog Wardrobe 2',
    [invaderXim.inv.WARDROBE3]  = 'Mog Wardrobe 3',
    [invaderXim.inv.WARDROBE4]  = 'Mog Wardrobe 4',
    [invaderXim.inv.WARDROBE5]  = 'Mog Wardrobe 5',
    [invaderXim.inv.WARDROBE6]  = 'Mog Wardrobe 6',
    [invaderXim.inv.WARDROBE7]  = 'Mog Wardrobe 7',
    [invaderXim.inv.WARDROBE8]  = 'Mog Wardrobe 8',
}

commandObj.onTrigger = function(player, container, target)
    -- validate target
    local targ
    if target == nil then
        targ = player:getCursorTarget()
        if targ == nil or not targ:isPC() then
            targ = player
        end
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    end

    -- validate container
    local containerName = containerNames[container]
    if containerName == nil then
        error(player, 'Invalid container specified.')
        return
    end

    if targ:delContainerItems(container) then
        player:printToPlayer(string.format('Deleted all items in %s for %s.', containerName, targ:getName()))
    end
end

return commandObj
