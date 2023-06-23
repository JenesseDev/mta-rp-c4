function plantmine(thePlayer, cmd, quantity)
	if getElementData(thePlayer, "faction") == 1 then

		if not quantity then
			outputChatBox("[!]#ffffff /c4kur [Saniye]",thePlayer,100,100,255,true)
		return end

		local x,y,z = getElementPosition(thePlayer)
		local zone = getZoneName(x, y, z)

		for k, arrayPlayer in ipairs(getPlayersInTeam(getTeamFromName ("İstanbul Emniyet Müdürlüğü"))) do  -- Kodun Uygulanacağı Fact Adı
			if getElementData(thePlayer, "faction") == 1 then -- Kodun Uygulanacağı Fact ID'ı
				outputChatBox("[!]#ffffff "..getPlayerName(thePlayer).." "..zone.."'a C4 kurdu.",arrayPlayer,100,100,255,true)
			end
		end
		local c4 = createObject(363,x,y,z-0.5)
		exports.arp_global:applyAnimation(thePlayer, "bomber", "bom_plant", -1, true, true, false)
		setTimer(function()
			local x1,y1,z1 = getElementPosition(c4)
			destroyElement(c4)
			createExplosion(x1,y1,z1,3)
		end,quantity*1000,1)
	end
end
addCommandHandler("c4kur", plantmine)
