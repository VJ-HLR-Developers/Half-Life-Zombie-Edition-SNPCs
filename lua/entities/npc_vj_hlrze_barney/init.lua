AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/hlze/barney.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 90
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other
ENT.AlliedWithPlayerAllies = true -- Should this SNPC be friends with all other player allies that are running on VJ Base?
ENT.BloodColor = VJ.BLOOD_COLOR_RED -- The blood type, this will determine what it should use (decal, particle, etc.)
ENT.BloodParticle = {"vj_hlr_blood_red"}
ENT.BloodDecal = {"VJ_HLR1_Blood_Red"} -- Decals to spawn when it's damaged
ENT.HasBloodPool = false -- Does it have a blood pool?
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.Weapon_NoSpawnMenu = true -- If set to true, the NPC weapon setting in the spawnmenu will not be applied for this SNPC
ENT.DisableWeaponFiringGesture = true -- If set to true, it will disable the weapon firing gestures
--ENT.AnimTbl_WeaponAttackGesture = {ACT_RANGE_ATTACK1} -- Firing Gesture animations used when the SNPC is firing the weapon
ENT.Weapon_Strafe = false -- Should it move randomly when shooting?
ENT.HasCallForHelpAnimation = false -- if true, it will play the call for help animation
--ENT.Weapon_CanMoveFire = false -- Can it shoot while moving?
ENT.AnimTbl_ShootWhileMovingRun = {ACT_RUN} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_ShootWhileMovingWalk = {ACT_RUN} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.DeathAnimationTime = false -- Time until the SNPC spawns its corpse and gets removed
ENT.AnimTbl_TakingCover = {"cover_stand"} -- The animation it plays when hiding in a covered position, leave empty to let the base decide
ENT.AnimTbl_AlertFriendsOnDeath = {"vjseq_idle2"} -- Animations it plays when an ally dies that also has AlertFriendsOnDeath set to true
--ENT.Weapon_CanCrouchAttack = false -- Can it crouch while shooting?
ENT.HasLostWeaponSightAnimation = false -- Set to true if you would like the SNPC to play a different animation when it has lost sight of the enemy and can't fire at it
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by a player?
ENT.DropDeathLoot = false -- Should it drop items on death?
ENT.HasOnPlayerSight = true -- Should do something when it sees the enemy? Example: Play a sound
	-- ====== Flinching Code ====== --
ENT.CanFlinch = 1 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH} -- If it uses normal based animation, use this
ENT.HasHitGroupFlinching = true -- It will flinch when hit in certain hitgroups | It can also have certain animations to play in certain hitgroups
ENT.HitGroupFlinching_Values = {{HitGroup = {HITGROUP_LEFTARM}, Animation = {ACT_FLINCH_LEFTARM}},{HitGroup = {HITGROUP_RIGHTARM}, Animation = {ACT_FLINCH_RIGHTARM}},{HitGroup = {HITGROUP_LEFTLEG}, Animation = {ACT_FLINCH_LEFTLEG}},{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {ACT_FLINCH_RIGHTLEG}}}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_hlr/gsrc/pl_step1.wav","vj_hlr/gsrc/pl_step2.wav","vj_hlr/gsrc/pl_step3.wav","vj_hlr/gsrc/pl_step4.wav"}

/*
-- Can't follow
vj_hlr/gsrc/npc/barney/ba_stop0.wav
vj_hlr/gsrc/npc/barney/ba_stop1.wav
vj_hlr/gsrc/npc/barney/stop1.wav
vj_hlr/gsrc/npc/barney/stophere.wav

vj_hlr/gsrc/npc/barney/ba_internet.wav
vj_hlr/gsrc/npc/barney/ba_attacking0.wav
vj_hlr/gsrc/npc/barney/ba_attacking2.wav
vj_hlr/gsrc/npc/barney/ba_becareful0.wav
vj_hlr/gsrc/npc/barney/ba_button0.wav
vj_hlr/gsrc/npc/barney/ba_button1.wav
vj_hlr/gsrc/npc/barney/ba_canal_death1.wav
vj_hlr/gsrc/npc/barney/ba_canal_wound1.wav
vj_hlr/gsrc/npc/barney/ba_cure0.wav
vj_hlr/gsrc/npc/barney/ba_cure1.wav
vj_hlr/gsrc/npc/barney/ba_docprotect0.wav
vj_hlr/gsrc/npc/barney/ba_docprotect1.wav
vj_hlr/gsrc/npc/barney/ba_docprotect2.wav
vj_hlr/gsrc/npc/barney/ba_docprotect3.wav
vj_hlr/gsrc/npc/barney/ba_door0.wav
vj_hlr/gsrc/npc/barney/ba_door1.wav
vj_hlr/gsrc/npc/barney/ba_duty.wav
vj_hlr/gsrc/npc/barney/ba_generic2.wav
vj_hlr/gsrc/npc/barney/ba_help0.wav
-- vj_hlr/gsrc/npc/barney/ba_ht01_01.wav ---> vj_hlr/gsrc/npc/barney/ba_ht06_01.wav
-- vj_hlr/gsrc/npc/barney/ba_ht06_04.wav ---> vj_hlr/gsrc/npc/barney/ba_ht06_10.wav
--vj_hlr/gsrc/npc/barney/ba_ht07_01.wav ---> vj_hlr/gsrc/npc/barney/ba_ht08_03.wav
vj_hlr/gsrc/npc/barney/ba_idle2.wav
vj_hlr/gsrc/npc/barney/ba_idle5.wav
vj_hlr/gsrc/npc/barney/ba_idle6.wav
vj_hlr/gsrc/npc/barney/ba_kill1.wav
vj_hlr/gsrc/npc/barney/ba_kill2.wav
vj_hlr/gsrc/npc/barney/ba_lead0.wav
vj_hlr/gsrc/npc/barney/ba_lead1.wav
vj_hlr/gsrc/npc/barney/ba_lead2.wav
vj_hlr/gsrc/npc/barney/ba_mad2.wav
vj_hlr/gsrc/npc/barney/ba_ok0.wav
vj_hlr/gsrc/npc/barney/ba_opgate.wav
vj_hlr/gsrc/npc/barney/ba_plfear0.wav
-- vj_hlr/gsrc/npc/barney/ba_pok0.wav ---> vj_hlr/gsrc/npc/barney/ba_security2_nopass.wav
vj_hlr/gsrc/npc/barney/ba_security2_range1.wav
vj_hlr/gsrc/npc/barney/ba_security2_range2.wav
vj_hlr/gsrc/npc/barney/ba_shot0.wav
vj_hlr/gsrc/npc/barney/ba_stare2.wav
vj_hlr/gsrc/npc/barney/ba_stare3.wav
-- vj_hlr/gsrc/npc/barney/c1a0_ba_button.wav ---> vj_hlr/gsrc/npc/barney/c1a2_ba_2zomb.wav
vj_hlr/gsrc/npc/barney/c1a2_ba_bullsquid.wav
vj_hlr/gsrc/npc/barney/c1a2_ba_climb.wav
vj_hlr/gsrc/npc/barney/c1a2_ba_slew.wav
vj_hlr/gsrc/npc/barney/c1a2_ba_surface.wav
vj_hlr/gsrc/npc/barney/c1a2_ba_top.wav
-- vj_hlr/gsrc/npc/barney/c1a4_ba_wisp.wav ---> vj_hlr/gsrc/npc/barney/c3a2_ba_stay.wav
vj_hlr/gsrc/npc/barney/checkwounds.wav
vj_hlr/gsrc/npc/barney/imdead.wav
vj_hlr/gsrc/npc/barney/killme.wav
vj_hlr/gsrc/npc/barney/leavealone.wav
vj_hlr/gsrc/npc/barney/of1a5_ba02.wav
vj_hlr/gsrc/npc/barney/of6a4_ba01.wav
vj_hlr/gsrc/npc/barney/of6a4_ba02.wav
vj_hlr/gsrc/npc/barney/of6a4_ba03.wav
vj_hlr/gsrc/npc/barney/of6a4_ba04.wav
vj_hlr/gsrc/npc/barney/openfire.wav
vj_hlr/gsrc/npc/barney/realbadwound.wav
vj_hlr/gsrc/npc/barney/sir.wav
vj_hlr/gsrc/npc/barney/soldier.wav
vj_hlr/gsrc/npc/barney/youneedmedic.wav
*/

ENT.GeneralSoundPitch1 = 100

	-- ====== NPC Controller Data ====== --
ENT.ControllerParams = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 20, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(5, 0, 5), -- The offset for the controller when the camera is in first person
	FirstP_ShrinkBone = true, -- Should the bone shrink? Useful if the bone is obscuring the player's view
	FirstP_CameraBoneAng = 0, -- Should the camera's angle be affected by the bone's angle? | 0 = No, 1 = Pitch, 2 = Yaw, 3 = Roll
	FirstP_CameraBoneAng_Offset = 0, -- How much should the camera's angle be rotated by? | Useful for weird bone angles
}

-- Custom
ENT.Security_NextMouthMove = 0
ENT.Security_NextMouthDistance = 0
ENT.Security_GunHolstered = true
ENT.Security_Type = 0
	-- 0 = Security Guard
---------------------------------------------------------------------------------------------------------------------------------------------
local weps = {
	"weapon_vj_hlrze_beretta",
	"weapon_vj_hlrze_beretta",
	"weapon_vj_hlrze_spas12",
	"weapon_vj_hlrze_m16",
}
--
function ENT:Security_Init()
	self.SoundTbl_Idle = {"vj_hlr/gsrc/npc/barney/whatisthat.wav","vj_hlr/gsrc/npc/barney/somethingstinky.wav","vj_hlr/gsrc/npc/barney/somethingdied.wav","vj_hlr/gsrc/npc/barney/guyresponsible.wav","vj_hlr/gsrc/npc/barney/coldone.wav","vj_hlr/gsrc/npc/barney/ba_gethev.wav","vj_hlr/gsrc/npc/barney/badfeeling.wav","vj_hlr/gsrc/npc/barney/bigmess.wav","vj_hlr/gsrc/npc/barney/bigplace.wav"}
	self.SoundTbl_IdleDialogue = {"vj_hlr/gsrc/npc/barney/youeverseen.wav","vj_hlr/gsrc/npc/barney/workingonstuff.wav","vj_hlr/gsrc/npc/barney/whatsgoingon.wav","vj_hlr/gsrc/npc/barney/thinking.wav","vj_hlr/gsrc/npc/barney/survive.wav","vj_hlr/gsrc/npc/barney/stench.wav","vj_hlr/gsrc/npc/barney/somethingmoves.wav","vj_hlr/gsrc/npc/barney/of1a5_ba01.wav","vj_hlr/gsrc/npc/barney/nodrill.wav","vj_hlr/gsrc/npc/barney/missingleg.wav","vj_hlr/gsrc/npc/barney/luckwillturn.wav","vj_hlr/gsrc/npc/barney/gladof38.wav","vj_hlr/gsrc/npc/barney/gettingcloser.wav","vj_hlr/gsrc/npc/barney/crewdied.wav","vj_hlr/gsrc/npc/barney/ba_idle0.wav","vj_hlr/gsrc/npc/barney/badarea.wav","vj_hlr/gsrc/npc/barney/beertopside.wav"}
	self.SoundTbl_IdleDialogueAnswer = {"vj_hlr/gsrc/npc/barney/yup.wav","vj_hlr/gsrc/npc/barney/youtalkmuch.wav","vj_hlr/gsrc/npc/barney/yougotit.wav","vj_hlr/gsrc/npc/barney/youbet.wav","vj_hlr/gsrc/npc/barney/yessir.wav","vj_hlr/gsrc/npc/barney/soundsright.wav","vj_hlr/gsrc/npc/barney/noway.wav","vj_hlr/gsrc/npc/barney/nope.wav","vj_hlr/gsrc/npc/barney/nosir.wav","vj_hlr/gsrc/npc/barney/notelling.wav","vj_hlr/gsrc/npc/barney/maybe.wav","vj_hlr/gsrc/npc/barney/justdontknow.wav","vj_hlr/gsrc/npc/barney/ireckon.wav","vj_hlr/gsrc/npc/barney/iguess.wav","vj_hlr/gsrc/npc/barney/icanhear.wav","vj_hlr/gsrc/npc/barney/guyresponsible.wav","vj_hlr/gsrc/npc/barney/dontreckon.wav","vj_hlr/gsrc/npc/barney/dontguess.wav","vj_hlr/gsrc/npc/barney/dontfigure.wav","vj_hlr/gsrc/npc/barney/dontbuyit.wav","vj_hlr/gsrc/npc/barney/dontbet.wav","vj_hlr/gsrc/npc/barney/dontaskme.wav","vj_hlr/gsrc/npc/barney/cantfigure.wav","vj_hlr/gsrc/npc/barney/bequiet.wav","vj_hlr/gsrc/npc/barney/ba_stare0.wav","vj_hlr/gsrc/npc/barney/alreadyasked.wav"}
	self.SoundTbl_CombatIdle = {"vj_hlr/gsrc/npc/barney/whatgood.wav","vj_hlr/gsrc/npc/barney/targetpractice.wav","vj_hlr/gsrc/npc/barney/easily.wav","vj_hlr/gsrc/npc/barney/getanyworse.wav"}
	self.SoundTbl_FollowPlayer = {"vj_hlr/gsrc/npc/barney/yougotit.wav","vj_hlr/gsrc/npc/barney/wayout.wav","vj_hlr/gsrc/npc/barney/teamup1.wav","vj_hlr/gsrc/npc/barney/teamup2.wav","vj_hlr/gsrc/npc/barney/rightway.wav","vj_hlr/gsrc/npc/barney/letsgo.wav","vj_hlr/gsrc/npc/barney/letsmoveit.wav","vj_hlr/gsrc/npc/barney/imwithyou.wav","vj_hlr/gsrc/npc/barney/gladtolendhand.wav","vj_hlr/gsrc/npc/barney/dobettertogether.wav","vj_hlr/gsrc/npc/barney/c1a2_ba_goforit.wav","vj_hlr/gsrc/npc/barney/ba_ok1.wav","vj_hlr/gsrc/npc/barney/ba_ok2.wav","vj_hlr/gsrc/npc/barney/ba_ok3.wav","vj_hlr/gsrc/npc/barney/ba_idle1.wav","vj_hlr/gsrc/npc/barney/ba_ht06_11.wav"}
	self.SoundTbl_UnFollowPlayer = {"vj_hlr/gsrc/npc/barney/waitin.wav","vj_hlr/gsrc/npc/barney/stop2.wav","vj_hlr/gsrc/npc/barney/standguard.wav","vj_hlr/gsrc/npc/barney/slowingyoudown.wav","vj_hlr/gsrc/npc/barney/seeya.wav","vj_hlr/gsrc/npc/barney/iwaithere.wav","vj_hlr/gsrc/npc/barney/illwait.wav","vj_hlr/gsrc/npc/barney/helpothers.wav","vj_hlr/gsrc/npc/barney/ba_wait1.wav","vj_hlr/gsrc/npc/barney/ba_wait2.wav","vj_hlr/gsrc/npc/barney/ba_wait3.wav","vj_hlr/gsrc/npc/barney/ba_wait4.wav","vj_hlr/gsrc/npc/barney/ba_security2_pass.wav","vj_hlr/gsrc/npc/barney/aintgoin.wav","vj_hlr/gsrc/npc/barney/ba_becareful1.wav"}
	self.SoundTbl_OnPlayerSight = {"vj_hlr/gsrc/npc/barney/mrfreeman.wav","vj_hlr/gsrc/npc/barney/howyoudoing.wav","vj_hlr/gsrc/npc/barney/howdy.wav","vj_hlr/gsrc/npc/barney/heybuddy.wav","vj_hlr/gsrc/npc/barney/heyfella.wav","vj_hlr/gsrc/npc/barney/hellonicesuit.wav","vj_hlr/gsrc/npc/barney/ba_stare1.wav","vj_hlr/gsrc/npc/barney/ba_later.wav","vj_hlr/gsrc/npc/barney/ba_idle4.wav","vj_hlr/gsrc/npc/barney/ba_idle3.wav","vj_hlr/gsrc/npc/barney/ba_ok4.wav","vj_hlr/gsrc/npc/barney/ba_ok5.wav","vj_hlr/gsrc/npc/barney/ba_ht06_03.wav","vj_hlr/gsrc/npc/barney/ba_ht06_03_alt.wav","vj_hlr/gsrc/npc/barney/ba_hello0.wav","vj_hlr/gsrc/npc/barney/ba_hello1.wav","vj_hlr/gsrc/npc/barney/ba_hello2.wav","vj_hlr/gsrc/npc/barney/ba_hello3.wav","vj_hlr/gsrc/npc/barney/ba_hello4.wav","vj_hlr/gsrc/npc/barney/ba_hello5.wav","vj_hlr/gsrc/npc/barney/armedforces.wav"}
	self.SoundTbl_Investigate = {"vj_hlr/gsrc/npc/barney/youhearthat.wav","vj_hlr/gsrc/npc/barney/soundsbad.wav","vj_hlr/gsrc/npc/barney/icanhear.wav","vj_hlr/gsrc/npc/barney/hearsomething2.wav","vj_hlr/gsrc/npc/barney/hearsomething.wav","vj_hlr/gsrc/npc/barney/ambush.wav","vj_hlr/gsrc/npc/barney/ba_generic0.wav"}
	self.SoundTbl_Alert = {"vj_hlr/gsrc/npc/barney/ba_openfire.wav","vj_hlr/gsrc/npc/barney/ba_attack1.wav","vj_hlr/gsrc/npc/barney/aimforhead.wav"}
	--self.SoundTbl_CallForHelp = {"vj_hlr/gsrc/npc/barney/ba_needhelp0.wav","vj_hlr/gsrc/npc/barney/ba_needhelp1.wav"}
	self.SoundTbl_BecomeEnemyToPlayer = {"vj_hlr/gsrc/npc/barney/ba_uwish.wav","vj_hlr/gsrc/npc/barney/ba_tomb.wav","vj_hlr/gsrc/npc/barney/ba_somuch.wav","vj_hlr/gsrc/npc/barney/ba_mad3.wav","vj_hlr/gsrc/npc/barney/ba_iwish.wav","vj_hlr/gsrc/npc/barney/ba_endline.wav","vj_hlr/gsrc/npc/barney/aintscared.wav"}
	self.SoundTbl_Suppressing = {"vj_hlr/gsrc/npc/barney/c1a4_ba_octo2.wav","vj_hlr/gsrc/npc/barney/c1a4_ba_octo4.wav","vj_hlr/gsrc/npc/barney/c1a4_ba_octo3.wav","vj_hlr/gsrc/npc/barney/ba_generic1.wav","vj_hlr/gsrc/npc/barney/ba_bring.wav","vj_hlr/gsrc/npc/barney/ba_attacking1.wav"}
	self.SoundTbl_GrenadeSight = {"vj_hlr/gsrc/npc/barney/standback.wav","vj_hlr/gsrc/npc/barney/ba_heeey.wav"}
	self.SoundTbl_KilledEnemy = {"vj_hlr/gsrc/npc/barney/soundsbad.wav","vj_hlr/gsrc/npc/barney/ba_seethat.wav","vj_hlr/gsrc/npc/barney/ba_kill0.wav","vj_hlr/gsrc/npc/barney/ba_gotone.wav","vj_hlr/gsrc/npc/barney/ba_firepl.wav","vj_hlr/gsrc/npc/barney/ba_buttugly.wav","vj_hlr/gsrc/npc/barney/ba_another.wav","vj_hlr/gsrc/npc/barney/ba_close.wav"}
	self.SoundTbl_AllyDeath = {"vj_hlr/gsrc/npc/barney/die.wav"}
	self.SoundTbl_Pain = {"vj_hlr/gsrc/npc/barney/imhit.wav","vj_hlr/gsrc/npc/barney/hitbad.wav","vj_hlr/gsrc/npc/barney/c1a2_ba_4zomb.wav","vj_hlr/gsrc/npc/barney/ba_pain1.wav","vj_hlr/gsrc/npc/barney/ba_pain2.wav","vj_hlr/gsrc/npc/barney/ba_pain3.wav"}
	self.SoundTbl_DamageByPlayer = {"vj_hlr/gsrc/npc/barney/donthurtem.wav","vj_hlr/gsrc/npc/barney/ba_whoathere.wav","vj_hlr/gsrc/npc/barney/ba_whatyou.wav","vj_hlr/gsrc/npc/barney/ba_watchit.wav","vj_hlr/gsrc/npc/barney/ba_shot1.wav","vj_hlr/gsrc/npc/barney/ba_shot2.wav","vj_hlr/gsrc/npc/barney/ba_shot3.wav","vj_hlr/gsrc/npc/barney/ba_shot4.wav","vj_hlr/gsrc/npc/barney/ba_shot5.wav","vj_hlr/gsrc/npc/barney/ba_shot6.wav","vj_hlr/gsrc/npc/barney/ba_shot7.wav","vj_hlr/gsrc/npc/barney/ba_stepoff.wav","vj_hlr/gsrc/npc/barney/ba_pissme.wav","vj_hlr/gsrc/npc/barney/ba_mad1.wav","vj_hlr/gsrc/npc/barney/ba_mad0.wav","vj_hlr/gsrc/npc/barney/ba_friends.wav","vj_hlr/gsrc/npc/barney/ba_dotoyou.wav","vj_hlr/gsrc/npc/barney/ba_dontmake.wav","vj_hlr/gsrc/npc/barney/ba_crazy.wav"}
	self.SoundTbl_Death = {"vj_hlr/gsrc/npc/barney/ba_ht06_02_alt.wav","vj_hlr/gsrc/npc/barney/ba_ht06_02.wav","vj_hlr/gsrc/npc/barney/ba_die1.wav","vj_hlr/gsrc/npc/barney/ba_die2.wav","vj_hlr/gsrc/npc/barney/ba_die3.wav"}

	self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIE_GUTSHOT,ACT_DIE_HEADSHOT,ACT_DIESIMPLE} -- Death Animations

	local gmodweaponoverride = GetConVar("gmod_npcweapon"):GetString()
	
	if gmodweaponoverride == "" then --Checks if the weapon has a manual override, if not then select our own random weapon
		self:DoChangeWeapon(VJ_PICK(weps))
		elseif gmodweaponoverride == "none" then --Do nothing because we are being given nothing lol
		else self:DoChangeWeapon(gmodweaponoverride) --Give manually overridden weapon
	end
--	self:DoChangeWeapon("weapon_vj_hlrze_beretta")

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	//self:SetCollisionBounds(Vector(13, 13, 76), Vector(-13, -13, 0))
	--self:SetBodygroup(1,0)
	self:Security_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnPlayCreateSound(SoundData,SoundFile)
	if !self.SoundTbl_Breath[SoundFile] then
		self.HECU_NextMouthMove = CurTime() + SoundDuration(SoundFile)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
	if key == "step" then
		self:PlayFootstepSound()
	end
	if key == "fire" then
		local wep = self:GetActiveWeapon()
		if IsValid(wep) then
			wep:NPCShoot_Primary(ShootPos,ShootDir)
		end
	end
	if key == "shell" then
		VJ_EmitSound(self,{"vj_hlr/gsrc/wep/reload1.wav","vj_hlr/gsrc/wep/reload2.wav","vj_hlr/gsrc/wep/reload3.wav"},80,100)
	end
	if key == "cock" then --and ball torture
		VJ_EmitSound(self,{"vj_hlr/gsrc/wep/shotgun/scock1.wav"},80,100)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
	if self.Security_Type != 2 then
		if CurTime() < self.Security_NextMouthMove then
			if self.Security_NextMouthDistance == 0 then
				self.Security_NextMouthDistance = math.random(10,70)
			else
				self.Security_NextMouthDistance = 0
			end
			self:SetPoseParameter("mouth",self.Security_NextMouthDistance)
		else
			self:SetPoseParameter("mouth",0)
		end
	else
		self.Weapon_ShotsSinceLastReload = 0
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnPlayCreateSound(SoundData,SoundFile)
	self.Security_NextMouthMove = CurTime() + SoundDuration(SoundFile)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(argent)
	if self.VJ_IsBeingControlled == true then return end
	
	if math.random(1, 2) == 1 then
		if self.Security_Type == 0 then
			if argent:GetClass() == "npc_vj_hlr1_bullsquid" then
				self:PlaySoundSystem("Alert", {"vj_hlr/gsrc/npc/barney/c1a4_ba_octo1.wav"})
				self.NextAlertSoundT = CurTime() + math.Rand(self.NextSoundTime_Alert.a, self.NextSoundTime_Alert.b)
			elseif argent.IsVJBaseSNPC_Creature == true then
				self:PlaySoundSystem("Alert", {"vj_hlr/gsrc/npc/barney/diebloodsucker.wav"})
				self.NextAlertSoundT = CurTime() + math.Rand(self.NextSoundTime_Alert.a, self.NextSoundTime_Alert.b)
			end
		elseif self.Security_Type == 1 && argent.IsVJBaseSNPC_Creature == true then
			self:PlaySoundSystem("Alert", {"vj_hlr/gsrc/npc/otis/aliens.wav"})
			self.NextAlertSoundT = CurTime() + math.Rand(self.NextSoundTime_Alert.a, self.NextSoundTime_Alert.b)
		end
	end
	
	if self:GetWeaponState() == VJ_WEP_STATE_HOLSTERED then
		self:Security_UnHolsterGun()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetGun()
	local bg = self:GetBodygroup(1)
	if bg == 1 then
		return "beretta"
	elseif bg == 3 then
		return "m16"
	elseif bg == 4 then
		return "spas12"
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Security_UnHolsterGun()
	self:StopMoving()
	self:VJ_ACT_PLAYACTIVITY(ACT_ARM,true,false,true)
	self.Security_GunHolstered = false
	timer.Simple(0.55,function() if IsValid(self) then self:SetBodygroup(1,1) end end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive() --pistol holstering code
	if self.Security_GunHolstered == true && IsValid(self:GetEnemy()) && self:GetBodygroup(1) == 0 then --unholster our gun when seeing an enemy
		self:Security_UnHolsterGun()
	end
	if self.Security_GunHolstered == false 
	&& self:GetBodygroup(1) == 1 --do we have a baretta in our hands?
	--&& !IsValid(self:GetEnemy()) --do we NOT have an enemy? 
	--&& (CurTime() - self.EnemyData.LastVisibleTime) < 5 --has it been 5 seconds since we last saw an enemy?
	&& self:GetNPCState() == NPC_STATE_IDLE --are we calm?
	&& !self.IsReloadingWeapon  --are we NOT reloading?
	&& self:Health() > 0 --check of we're dead or not, otherwise we'll holster while getting 'crabbed
	&& !self.VJ_PlayingSequence --are we NOT already playing a sequence?
	&& self.WeaponEntity.HoldType == "pistol" --are we using a pistol weapon?
	&& self.WeaponEntity:GetMaxClip1() == self.WeaponEntity:Clip1() --is our magazine full?
	then
		self:VJ_ACT_PLAYACTIVITY(ACT_DISARM,true,false,true)
		self.Security_GunHolstered = true
		timer.Simple(1.5,function() if IsValid(self) then self:SetBodygroup(1,0) self.Security_GunHolstered = true end end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnIsAbleToShootWeapon()
	if self.Security_GunHolstered == true then return false end
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HandleGibOnDeath(dmginfo,hitgroup)
	self.HasDeathSounds = false
	if self.HasGibOnDeathEffects == true then
		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos() +self:OBBCenter())
		bloodeffect:SetColor(VJ_Color2Byte(Color(130,19,10)))
		bloodeffect:SetScale(120)
		util.Effect("VJ_Blood1",bloodeffect)
		
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:GetPos())
		bloodspray:SetScale(8)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray",bloodspray)
		util.Effect("bloodspray",bloodspray)
	end
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh1.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh2.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh3.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh4.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_b_bone.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,50))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_b_gib.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_guts.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_hmeat.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_lung.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_skull.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,60))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_legbone.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,15))})
	self:PlaySoundSystem("Gib", "vj_base/gib/splat.wav")
	return true -- Return to true if it gibbed!
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_BeforeCorpseSpawned(dmginfo,hitgroup)
	self:SetBodygroup(1,2)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if hitgroup == 10 then
		-- self.Bleeds = false
		dmginfo:ScaleDamage(0.5)
		-- timer.Simple(0.01,function() if IsValid(self) then self.Bleeds = true end end)
		--VJ_EmitSound(self,"vj_hlr/fx/ric" .. math.random(1,5) .. ".wav",88,100)
		local rico = EffectData()
		rico:SetOrigin(dmginfo:GetDamagePosition())
		rico:SetScale(4) -- Size
		rico:SetMagnitude(2) -- Effect type | 1 = Animated | 2 = Basic
		util.Effect("VJ_HLR_Rico",rico)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeathWeaponDrop_AfterWeaponSpawned(dmginfo,hitgroup,GetWeapon)
	GetWeapon.WorldModel_Invisible = false
	GetWeapon:SetNWBool("VJ_WorldModel_Invisible",false)
end

function ENT:SetAnimationTranslations(htype) 
	local wep = self:GetActiveWeapon()
	
--self.AnimationTranslations = {}
--print(htype)
if htype == "smg" or htype == "ar2" then
	self.Security_GunHolstered = false
	if wep:GetClass() == "weapon_vj_hlrze_m16" then 
		self:SetBodygroup(1,3)
		wep.NPC_ReloadSound = {"vj_hlr/gsrc/npc/hgrunt_alpha/gr_reload1.wav"}
	end
	self.AnimationTranslations[ACT_IDLE] 							= ACT_IDLE_RPG
	self.AnimationTranslations[ACT_RANGE_ATTACK1] 					= ACT_CROUCHIDLE
	self.AnimationTranslations[ACT_WALK] 							= ACT_WALK_RPG
	self.AnimationTranslations[ACT_RELOAD] 						= ACT_RELOAD_SMG1
	self.AnimationTranslations[ACT_RUN] 							= ACT_RUN_RPG
	self.AnimationTranslations[ACT_MELEE_ATTACK1] 					= ACT_GESTURE_MELEE_ATTACK1
	self.AnimationTranslations[ACT_IDLE_ANGRY] 					= ACT_IDLE_RPG -- Fixes idle anim when controlled
	self.AnimationTranslations[ACT_TURN_RIGHT] 							= ACT_IDLE_RPG
	self.AnimationTranslations[ACT_TURN_LEFT] 							= ACT_IDLE_RPG
elseif htype == "shotgun" then
	self.Security_GunHolstered = false
	if wep:GetClass() == "weapon_vj_hlrze_spas12" then 
		self:SetBodygroup(1,4)
	end
	self.AnimationTranslations[ACT_IDLE] 							= ACT_SHOTGUN_IDLE4
	self.AnimationTranslations[ACT_RANGE_ATTACK1] 					= ACT_RANGE_ATTACK_SHOTGUN
	self.AnimationTranslations[ACT_WALK] 							= ACT_WALK_AIM_SHOTGUN
	self.AnimationTranslations[ACT_RELOAD] 						= ACT_RELOAD_SHOTGUN
	self.AnimationTranslations[ACT_RUN] 							= ACT_RUN_RIFLE
	self.AnimationTranslations[ACT_MELEE_ATTACK1] 					= ACT_GESTURE_MELEE_ATTACK1
	self.AnimationTranslations[ACT_IDLE_ANGRY] 					= ACT_SHOTGUN_IDLE4 -- Fixes idle anim when controlled
	self.AnimationTranslations[ACT_TURN_RIGHT] 							= ACT_SHOTGUN_IDLE4
	self.AnimationTranslations[ACT_TURN_LEFT] 							= ACT_SHOTGUN_IDLE4
	wep.NPC_HasReloadSound = false
elseif (htype == "pistol" or htype == "357") && wep:GetClass() != "weapon_vj_hlrze_beretta" then
	self.Security_GunHolstered = false --we have a pistol-type weapon but it's not the beretta, so disable holster code
	self:SetBodygroup(1,2)
end

return true

end

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpseEnt)
	VJ.HLR_ApplyCorpseSystem(self, corpseEnt)
end