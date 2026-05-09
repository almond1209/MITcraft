-- inventory.lua
local Inventory = {
    selectedSlot = 1,
    isMenuOpen = false,
    -- List of all blocks available in Creative Mode
    items = {
        { name = "Grass", id = 1, color = {0, 0.8, 0} },
        { name = "Dirt", id = 2, color = {0.5, 0.3, 0.1} },
        { name = "RISC-V Computer", id = 3, color = {0.2, 0.2, 0.2} },
        { name = "Redstone Dust", id = 4, color = {1, 0, 0} },
        { name = "Command Block", id = 5, color = {0.6, 0.4, 0.7} }
    }
}

function Inventory.draw()
    -- Draw the Hotbar at the bottom
    for i, item in ipairs(Inventory.items) do
        -- Highlight the selected slot
        if i == Inventory.selectedSlot then
            love.graphics.setLineWidth(3)
            love.graphics.setColor(1, 1, 0) -- Yellow border
        else
            love.graphics.setLineWidth(1)
            love.graphics.setColor(1, 1, 1) -- White border
        end
        
        -- Draw slot box
        love.graphics.rectangle("line", 200 + (i * 40), 540, 35, 35)
        
        -- Draw item color inside
        love.graphics.setColor(item.color)
        love.graphics.rectangle("fill", 202 + (i * 40), 542, 31, 31)
    end
end

return Inventory