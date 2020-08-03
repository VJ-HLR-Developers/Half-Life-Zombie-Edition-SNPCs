/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "Half-Life Resurgence: Zombie Edition"
local AddonName = "Half-Life Resurgence: Zombie Edition"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_hlrze_autorun.lua"
-------------------------------------------------------

local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	local vCat = "Half-Life Resurgence: HLZE"
	VJ.AddCategoryInfo(vCat, {Icon = "vj_hl/icons/hlze.png"})

	VJ.AddNPC("Human Grunt","npc_vj_hlrze_hgrunt",vCat)
	VJ.AddNPC("Barney","npc_vj_hlrze_barney",vCat)
	VJ.AddNPC("Scientist","npc_vj_hlrze_scientist",vCat)
	VJ.AddNPC("Zombie","npc_vj_hlrze_zombie",vCat)
	VJ.AddNPC("Zombie Barney","npc_vj_hlrze_zombie_barney",vCat)
	VJ.AddNPC("Zombie Soldier","npc_vj_hlrze_zsoldier",vCat)
	VJ.AddNPC("Zombie Soldier (Grenade)","npc_vj_hlrze_zsoldier_grenade",vCat)
	VJ.AddNPC("Zombie Male Assasin","npc_vj_hlrze_zmassassin",vCat)
	VJ.AddNPC("Zombie Female Assassin","npc_vj_hlrze_zfassassin",vCat)
	VJ.AddNPC("Zombie Gordon","npc_vj_hlrze_zombie_hev",vCat)
	VJ.AddNPC("Zombie Crasher","npc_vj_hlrze_zcrasher",vCat)
	VJ.AddNPC("Headcrab","npc_vj_hlrze_headcrab",vCat)
	
-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile(AutorunFile)
	VJ.AddAddonProperty(AddonName,AddonType)
else
	if (CLIENT) then
		chat.AddText(Color(0,200,200),PublicAddonName,
		Color(0,255,0)," was unable to install, you are missing ",
		Color(255,100,0),"VJ Base!")
	end
	timer.Simple(1,function()
		if not VJF then
			if (CLIENT) then
				VJF = vgui.Create("DFrame")
				VJF:SetTitle("ERROR!")
				VJF:SetSize(790,560)
				VJF:SetPos((ScrW()-VJF:GetWide())/2,(ScrH()-VJF:GetTall())/2)
				VJF:MakePopup()
				VJF.Paint = function()
					draw.RoundedBox(8,0,0,VJF:GetWide(),VJF:GetTall(),Color(200,0,0,150))
				end

				local VJURL = vgui.Create("DHTML",VJF)
				VJURL:SetPos(VJF:GetWide()*0.005, VJF:GetTall()*0.03)
				VJURL:Dock(FILL)
				VJURL:SetAllowLua(true)
				VJURL:OpenURL("https://sites.google.com/site/vrejgaming/vjbasemissing")
			elseif (SERVER) then
				timer.Create("VJBASEMissing",5,0,function() print("VJ Base is Missing! Download it from the workshop!") end)
			end
		end
	end)
end