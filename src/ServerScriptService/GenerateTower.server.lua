-- About: Using the module TowerGeneration.lua, we generate a tower
-- Developer/GameCreator: Minhnormal
-- Date started: 3/3/2021

local ServerScriptService = game:GetService("ServerScriptService")

local serverModules = ServerScriptService.ServerModules
local towerGenerationModules = serverModules.TowerGeneration

local towerGenerationModule = require(towerGenerationModules.TowerGeneration)

local towerGeneration = towerGenerationModule:create()
towerGeneration:generate()
