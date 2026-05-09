-- Add this to your love.mousereleased function in main.lua
function love.mousereleased(x, y, button)
    local gridX = math.floor(x / blockSize)
    local gridY = math.floor(y / blockSize)

    if button == 1 then -- Left Click: PLACE BLOCK
        local currentItem = Inventory.items[Inventory.selectedSlot]
        world[gridX][gridY] = currentItem.name
        print("Placed: " .. currentItem.name)
        
    elseif button == 2 then -- Right Click: DESTROY BLOCK
        world[gridX][gridY] = "air"
    end
end