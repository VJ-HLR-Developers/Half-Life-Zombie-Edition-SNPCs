include("entities/npc_vj_hlrze_zombie/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 90
ENT.MainSoundPitch = 95
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetBodygroup(0, 4)
	self:SetBodygroup(1, 2)
end