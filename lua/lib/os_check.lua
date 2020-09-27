local os_check = {}

os_check.get = function()
  local separator = package.config:sub(1,1) 
  if separator == "\\" then
      return "win"
  elseif separator == "/" then
      return "unix"
  end
  return ""
end

return os_check
