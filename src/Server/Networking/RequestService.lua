local API_Token = require(script.Parent.API_Token)
local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local HTTP = game:GetService("HttpService")

local RequestService = Knit.CreateService({ Name = "RequestService" })

function RequestService:Get(url, headers)
	local success, response, data

	if headers == nil then
		headers = {}
	end
	headers["x-api-key"] = API_Token

	success, response = pcall(function()
		return HTTP:GetAsync(url, false, headers)
	end)
	if not success then 
		error("GET request failed for address [" .. url .."]: " .. response)
		return nil
	end

	success, data = pcall(function()
		return HTTP:JSONDecode(response)
	end)
	if not success then
		error("GET request failed for address [" .. url .."]: " .. data)
		return nil
	end

	return data
end

function RequestService:Post(url, requestBody, headers)
	local success, response, requestBodyEncoded, data

	if headers == nil then
		headers = {}
	end
	headers["x-api-key"] = API_Token
	
	success, requestBodyEncoded = pcall(function()
		return HTTP:JSONEncode(requestBody)
	end)
	if not success then
		error("POST request failed for address [" .. url .."]: " .. requestBodyEncoded)
		return nil
	end

	success, response = pcall(function()
		return HTTP:PostAsyncAsync(url, requestBodyEncoded, Enum.HttpContentType.ApplicationJson, false, headers)
	end)
	if not success then 
		error("POST request failed for address [" .. url .."]: " .. response)
		return nil
	end

	success, data = pcall(function()
		return HTTP:JSONDecode(response)
	end)
	if not success then
		error("POST request failed for address [" .. url .."]: " .. data)
		return nil
	end

	return data
end


--[[ Client Connections ]]--



return RequestService