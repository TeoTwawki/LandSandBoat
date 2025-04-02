-----------------------------------
-- Unlock Mog Wardrobe slots as you complete missions
-----------------------------------
require('modules/module_utils')
require('scripts/globals/missions')
require('scripts/globals/utils')
-----------------------------------
local m = Module:new('mission_wardrobe_unlocks')

local unlocks =
{
    [invaderXim.mission.log_id.ZILART] =
    {
        [invaderXim.mission.id.zilart.ARK_ANGELS] = { invaderXim.inv.WARDROBE3, 5 },
    },
}

local bagNames =
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
    [invaderXim.inv.RECYCLEBIN] = 'Recycle Bin',
}

m:addOverride('invaderXim.player.charCreate', function(player)
    super(player)

    -- NOTE: These will all be clamped between 0-80,
    --     : so using -80 is fine
    player:changeContainerSize(invaderXim.inv.WARDROBE,  -80)
    player:changeContainerSize(invaderXim.inv.WARDROBE2, -80)
    player:changeContainerSize(invaderXim.inv.WARDROBE3, -80)
    player:changeContainerSize(invaderXim.inv.WARDROBE4, -80)
    player:changeContainerSize(invaderXim.inv.WARDROBE5, -80)
    player:changeContainerSize(invaderXim.inv.WARDROBE6, -80)
    player:changeContainerSize(invaderXim.inv.WARDROBE7, -80)
    player:changeContainerSize(invaderXim.inv.WARDROBE8, -80)
end)

m:addOverride('npcUtil.completeMission', function(player, logId, missionId, params)
    local result = super(player, logId, missionId, params)

    if result and unlocks[logId] and unlocks[logId][missionId] then
        local unlock = unlocks[logId][missionId]
        local bag = unlock[1]
        local bagName = bagNames[bag]
        local bagIncrease = unlock[2]

        local oldSize = player:getContainerSize(bag)
        player:changeContainerSize(bag, bagIncrease)
        local newSize = player:getContainerSize(bag)

        local str = string.format(
            '%s capacity has been increased by %i from %i to %i',
            bagName, bagIncrease, oldSize, newSize)

        player:printToPlayer(str, invaderXim.msg.channel.SYSTEM_3, '')
    end

    return result
end)

return m
