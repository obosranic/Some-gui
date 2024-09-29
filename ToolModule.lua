-- Define the module as a table
local ToolModule = {}

function ToolModule.createTool(player)
    if not player then return end  -- Check if the player exists

    -- Create a new tool
    local tool = Instance.new("Tool")
    tool.Name = "MyTool"
    tool.RequiresHandle = true
    tool.Parent = player.Backpack

    -- Create a handle for the tool
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(1, 1, 1)
    handle.CanCollide = false
    handle.Parent = tool

    -- Define what happens when the tool is activated
    local function onActivated()
        local good = Instance.new("Part", workspace)
        good.Size = Vector3.new(5, 5, 5)
        good.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 10, 0)
    end

    tool.Activated:Connect(onActivated)  -- Connect the Activated event to the function
end

-- Return the module so we can use it like a 'require'
return ToolModule
