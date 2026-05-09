-- MITcraft Base Setup
local world = {}
local inventory = {}
local player = { x = 400, y = 300, speed = 200 }
local blockSize = 32

function love.load()
    -- 1. FLAT WORLD GENERATION
    -- Generating a 100x20 flat world of "Grass" blocks
    for x = 1, 100 do
        world[x] = {}
        for y = 1, 20 do
            if y == 1 then
                world[x][y] = "grass"
            else
                world[x][y] = "dirt"
            end
        end
    end

    -- 2. BASIC INVENTORY
    inventory = {
        { item = "Dirt", count = 64 },
        { item = "Spawn Egg", count = 5 },
        { item = "Command Block", count = 1 }
    }
end

function love.update(dt)
    -- Simple Movement
    if love.keyboard.isDown("right") then player.x = player.x + player.speed * dt end
    if love.keyboard.isDown("left") then player.x = player.x - player.speed * dt end
end

function love.draw()
    -- Render World
    for x, column in ipairs(world) do
        for y, blockType in ipairs(column) do
            if blockType == "grass" then love.graphics.setColor(0, 0.8, 0)
            else love.graphics.setColor(0.5, 0.3, 0.1) end
            
            love.graphics.rectangle("fill", x * blockSize, y * blockSize + 400, blockSize - 1, blockSize - 1)
        end
    end

    -- 3. UI / GUI (Simplified)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("MITcraft Alpha - Creative Mode", 10, 10)
    love.graphics.print("Inventory: " .. inventory[1].item .. " x" .. inventory[1].count, 10, 30)
    
    -- Draw Player
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", player.x, player.y, 20, 40)
end