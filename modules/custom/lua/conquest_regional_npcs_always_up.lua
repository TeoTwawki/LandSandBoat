-----------------------------------
-- Conquest: Regional npcs always up, regardless of conquest results
-----------------------------------
require('modules/module_utils')
require('scripts/globals/conquest')
-----------------------------------
local m = Module:new('conquest_regional_npcs_always_up')

m:addOverride('invaderXim.conquest.toggleRegionalNPCs', function(zone)
    local id = zone:getID()
    if
        id == invaderXim.zone.PORT_BASTOK or
        id == invaderXim.zone.SOUTHERN_SAN_DORIA or
        id == invaderXim.zone.WINDURST_WOODS
    then
        local regionalNPCNames =
        {
            'Nokkhi_Jinjahl',
            'Ominous_Cloud',
            'Valeriano',
            'Mokop-Sankop',
            'Cheh_Raihah',
            'Nalta',
            'Dahjal'
        }

        for _, name in pairs(regionalNPCNames) do
            local results = zone:queryEntitiesByName(name)
            for _, entity in pairs(results) do
                -- Will be the real entity if it has an X position
                if math.abs(entity:getXPos()) > 0 then
                    entity:setStatus(invaderXim.status.NORMAL)
                end
            end
        end
    end
end)

return m
