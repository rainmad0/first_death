maleScene = 'MP_INT_MCS_18_A1'
femaleScene = 'MP_INT_MCS_18_A2'
RegisterCommand('fdeath', function()
    SetCutsceneTriggerArea(0.0, 0.0, 0.0, 0.0, 121.6249, 0.0);
    x = AddNavmeshBlockingObject(-1314.997, -1721.084, 1.1493, 100.0, 100.0, 100.0, 0.0, false, 7)
    SetPedNonCreationArea(-1324.736, -1756.909, -10.0, -1299.695, -1688.181, 10.0)
    SetOverrideWeather('CLEARING')
    SetTransitionTimecycleModifier("Kifflom", 1.0)
    NetworkOverrideClockTime(18, 0, 0)
    N_0xfb680d403909dc70(1, PlayerId() + 32)
    PlayCutscene(maleScene, vector3(-1314.997, -1721.084, 1.1493))
    ClearTimecycleModifier()
    ClearPedNonCreationArea()
    RemoveNavmeshBlockingObject(x)
end)

function PlayCutscene(cut, coords)
    while not HasThisCutsceneLoaded(cut) do 
        RequestCutsceneWithPlaybackList(cut, 29, 8)
        Wait(0) 
    end
    CreateCutscene(coords)
    Finish()
    RemoveCutscene()
    DoScreenFadeIn(500)
end

function CreateCutscene(coords)
    StartCutsceneAtCoords(coords, 0)
    DoScreenFadeIn(250)
end

function Finish()
    local tripped = false
    repeat
        Wait(0)
        if (GetCutsceneTotalDuration() - GetCutsceneTime() <= 250) then
        DoScreenFadeOut(250)
        tripped = true
        end
    until not IsCutscenePlaying()
    if (not tripped) then
        DoScreenFadeOut(100)
        Wait(150)
    end
    return
end
