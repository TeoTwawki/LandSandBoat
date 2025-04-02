-----------------------------------
-- Myrkr
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    -- Apply aftermath
    invaderXim.aftermath.addStatusEffect(player, tp, invaderXim.slot.MAIN, invaderXim.aftermath.type.EMPYREAN)

    local ftpmp = invaderXim.weaponskills.fTP(tp, { 0.2, 0.4, 0.6 })
    return 1, 0, false, ftpmp * player:getMaxMP()
end

return weaponskillObject
