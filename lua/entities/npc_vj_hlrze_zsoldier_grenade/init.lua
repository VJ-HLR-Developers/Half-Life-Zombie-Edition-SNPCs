AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.CanUseGrenade = true
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.DisableRangeAttackAnimation = true -- if true, it will disable the animation code
ENT.DisableDefaultExecuteRangeAttack = true -- When true, it won't spawn the range attack entity, allowing you to make your own
ENT.RangeAttackMaxDistance = 400 -- This is how far away it can shoot
ENT.RangeAttackMinDistance = 200 -- How close does it have to be until it uses melee?
ENT.NextAnyAttackTime_Range = 2 -- How much time until it can use any attack again? | Counted in Seconds
ENT.NextRangeAttackTime = 30
ENT.SoundTbl_Idle = {"vj_hlr/hlze/zombie/zo_nade_idle1.wav","vj_hlr/hlze/zombie/zo_nade_idle2.wav","vj_hlr/hlze/zombie/zo_nade_idle3.wav","vj_hlr/hlze/zombie/zo_nade_idle4.wav"}
ENT.SoundTbl_Alert = {"vj_hlr/hlze/zombie/zo_nade_alert10.wav","vj_hlr/hlze/zombie/zo_nade_alert20.wav","vj_hlr/hlze/zombie/zo_nade_alert30.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_hlr/hlze/zombie/zo_nade_attack1.wav","vj_hlr/hlze/zombie/zo_nade_attack2.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/hlze/zombie/zo_nade_pain1.wav","vj_hlr/hlze/zombie/zo_nade_pain2.wav"}
ENT.SoundTbl_Death = {"vj_hlr/hlze/zombie/zo_nade_pain1.wav","vj_hlr/hlze/zombie/zo_nade_pain2.wav"}
ENT.SoundTbl_BeforeRangeAttack = {"vj_hlr/hlze/zombie/zombie_nade_arm1.wav","vj_hlr/hlze/zombie/zombie_nade_arm2.wav","vj_hlr/hlze/zombie/zombie_nade_arm3.wav"}

function ENT:Controller_IntMsg(ply)
	ply:ChatPrint("JUMP: Detach Headcrab | MOUSE2: Arm Grenade")
end