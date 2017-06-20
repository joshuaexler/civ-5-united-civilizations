-- Not Another City States Mod 
--   NewTraitsEffects.lua
--   Author: Iceco
--[[ Gives the bonuses granted by the new minor civ Traits. ]]
--------------------------------------------------------------

include( "SaveUtils" ); MY_MOD_NAME = "Minor Civilization Revamper"; WARN_NOT_SHARED = false

--------------------------------------------------------------
-- Main function determining what bonuses to apply and gathering the necessary info.
--------------------------------------------------------------
function MinorCivFriendshipEffects( iPlayer )
	local pPlayer = Players[iPlayer]
	for iMinor, pMinor in ipairs(Players) do
		if ( pMinor ~= nil and pMinor:IsMinorCiv() ) then
			if pMinor:IsFriends( iPlayer ) and not pMinor:IsAllies( iPlayer ) then	-- at FRIENDS level
				if GameInfo.MinorCivTraits[ pMinor:GetMinorCivTrait() ].Type == "MINOR_TRAIT_COMMERCIAL" then
					local GoldBonus = 4 + ( pPlayer:GetCurrentEra() * 2 )
					CommercialEffect( iPlayer, pPlayer, iMinor, pMinor, GoldBonus )
				elseif GameInfo.MinorCivTraits[ pMinor:GetMinorCivTrait() ].Type == "MINOR_TRAIT_RENTIER" then
					local GoldBonus = 12 + ( (1 + pPlayer:GetCurrentEra()) * 3 )
					local ChangeHap = (pPlayer:GetExtraHappinessPerCity() - 0.05)
					pPlayer:ChangeExtraHappinessPerCity(ChangeHap)
					CommercialEffect( iPlayer, pPlayer, iMinor, pMinor, GoldBonus )
				elseif GameInfo.MinorCivTraits[ pMinor:GetMinorCivTrait() ].Type == "MINOR_TRAIT_INDIGENOUS" then
					local ChangeHap = (pPlayer:GetExtraHappinessPerCity() + 0.05)
					pPlayer:ChangeExtraHappinessPerCity(ChangeHap)
				elseif GameInfo.MinorCivTraits[ pMinor:GetMinorCivTrait() ].Type == "MINOR_TRAIT_DIPLOMATIC" then
					local InfluenceBonus = 0.125
					DiplomaticEffect( iPlayer, pPlayer, iMinor, pMinor, InfluenceBonus )
				elseif GameInfo.MinorCivTraits[ pMinor:GetMinorCivTrait() ].Type == "MINOR_TRAIT_INTELLECTUAL" then
					local ScienceBonus = 4 + ( pPlayer:GetCurrentEra() * 2 )
					IntellectualEffect( iPlayer, pPlayer, iMinor, pMinor, ScienceBonus )
				elseif GameInfo.MinorCivTraits[ pMinor:GetMinorCivTrait() ].Type == "MINOR_TRAIT_PRODUCTIVE" then
					local ProductionBonus = 3 + (pPlayer:GetCurrentEra() * 3 )
					ProductiveEffect( iPlayer, pPlayer, iMinor, pMinor, ProductionBonus )
				elseif GameInfo.MinorCivTraits[ pMinor:GetMinorCivTrait() ].Type == "MINOR_TRAIT_PROGRESSIVE" then
					local GreatPersonBonus = 4 + (pPlayer:GetCurrentEra() * 2 )
					ProgressiveEffect( iPlayer, pPlayer, iMinor, pMinor, GreatPersonBonus )
				elseif GameInfo.MinorCivTraits[ pMinor:GetMinorCivTrait() ].Type == "MINOR_TRAIT_PROSPEROUS" then
					local GoldenAgeProgressBonus = 2 + (pPlayer:GetCurrentEra() * 2 )
					ProsperousEffect( iPlayer, pPlayer, iMinor, pMinor, GoldenAgeProgressBonus )
				elseif GameInfo.MinorCivTraits[ pMinor:GetMinorCivTrait() ].Type == "MINOR_TRAIT_ENVIRONMENTAL" then
					EnvironmentalEffect( iPlayer, pPlayer, iMinor, pMinor )
				end
			elseif pMinor:IsAllies( iPlayer ) then									-- at ALLY level
				if GameInfo.MinorCivTraits[ pMinor:GetMinorCivTrait() ].Type == "MINOR_TRAIT_COMMERCIAL" then
					local GoldBonus = 12 + ( pPlayer:GetCurrentEra() * 4 )
					CommercialEffect( iPlayer, pPlayer, iMinor, pMinor, GoldBonus )
				elseif GameInfo.MinorCivTraits[ pMinor:GetMinorCivTrait() ].Type == "MINOR_TRAIT_RENTIER" then
					local GoldBonus = 40 + ( (1 + pPlayer:GetCurrentEra()) * 5 )
					local ChangeHap = (pPlayer:GetExtraHappinessPerCity() - 0.1)
					pPlayer:ChangeExtraHappinessPerCity(ChangeHap)
					CommercialEffect( iPlayer, pPlayer, iMinor, pMinor, GoldBonus )
				elseif GameInfo.MinorCivTraits[ pMinor:GetMinorCivTrait() ].Type == "MINOR_TRAIT_INDIGENOUS" then
					local ChangeHap = (pPlayer:GetExtraHappinessPerCity() + 0.1)
					pPlayer:ChangeExtraHappinessPerCity(ChangeHap)
				elseif GameInfo.MinorCivTraits[ pMinor:GetMinorCivTrait() ].Type == "MINOR_TRAIT_DIPLOMATIC" then
					local InfluenceBonus = 0.2
					DiplomaticEffect( iPlayer, pPlayer, iMinor, pMinor, InfluenceBonus )
				elseif GameInfo.MinorCivTraits[ pMinor:GetMinorCivTrait() ].Type == "MINOR_TRAIT_INTELLECTUAL" then
					local ScienceBonus = 6 + ( pPlayer:GetCurrentEra() * 3 )
					IntellectualEffect( iPlayer, pPlayer, iMinor, pMinor, ScienceBonus )
				elseif GameInfo.MinorCivTraits[ pMinor:GetMinorCivTrait() ].Type == "MINOR_TRAIT_PRODUCTIVE" then
					local ProductionBonus = 4 + (pPlayer:GetCurrentEra() * 4 )
					ProductiveEffect( iPlayer, pPlayer, iMinor, pMinor, ProductionBonus )
				elseif GameInfo.MinorCivTraits[ pMinor:GetMinorCivTrait() ].Type == "MINOR_TRAIT_PROGRESSIVE" then
					local GreatPersonBonus = 6 + (pPlayer:GetCurrentEra() * 3 )
					ProgressiveEffect( iPlayer, pPlayer, iMinor, pMinor, GreatPersonBonus )
				elseif GameInfo.MinorCivTraits[ pMinor:GetMinorCivTrait() ].Type == "MINOR_TRAIT_PROSPEROUS" then
					local GoldenAgeProgressBonus = 3 + (pPlayer:GetCurrentEra() * 3 )
					ProsperousEffect( iPlayer, pPlayer, iMinor, pMinor, GoldenAgeProgressBonus )
				elseif GameInfo.MinorCivTraits[ pMinor:GetMinorCivTrait() ].Type == "MINOR_TRAIT_ENVIRONMENTAL" then
					EnvironmentalEffect( iPlayer, pPlayer, iMinor, pMinor )
				end
			end
		end
	end
end

-- Determines that MinorCivFriendshipEffects() should be called at a player's (both human or AI) turn.
GameEvents.PlayerDoTurn.Add( MinorCivFriendshipEffects )

--------------------------------------------------------------
-- The various effects.
--------------------------------------------------------------
function CommercialEffect( iPlayer, pPlayer, iMinor, pMinor, GoldBonus )
	pPlayer:ChangeGold( GoldBonus )
end

function EnvironmentalEffect( iPlayer, pPlayer, iMinor, pMinor )

end

function DiplomaticEffect( iPlayer, pPlayer, iMinor, pMinor, InfluenceBonus )
	local InfluenceDegradationTimes100 = pMinor:GetFriendshipChangePerTurnTimes100( iPlayer )
	-- The bonus is multiplied by the natural influence degradation percentage (normally 100%, but altered by Policies/Traits)
	InfluenceBonus = InfluenceBonus * ( math.abs(InfluenceDegradationTimes100) / 100 )
	
	local CurrentTurn = Game:GetGameTurn()
	local TurnSumInfluenceDegradationTimes100 = load( pPlayer, CurrentTurn, "InfluenceDegradation" ) or InfluenceDegradationTimes100
	-- Bonus does not slow influence degradation below 0.2/turn
	if TurnSumInfluenceDegradationTimes100 < -20 then
		FutureSumInfluenceDegradationTimes100 = TurnSumInfluenceDegradationTimes100 + ( 100 * InfluenceBonus )
		if FutureSumInfluenceDegradationTimes100 > -20 then
			InfluenceBonus = ( -20 - TurnSumInfluenceDegradationTimes100 ) / 100
			save( pPlayer, CurrentTurn, -20 , "InfluenceDegradation" )
		else 
			save( pPlayer, CurrentTurn, FutureSumInfluenceDegradationTimes100, "InfluenceDegradation" )
		end
	else
		InfluenceBonus = 0
	end
	
	local InfluencePool = load( pPlayer, "InfluencePool" ) or 0
	-- The InfluencePool is filled each turn
	InfluencePool = InfluencePool + InfluenceBonus
	
	-- Until 'full', then city-states get +1 Influence. Bonus is not given to that Diplo CS itself or if you have 0 influence with it, or just lost friends/ally status with it (to avoid 'No longer allies' - 'Now allies with' notification spamming)
	if InfluencePool >= 1 then
		for iOtherMinor, pOtherMinor in ipairs(Players) do
			if ( pOtherMinor ~= nil and pOtherMinor ~= pMinor and pOtherMinor:IsMinorCiv() ) then
				local Influence = pOtherMinor:GetMinorCivFriendshipWithMajor( iPlayer )
				if ( Influence ~= 0 and Influence + 1 ~= GameDefines["FRIENDSHIP_THRESHOLD_FRIENDS"] and Influence + 1 ~= GameDefines["FRIENDSHIP_THRESHOLD_ALLIES"] ) then
					pOtherMinor:ChangeMinorCivFriendshipWithMajor( iPlayer, 1 )
				end
			end
		end
		InfluencePool = InfluencePool - 1
	end
	save( pPlayer, "InfluencePool", InfluencePool )
end

function IntellectualEffect( iPlayer, pPlayer, iMinor, pMinor, ScienceBonus )
	local pTeam = Teams[pPlayer:GetTeam()]
	local pTeamTech = pTeam:GetTeamTechs()
	local iTech = pPlayer:GetCurrentResearch()
	if iTech ~= -1 then
		local pTech = GameInfo.Technologies[iTech]
		pTeamTech:ChangeResearchProgress( iTech, ScienceBonus, iPlayer )
	end
end

function ProductiveEffect( iPlayer, pPlayer, iMinor, pMinor, ProductionBonus )
	-- Every 6th hammer is given to the Capital
	if ProductionBonus >= 6 then
		local pCapital = pPlayer:GetCapitalCity()
		if pCapital ~= nil then
			local Remainder = ProductionBonus % 6
			ProductionBonus = ProductionBonus - Remainder
			local CapitalExtraBonus = ProductionBonus / 6
			pCapital:ChangeProduction( CapitalExtraBonus )
			ProductionBonus = ProductionBonus - CapitalExtraBonus + Remainder
		end
	end
	-- The rest is distributed over all cities (incl. Capital)
	repeat
		for pCity in pPlayer:Cities() do
			if ProductionBonus > 0 then
				pCity:ChangeProduction( 1 )
			end
			ProductionBonus = ProductionBonus - 1
		end
	until ProductionBonus < 1
end

function ProgressiveEffect( iPlayer, pPlayer, iMinor, pMinor, GreatPersonBonus )
	print(string.format("GreatPersonBonus of %d for %s:", GreatPersonBonus, pPlayer:GetName()))
	if GreatPersonBonus >= 6 then
		local pCapital = pPlayer:GetCapitalCity()
		if pCapital ~= nil then
			local Remainder = GreatPersonBonus % 6
			GreatPersonBonus = GreatPersonBonus - Remainder
			local CapitalExtraBonus = GreatPersonBonus / 6
			
			local ClosestGP = 0
			local GPAmount = 0
			-- Determine the GP for which the progress is currently the highest
			for specialist in GameInfo.Specialists() do
				print(string.format("%s: %d", pCapital:GetName(), specialist.ID))
				-- GP with ID one is the citizen specialist, which isn't a proper specialist, so should always be trumped by another
				if ClosestGP == 0 and specialist.ID ~= 0 then
					ClosestGP = specialist.ID
					print(string.format("  ClosestGP in %s was citizen specialist (default), now %d", pCapital:GetName(), specialist.ID))
				elseif ( pCapital:GetSpecialistGreatPersonProgressTimes100( specialist.ID ) > pCapital:GetSpecialistGreatPersonProgressTimes100( ClosestGP ) and specialist.ID ~= 0 ) then
					ClosestGP = specialist.ID
					print(string.format("  new ClosestGP in %s: %d", pCapital:GetName(), specialist.ID))
				end
				GPAmount = specialist.ID
			end
			-- Apply bonus to that GP
			if pCapital:GetSpecialistGreatPersonProgressTimes100( ClosestGP ) ~= 0 then
				pCapital:ChangeSpecialistGreatPersonProgressTimes100( ClosestGP, CapitalExtraBonus * 100 )
				print(string.format("  GreatPersonBonus applied! (%s, %s) - %d points left", pPlayer:GetName(), pCapital:GetName(), GreatPersonBonus - CapitalExtraBonus + Remainder))
			else 
				ClosestGP = Game.Rand( GPAmount, "random GP" ) + 1 -- "+ 1" to avoid picking the citizen specialist
				pCapital:ChangeSpecialistGreatPersonProgressTimes100( ClosestGP, CapitalExtraBonus * 100 )
				print(string.format("  GreatPersonBonus applied! (%s, %s) - %d points left (random pick)", pPlayer:GetName(), pCapital:GetName(), GreatPersonBonus - CapitalExtraBonus + Remainder))
			end
			GreatPersonBonus = GreatPersonBonus - CapitalExtraBonus + Remainder
		end
	end
	repeat
		for pCity in pPlayer:Cities() do
			if GreatPersonBonus > 0 then
				local ClosestGP = 0
				local GPAmount = 0
				-- Determine the GP for which the progress is currently the highest
				for specialist in GameInfo.Specialists() do
					print(string.format("%s: %d", pCity:GetName(), specialist.ID))
					-- GP with ID one is the citizen specialist, which isn't a proper specialist, so should always be trumped by another
					if ClosestGP == 0 and specialist.ID ~= 0 then
						ClosestGP = specialist.ID
						print(string.format("  ClosestGP in %s was citizen specialist (default), now %d", pCity:GetName(), specialist.ID))
					elseif ( pCity:GetSpecialistGreatPersonProgressTimes100( specialist.ID ) > pCity:GetSpecialistGreatPersonProgressTimes100( ClosestGP ) and specialist.ID ~= 0 ) then
						ClosestGP = specialist.ID
						print(string.format("  new ClosestGP in %s: %d", pCity:GetName(), specialist.ID))
					end
					GPAmount = specialist.ID
				end
				-- Apply bonus to that GP
				if pCity:GetSpecialistGreatPersonProgressTimes100( ClosestGP ) ~= 0 then
					pCity:ChangeSpecialistGreatPersonProgressTimes100( ClosestGP, 100 )
					GreatPersonBonus = GreatPersonBonus - 1
					print(string.format("  GreatPersonBonus applied! (%s, %s) - %d points left", pPlayer:GetName(), pCity:GetName(), GreatPersonBonus))
				else 
					ClosestGP = Game.Rand( GPAmount, "random GP" ) + 1 -- "+ 1" to avoid picking the citizen specialist
					pCity:ChangeSpecialistGreatPersonProgressTimes100( ClosestGP, 100 )
					GreatPersonBonus = GreatPersonBonus - 1
					print(string.format("  GreatPersonBonus applied! (%s, %s) - %d points left (random pick)", pPlayer:GetName(), pCity:GetName(), GreatPersonBonus))
				end
			end
		end
	until GreatPersonBonus < 1
end

function ProsperousEffect( iPlayer, pPlayer, iMinor, pMinor, GoldenAgeProgressBonus )
	local WasGoldenAge = load( pPlayer, "WasGoldenAge" ) or false
	print("WasGoldenAge: ", WasGoldenAge)
	local IsGoldenAge = pPlayer:IsGoldenAge()
	-- Advances GA progress and gives 1 extra turn of GA, latter regardless if friends or allies
	if not IsGoldenAge then
		pPlayer:ChangeGoldenAgeProgressMeter( GoldenAgeProgressBonus )
	elseif ( IsGoldenAge and not WasGoldenAge ) then
		pPlayer:ChangeGoldenAgeTurns( 1 )
	end
	save( pPlayer, "WasGoldenAge", IsGoldenAge )
end

--[[Possible changes:
	-----------------
	INTELLETUAL:
		- if no tech active, pick random
	PRODUCTIVE:
		- add check for TBC's cityweight, or use similar system (idem for PROGRESSIVE)
	PROGRESSIVE:
		- if bonus pushes to completion of new GP, manually create new GP and reset progress to 0 (+ leftover bonus)
			solves oddity that GP is not created that turn
		- make GP picker separate function to avoid duplicates
		- progress bar appears not to be updating
		- test will unit be created if no natural GP progress?
	PROSPEROUS:
		- replace +1 turn of GA with random chance of short GA? (requires notification)
]]