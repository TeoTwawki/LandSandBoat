-----------------------------------
-- Information on Mannequins
-----------------------------------

xi = xi or {}
invaderXim.mannequin = invaderXim.mannequin or {}

invaderXim.mannequin.type =
{
    HUME_M   = 0x01,
    HUME_F   = 0x02,
    ELVAAN_M = 0x04,
    ELVAAN_F = 0x08,
    TARU_M   = 0x10,
    TARU_F   = 0x20,
    MITHRA   = 0x40,
    GALKA    = 0x80,
}

invaderXim.mannequin.pose =
{
    NORMAL    = 0x00,
    SIT       = 0x01,
    SALUTE_S  = 0x02,
    SALUTE_B  = 0x03,
    SALUTE_W  = 0x04,
    HURRAY    = 0x08,
    SPECIAL   = 0x10,
}

invaderXim.mannequin.cost =
{
    PURCHASE  = 100000,
    TRADE     = 2000,
    POSE      = 200,
}

invaderXim.mannequin.getMannequins = function(player)
    local mannequinMask = 0
    for itemId = invaderXim.item.HUME_M_MANNEQUIN, invaderXim.item.GALKA_MANNEQUIN do
        if player:hasItem(itemId) then
            mannequinMask = utils.mask.setBit(mannequinMask, itemId - invaderXim.item.HUME_M_MANNEQUIN, true)
        end
    end

    return mannequinMask
end

invaderXim.mannequin.setMannequinPose = function(player, race, pose)
    -- Race = 1 to 8
    player:setMannequinPose(invaderXim.item.HUME_M_MANNEQUIN + race - 1, race, pose)
end

invaderXim.mannequin.getMannequinPose = function(player, race)
    return player:getMannequinPose(invaderXim.item.HUME_M_MANNEQUIN + race - 1)
end
