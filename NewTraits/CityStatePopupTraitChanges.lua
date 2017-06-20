--------------------------------------------------------------
-- Adds support for the new Traits in the CityStateGreeting- and CityStateDiploPopup
-- based on Gedemon's YnEAMP Leaders for City States (adaptation of mihaifx's City State Leaders)
--------------------------------------------------------------

local g_iMinorCivID = -1
local g_iMinorCivTeamID = -1
local g_popuptype = nil
local m_PopupInfo = nil

----------------------
-- On City State PopUp
----------------------
function OnEventReceived( popupInfo )
	
	if( popupInfo.Type == ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_DIPLO) then
		g_popuptype = "DIPLO"
	elseif (popupInfo.Type == ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_GREETING) then
		g_popuptype = "GREETING"
	else
		return
	end
	
	m_PopupInfo = popupInfo	
	
    local iPlayer = popupInfo.Data1
    local pPlayer = Players[iPlayer]
	local iTeam = pPlayer:GetTeam()
	local pTeam = Teams[iTeam]
    
    g_iMinorCivID = iPlayer
    g_iMinorCivTeamID = iTeam
	
	local bForcePeace = false

	SetCityStateTrait()
end
Events.SerialEventGameMessagePopup.Add( OnEventReceived )

----------------------
-- Support New Traits 
----------------------
function SetCityStateTrait()	

	local pPlayer = Players[g_iMinorCivID]
	local strTraitSuffix = "";
	local strTraitText = "";
	local strTraitTT = "";
	local iTrait = pPlayer:GetMinorCivTrait();

	local strTrait = GameInfo.MinorCivTraits[iTrait].Type
	strTraitSuffix = string.sub( strTrait, 13 )
	strTraitText = Locale.ConvertTextKey( "TXT_KEY_CITY_STATE_" .. strTraitSuffix .. "_ADJECTIVE" )
	strTraitTT = Locale.ConvertTextKey( "TXT_KEY_CITY_STATE_" .. strTraitSuffix .. "_TT" )
	
	strTraitText = "[COLOR_POSITIVE_TEXT]" .. strTraitText .. "[ENDCOLOR]";
	
	if strTraitText ~= nil then
		if (g_popuptype == "DIPLO") then
			ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/TraitInfo"):LocalizeAndSetText(strTraitText)
		elseif (g_popuptype == "GREETING") then
			ContextPtr:LookUpControl("/InGame/CityStateGreetingPopup/TraitInfo"):LocalizeAndSetText(strTraitText)
		end
	end
	if strTraitTT ~= nil then
		if (g_popuptype == "DIPLO") then
			ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/TraitInfo"):SetToolTipString(strTraitTT)
			ContextPtr:LookUpControl("/InGame/CityStateDiploPopup/TraitLabel"):SetToolTipString(strTraitTT)
		elseif (g_popuptype == "GREETING") then
			ContextPtr:LookUpControl("/InGame/CityStateGreetingPopup/TraitInfo"):SetToolTipString(strTraitTT)
			ContextPtr:LookUpControl("/InGame/CityStateGreetingPopup/TraitLabel"):SetToolTipString(strTraitTT)
		end
	end
end