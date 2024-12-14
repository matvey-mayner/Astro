local term = {}

local component = require("component")
local gpu = component.gpu

function term.clear()
  local w, h = 80, 25
  gpu.setResolution(resolutionX, resolutionY)
  gpu.fill(1, 1, w, h, " ")
end

function term.print(text)
    local x, y = 1, 1
    for line in content:gmatch("[^\n]+") do
        gpu.set(x, y, line)
        y = y + 1
        if y > resolutionY then
            y = 1
            term.clear()
        end
    end
end

return term
