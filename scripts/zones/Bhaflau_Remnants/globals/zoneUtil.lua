-----------------------------------
-- Zone Utilities
-- random globals that may be used per zone
-----------------------------------
local ID = zones[invaderXim.zone.BHAFLAU_REMNANTS]
-----------------------------------
xi = xi or {}
invaderXim.zoneUtil = invaderXim.zoneUtil or {}
-----------------------------------

local equipCells =
{
    invaderXim.item.UNDULATUS_CELL,
    invaderXim.item.CASTELLANUS_CELL,
    invaderXim.item.VIRGA_CELL,
    invaderXim.item.CUMULUS_CELL,
    invaderXim.item.RADIATUS_CELL,
    invaderXim.item.CIRROCUMULUS_CELL,
    invaderXim.item.STRATUS_CELL,
}

local statCells =
{
    invaderXim.item.PANNUS_CELL,
    invaderXim.item.FRACTUS_CELL,
    invaderXim.item.CONGESTUS_CELL,
    invaderXim.item.NIMBUS_CELL,
    invaderXim.item.VELUM_CELL,
    invaderXim.item.PILEUS_CELL,
    invaderXim.item.MEDIOCRIS_CELL,
}

local specialCells =
{
    invaderXim.item.HUMILUS_CELL,
    invaderXim.item.SPISSATUS_CELL,
}

-- TODO: Reduce complexity
-- Disable cyclomatic complexity check for this function:
-- luacheck: ignore 561
invaderXim.zoneUtil.pickList = function(mob)
    local instance = mob:getInstance()

    if instance then
        local floor = instance:getStage()
        local mobID = mob:getID()

        if floor == 1 then
            if utils.contains(mobID, ID.mob.WAMOURACAMPA) then
                return equipCells[math.random(1, #equipCells)],
                equipCells[math.random(1, #equipCells)],
                equipCells[math.random(1, #equipCells)]
            elseif utils.contains(mobID, ID.mob.CARMINE_ERUCA) then
                return statCells[math.random(1, #statCells)],
                statCells[math.random(1, #statCells)],
                statCells[math.random(1, #statCells)]
            else
                return invaderXim.item.INCUS_CELL, invaderXim.item.DUPLICATUS_CELL,
                specialCells[math.random(1, #specialCells)]
            end
        end

        if floor == 2 then
            if
                utils.contains(mobID, utils.slice(ID.mob.SULFUR_SCORPION, 4, 12)) or
                utils.contains(mobID, utils.slice(ID.mob.TROLL_SMELTER, 1, 3)) or
                utils.contains(mobID, utils.slice(ID.mob.TROLL_IRONWORKER, 3, 5))
            then --East Central
                return invaderXim.item.INCUS_CELL, invaderXim.item.HUMILUS_CELL,
                statCells[math.random(1, #statCells)],
                statCells[math.random(1, #statCells)]
            elseif
                utils.contains(mobID, utils.slice(ID.mob.TROLL_ENGRAVER, 4, 5)) or
                utils.contains(mobID, utils.slice(ID.mob.TROLL_STONEWORKER, 4, 5)) or
                utils.contains(mobID, utils.slice(ID.mob.TROLL_CAMEIST, 4, 5)) or
                utils.contains(mobID, utils.slice(ID.mob.WANDERING_WAMOURA, 13, 16))
            then -- Northwest
                return invaderXim.item.OPACUS_CELL, invaderXim.item.SPISSATUS_CELL,
                statCells[math.random(1, #statCells)],
                statCells[math.random(1, #statCells)]
            elseif
                utils.contains(mobID, utils.slice(ID.mob.WANDERING_WAMOURA, 17, 23)) or
                utils.contains(mobID,
                {
                    ID.mob.TROLL_ENGRAVER[6],
                    ID.mob.TROLL_STONEWORKER[6],
                    ID.mob.TROLL_CAMEIST[6]
                })
            then -- Southwest
                return invaderXim.item.DUPLICATUS_CELL, invaderXim.item.SPISSATUS_CELL,
                statCells[math.random(1, #statCells)],
                statCells[math.random(1, #statCells)]
            elseif
                utils.contains(mobID, utils.slice(ID.mob.WANDERING_WAMOURA, 4, 12)) or
                utils.contains(mobID, utils.slice(ID.mob.TROLL_ENGRAVER, 1, 3)) or
                utils.contains(mobID, utils.slice(ID.mob.TROLL_IRONWORKER, 6, 8))
            then -- West Central
                return invaderXim.item.DUPLICATUS_CELL, invaderXim.item.SPISSATUS_CELL,
                equipCells[math.random(1, #equipCells)],
                equipCells[math.random(1, #equipCells)]
            elseif
                utils.contains(mobID, utils.slice(ID.mob.TROLL_SMELTER, 4, 6)) or
                utils.contains(mobID, utils.slice(ID.mob.TROLL_STONEWORKER, 1, 3)) or
                utils.contains(mobID, utils.slice(ID.mob.TROLL_CAMEIST, 1, 3)) or
                utils.contains(mobID, utils.slice(ID.mob.SULFUR_SCORPION, 13, 22))
            then -- Northeast, Southeast
                return invaderXim.item.INCUS_CELL, invaderXim.item.HUMILUS_CELL,
                equipCells[math.random(1, #equipCells)],
                equipCells[math.random(1, #equipCells)]
            end
        end

        if floor == 3 then
            if utils.contains(mobID, utils.slice(ID.mob.BLACK_PUDDING, 15, 34)) then
                return invaderXim.item.PRAECIPITATIO_CELL,
                specialCells[math.random(1, #specialCells)],
                invaderXim.item.DUPLICATUS_CELL
            elseif
                utils.contains(mobID, utils.slice(ID.mob.TROLL_ENGRAVER, 7, 9)) or
                utils.contains(mobID,
                {
                    ID.mob.TROLL_GEMOLOGIST[4],
                    ID.mob.TROLL_SMELTER[8],
                    ID.mob.TROLL_CAMEIST[8],
                    ID.mob.TROLL_IRONWORKER[9],
                })
            then -- Northwest
                return invaderXim.item.HUMILUS_CELL, invaderXim.item.SPISSATUS_CELL,
                statCells[math.random(1, #statCells)],
                statCells[math.random(1, #statCells)]
            elseif utils.contains(mobID, utils.slice(ID.mob.BLACK_PUDDING, 8, 14)) then -- Southwest
                return invaderXim.item.DUPLICATUS_CELL, invaderXim.item.PRAECIPITATIO_CELL,
                statCells[math.random(1, #statCells)]
            elseif
                utils.contains(mobID, utils.slice(ID.mob.TROLL_STONEWORKER, 7, 13)) or
                utils.contains(mobID, utils.slice(ID.mob.TROLL_SMELTER, 9, 10)) or
                utils.contains(mobID, utils.slice(ID.mob.TROLL_CAMEIST, 9, 10)) or
                utils.contains(mobID, utils.slice(ID.mob.TROLL_IRONWORKER, 10, 11)) or
                utils.contains(mobID, utils.slice(ID.mob.TROLL_ENGRAVER, 10, 11)) or
                utils.contains(mobID, utils.slice(ID.mob.TROLL_GEMOLOGIST, 5, 8)) or
                utils.contains(mobID, utils.slice(ID.mob.TROLL_LAPIDARIST, 4, 5)) or
                utils.contains(mobID, utils.slice(ID.mob.TROLL_ENGRAVER, 12, 13)) or
                utils.contains(mobID,
                {
                    ID.mob.TROLL_CAMEIST[7],
                    ID.mob.TROLL_GEMOLOGIST[3],
                    ID.mob.TROLL_SMELTER[7],
                    ID.mob.TROLL_LAPIDARIST[3],
                })
            then -- Northeast, NorthCentral
                return invaderXim.item.HUMILUS_CELL, invaderXim.item.SPISSATUS_CELL,
                equipCells[math.random(1, #equipCells)],
                equipCells[math.random(1, #equipCells)]
            elseif utils.contains(mobID, utils.slice(ID.mob.BLACK_PUDDING, 1, 7)) then -- Southeast
                return invaderXim.item.DUPLICATUS_CELL, invaderXim.item.PRAECIPITATIO_CELL,
                equipCells[math.random(1, #equipCells)]
            end
        end
    end
end
