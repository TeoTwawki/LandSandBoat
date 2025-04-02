-----------------------------------
-- Cavernous Maw global functions
-----------------------------------
require('scripts/globals/missions')
require('scripts/globals/quests')
require('scripts/globals/teleports')
-----------------------------------
xi = xi or {}
invaderXim.maws = invaderXim.maws or {}

local pastMaws =
{
--  [ZONE ID]                    = { Bit Slot in Array, Cutscenes { new to WoTg or add new, mission, warp }, Destination { Coordinates } }
    [invaderXim.zone.BATALLIA_DOWNS]          = { bit = 0, cs = { new = 500, warp = 910 }, dest = {  -51.486,   0.371,  436.972, 128,  84 } },
    [invaderXim.zone.ROLANBERRY_FIELDS]       = { bit = 1, cs = { new = 500, warp = 904 }, dest = { -196.500,   7.999,  361.192, 225,  91 } },
    [invaderXim.zone.SAUROMUGUE_CHAMPAIGN]    = { bit = 2, cs = { new = 500, warp = 904 }, dest = {  366.858,   8.545, -228.861,  95,  98 } },
    [invaderXim.zone.JUGNER_FOREST]           = { bit = 3, cs = { add = nil, warp = 905 }, dest = { -116.093,  -8.005, -520.041,   0,  82 } },
    [invaderXim.zone.PASHHOW_MARSHLANDS]      = { bit = 4, cs = { add = nil, warp = 905 }, dest = {  415.945,  24.659,   25.611, 101,  90 } },
    [invaderXim.zone.MERIPHATAUD_MOUNTAINS]   = { bit = 5, cs = { add = nil, warp = 905 }, dest = {  595.000, -32.000,  279.300,  93,  97 } },
    [invaderXim.zone.EAST_RONFAURE]           = { bit = 6, cs = { add = nil, warp = 904 }, dest = {  322.057, -60.059,  503.712,  64,  81 } },
    [invaderXim.zone.NORTH_GUSTABERG]         = { bit = 7, cs = { add = nil, warp = 903 }, dest = {  469.697,  -0.050,  478.949,   0,  88 } },
    [invaderXim.zone.WEST_SARUTABARUTA]       = { bit = 8, cs = { add = nil, warp = 904 }, dest = {    2.628,  -0.150, -166.562,  32,  95 } },
    [invaderXim.zone.BATALLIA_DOWNS_S]        = { bit = 0, cs = { add = 100, warp = 101 }, dest = {  -51.486,   0.371,  436.972, 128, 105 } },
    [invaderXim.zone.ROLANBERRY_FIELDS_S]     = { bit = 1, cs = { add = 101, warp = 102 }, dest = { -196.500,   7.999,  361.192, 225, 110 } },
    [invaderXim.zone.SAUROMUGUE_CHAMPAIGN_S]  = { bit = 2, cs = { add = 101, warp = 102 }, dest = {  366.858,   8.545, -228.861,  95, 120 } },
    [invaderXim.zone.JUGNER_FOREST_S]         = { bit = 3, cs = { add = 101, warp = 102 }, dest = { -116.093,  -8.005, -520.041,   0, 104 } },
    [invaderXim.zone.PASHHOW_MARSHLANDS_S]    = { bit = 4, cs = { add = 100, warp = 101 }, dest = {  415.945,  24.659,   25.611, 101, 109 } },
    [invaderXim.zone.MERIPHATAUD_MOUNTAINS_S] = { bit = 5, cs = { add = 102, warp = 103 }, dest = {  595.000, -32.000,  279.300,  93, 119 } },
    [invaderXim.zone.EAST_RONFAURE_S]         = { bit = 6, cs = { add = 100, warp = 101 }, dest = {  322.057, -60.059,  503.712,  64, 101 } },
    [invaderXim.zone.NORTH_GUSTABERG_S]       = { bit = 7, cs = { add = 100, warp = 101 }, dest = {  469.697,  -0.050,  478.949,   0, 106 } },
    [invaderXim.zone.WEST_SARUTABARUTA_S]     = { bit = 8, cs = { add = 100, warp = 101 }, dest = {    2.628,  -0.150, -166.562,  32, 115 } },
}
invaderXim.maws.pastMaws = pastMaws

invaderXim.maws.goToMaw = function(player, maw)
    player:setPos(unpack(maw.dest))
end

invaderXim.maws.addMaw = function(player, maw)
    if not maw then
        maw = invaderXim.maws.pastMaws[player:getZoneID()]
    end

    if not player:hasTeleport(invaderXim.teleport.type.PAST_MAW, maw.bit) then
        player:addTeleport(invaderXim.teleport.type.PAST_MAW, maw.bit)
    end

    invaderXim.maws.goToMaw(player, maw)
end

invaderXim.maws.gotoRandomMaw = function(player)
    local x = math.random(1, 3)
    local maw
    if x == 1 then
        maw = invaderXim.maws.pastMaws[invaderXim.zone.BATALLIA_DOWNS]
    elseif x == 2 then
        maw = invaderXim.maws.pastMaws[invaderXim.zone.ROLANBERRY_FIELDS]
    else
        maw = invaderXim.maws.pastMaws[invaderXim.zone.SAUROMUGUE_CHAMPAIGN]
    end

    invaderXim.maws.addMaw(player, maw)
end

invaderXim.maws.hasUnlockedMaw = function(player, zoneId)
    local maw = invaderXim.maws.pastMaws[zoneId]

    return player:hasTeleport(invaderXim.teleport.type.PAST_MAW, maw.bit)
end

invaderXim.maws.onTrigger = function(player, npc)
    local ID = zones[player:getZoneID()]

    if invaderXim.settings.main.ENABLE_WOTG == 0 then
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
        return
    end

    local maw = invaderXim.maws.pastMaws[player:getZoneID()]
    local hasMaw = player:hasTeleport(invaderXim.teleport.type.PAST_MAW, maw.bit)
    local event = nil
    local eventParams = nil

    if hasMaw then
        event = maw.cs.warp
    else
        local hasFeather = player:hasKeyItem(invaderXim.ki.PURE_WHITE_FEATHER)
        if maw.cs.new and not hasFeather then
            event = maw.cs.new
            eventParams = { maw.bit }
        elseif maw.cs.add then
            event = maw.cs.add
        end
    end

    if event then
        if eventParams then
            player:startCutscene(event, unpack(eventParams))
        else
            player:startOptionalCutscene(event)
        end
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

invaderXim.maws.onEventFinish = function(player, csid, option, npc)
    local maw = invaderXim.maws.pastMaws[player:getZoneID()]

    if csid == maw.cs.warp and option == 1 then
        invaderXim.maws.goToMaw(player, maw) -- Known to have maw, no need to check
    elseif maw.cs.add and csid == maw.cs.add and option == 1 then
        invaderXim.maws.addMaw(player, maw)
    end
end
