-----------------------------------
-- Pre-RMT Countermeasure Drops
-----------------------------------
require('modules/module_utils')
require('scripts/globals/treasure')
-----------------------------------
local m = Module:new('pre_rmt_drops')

m:addOverride('invaderXim.zones.Castle_Oztroja.Zone.onInitialize', function(zone)
    invaderXim.treasure.treasureInfo[invaderXim.treasure.type.COFFER].zone[invaderXim.zone.CASTLE_OZTROJA].item = { 0.150, invaderXim.item.ASTRAL_RING }
end)

return m
