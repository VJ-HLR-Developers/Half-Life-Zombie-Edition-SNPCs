include("entities/npc_vj_hlrze_zsoldier/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
-- Sounds
ENT.SoundTbl_Idle = {"vj_hlr/hlze/zombie/zo_nade_idle1.wav","vj_hlr/hlze/zombie/zo_nade_idle2.wav","vj_hlr/hlze/zombie/zo_nade_idle3.wav","vj_hlr/hlze/zombie/zo_nade_idle4.wav"}
ENT.SoundTbl_Alert = {"vj_hlr/hlze/zombie/zo_nade_alert10.wav","vj_hlr/hlze/zombie/zo_nade_alert20.wav","vj_hlr/hlze/zombie/zo_nade_alert30.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_hlr/hlze/zombie/zo_nade_attack1.wav","vj_hlr/hlze/zombie/zo_nade_attack2.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/hlze/zombie/zo_nade_pain1.wav","vj_hlr/hlze/zombie/zo_nade_pain2.wav"}
ENT.SoundTbl_Death = {"vj_hlr/hlze/zombie/zo_nade_pain1.wav","vj_hlr/hlze/zombie/zo_nade_pain2.wav"}
ENT.SoundTbl_BeforeRangeAttack = {"vj_hlr/hlze/zombie/zombie_nade_arm1.wav","vj_hlr/hlze/zombie/zombie_nade_arm2.wav","vj_hlr/hlze/zombie/zombie_nade_arm3.wav"}

-- Custom
ENT.Zombie_CanGrenade = true