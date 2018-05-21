require("colors")

local indexNamed = {}
local indexIndexed = {}
local indexUsed = {}

function love.load()
  fonte1 = love.graphics.newFont(18)
  fonte2 = love.graphics.newFont(14)
  for i,c in pairs(namedColors) do
    local color = {}
    color.color = c
    color.name = i
    table.insert(indexNamed, color)
  end
  local num = 1
  for i,c in ipairs(indexedColors) do
    local color = {}
    color.color = c
    color.name = "N°"..num
    table.insert(indexIndexed, color)
    num = num + 1
  end
  indexUsed = indexNamed
  message = {}
  message.text = "..."
  message.height = fonte1:getHeight()
  message.width = fonte1:getWidth(message.text) / 2
  message.x = 487
  message.y = 537 - message.height/2
end

function love.update(dt)
  --TODO: Add some usefull thinks here ! ;)
end

function love.draw()
  love.graphics.setFont(fonte2)
  love.graphics.print("Space to switch colors table, clic on colored square to get infos")
  local num = 1
  for l=1,9 do
    for c=1,15 do
      love.graphics.setColor(indexUsed[num].color)
      love.graphics.rectangle("fill", 25 + (c-1)*50, 25 + (l-1)*50, 50, 50)
      love.graphics.setColor(1,1,1)
      love.graphics.rectangle("line", 25 + (c-1)*50, 25 + (l-1)*50, 50, 50)
      num = num + 1
    end
  end
  for i=1,3 do
      love.graphics.setColor(indexUsed[num].color)
      love.graphics.rectangle("fill", 25 + (i-1)*50, 25 + (9)*50, 50, 50)
      love.graphics.setColor(1,1,1)
      love.graphics.rectangle("line", 25 + (i-1)*50, 25 + (9)*50, 50, 50)
      num = num + 1
  end
  love.graphics.rectangle("line", 200, 500, 575, 75)
  love.graphics.setFont(fonte2)
  if indexUsed == indexNamed then
    love.graphics.print("table used : namedColors", 205, 505)
  else
    love.graphics.print("table used : indexedColors", 205, 505)
  end
  love.graphics.setFont(fonte1)
  love.graphics.print(message.text, message.x, message.y)
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
  if key == "space" then
    if indexUsed == indexNamed then
      indexUsed = indexIndexed
    else
      indexUsed = indexNamed
    end
  end
end

function love.mousepressed(x, y, button)
  if x < 25 or x > 775 then return end
  if y < 25 or y > 525 then return end
  x = math.floor((x-25) / 50) + 1
  y = (math.floor((y-25) / 50)) * 15
  local num = x + y
  print(num)
  if num > 138 then return end
  message.text = "Color = "..indexUsed[num].name.." - RGB = {"..indexUsed[num].color[1]..","..indexUsed[num].color[2]..","..indexUsed[num].color[3].."}"
  message.x = 487 - fonte1:getWidth(message.text) / 2
end
