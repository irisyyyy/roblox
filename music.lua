local SoundService = game:GetService("SoundService")
local lobbymusic = SoundService.LobbyMusic
local gamemusic = SoundService.GameMusic


local ReplicatedStorage = game:GetService('ReplicatedStorage')
local playGameMusic = ReplicatedStorage:WaitForChild("PlayGameMusic")
local timeEvent = ReplicatedStorage:WaitForChild('TimeEvent')
local endGameEvent = ReplicatedStorage:WaitForChild('EndGame')


lobbymusic:Play()

playGameMusic.OnClientEvent:Connect(function(changeMusic)
	if changeMusic == true then
		gamemusic:Play()
		-- fade in/out --
		for x = 0.25, 0, -0.05 do
			lobbymusic.Volume = x
			gamemusic.Volume = 0.3 - x
			wait(0.1)
		end
		lobbymusic:Stop()
		
	end
	
end)

-- switch back to lobby bgm when game ends--
endGameEvent.OnClientEvent:Connect(function(endGame)
	lobbymusic:Play()
	for x = 0.25, 0, -0.05 do
		gamemusic.Volume = x
		lobbymusic.Volume = 0.3 - x
		wait(0.1)
	end
	gamemusic:Stop()
	
end)