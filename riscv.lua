-- computer_block.lua
local Computer = {}

function Computer.new()
    local self = {
        -- RISC-V has 32 registers (x0 to x31)
        registers = {}, 
        -- Virtual memory for this specific block
        memory = {},
        pc = 1 -- Program Counter (which line of code are we on?)
    }
    
    -- Initialize registers to 0 (x0 is always 0 in RISC-V)
    for i = 0, 31 do self.registers[i] = 0 end
    
    return self
end

-- A very basic "instruction executor" 
function Computer.runInstruction(self, instruction)
    -- Example: ADDI x1, x0, 5 (Add Immediate: Set register 1 to 5)
    if instruction.op == "ADDI" then
        self.registers[instruction.rd] = self.registers[instruction.rs1] + instruction.imm
    
    -- Example: ADD x3, x1, x2 (Add registers 1 and 2, save to 3)
    elseif instruction.op == "ADD" then
        self.registers[instruction.rd] = self.registers[instruction.rs1] + self.registers[instruction.rs2]
    end
    
    self.pc = self.pc + 1
end

return Computer