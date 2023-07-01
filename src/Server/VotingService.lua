local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local RequestService = require(script.Parent.Networking.RequestService)

local VotingService = Knit.CreateService({ Name = "VotingService" })

function VotingService:RetrieveVote(player)
	return RequestService:Get("http://api.open-notify.org/iss-now.json")
end


--[[ Client Connections ]]--

function VotingService.Client:RetrieveVote(player)
	return self.Server:RetrieveVote(player)
end

return VotingService
