-- About: Generate Map using Noise
-- Developer/GameCreator: Minhnormal
-- Date: 3/3/2021

local TowerGeneration = {}

function TowerGeneration:create()
    local newTowerGeneration = setmetatable({
        towerParent = workspace;

        towerShape = "Rectangle";

        wallThickness = Vector3.new(10, 10, 10);

        framePosition = Vector3.new(
            0,
            600,
            0
        );

        frameSize = Vector3.new(
            100,
            1000,
            100
        )

    }, self)

    self.__index = self
    return newTowerGeneration
end


local function hollowOutPart(partToHollowOut, hollowers)
    return partToHollowOut:SubtractAsync(hollowers)
end


function TowerGeneration:createWalls()
    if self.towerShape == "Rectangle" then
        local outerPart = Instance.new("Part")
        outerPart.Anchored = true

        outerPart.Position = self.framePosition
        outerPart.Size = self.frameSize + self.wallThickness

        outerPart.Parent = self.towerParent

        local hollower = Instance.new("Part")
        hollower.Anchored = true
        
        hollower.Size = self.frameSize 
        hollower.Position = self.framePosition

        hollower.Parent = self.towerParent

        -- The walls are a hollowed out cube
        self.walls = hollowOutPart(outerPart, {hollower})
        self.walls.Name = "TowerWalls"
        self.walls.Parent = self.towerParent

        hollower:Destroy()
        outerPart:Destroy()
    end
end


function TowerGeneration:generate()
    -- Main function right here bois.
    self:createWalls()
end

return TowerGeneration
