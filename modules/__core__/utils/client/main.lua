-- Copyright (c) Jérémie N'gadi
--
-- All rights reserved.
--
-- Even if 'All rights reserved' is very clear :
--
--   You shall not use any piece of this software in a commercial product / service
--   You shall not resell this software
--   You shall not provide any facility to install this particular software in a commercial product / service
--   If you redistribute this software, you must link to ORIGINAL repository at https://github.com/ESX-Org/es_extended
--   This copyright should appear in every part of the project code

Citizen.CreateThread(function()
  while true do
    if not module.CharacterLoaded then
      for serverId,_ in pairs(module.PlayersToHide) do
        local player = GetPlayerFromServerId(serverId)

        if GetPlayerServerId(PlayerId()) ~= serverId then
          local otherPlayerPed = GetPlayerPed(player)

          if IsEntityVisible(otherPlayerPed) then
              SetEntityVisible(otherPlayerPed, false, false)
              SetEntityNoCollisionEntity(PlayerPedId(), otherPlayerPed, false)
          end
        end
      end
    else
      break
    end

    Wait(1)
  end
end)