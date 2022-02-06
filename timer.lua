-- customize timer UI --
local label = script.Parent

local ReplicatedStorage = game:GetService('ReplicatedStorage')
local timeEvent = ReplicatedStorage:WaitForChild('TimeEvent')

-- get seconds from server script --
timeEvent.OnClientEvent:Connect(function(seconds)
	-- format seconds to mm:ss --
	local min = math.floor(seconds / 60)
	local sec = seconds % 60
	if (seconds > 0) then
		if (sec < 10 )	
		then 
			label.Text = min..":0"..sec
		else 
			label.Text = min..":"..sec
		end
	else
		label.Text = "Time's up!"
	end
	
end)