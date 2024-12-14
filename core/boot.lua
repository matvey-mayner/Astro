local package = dofile("/lib/package.lua")

local function dofile(file)
  status("> " .. file)
  local program, reason = raw_loadfile(file)
  if program then
    local result = table.pack(pcall(program))
    if result[1] then
      return table.unpack(result, 2, result.n)
    else
      error(result[2])
    end
  else
    error(reason)
  end
end

do
  _G.component = nil
  _G.computer = nil
  _G.package = package

  package.loaded.component = component
  package.loaded.computer = computer
  package.loaded.fs = dofile("/lib/fs.lua")
end
