-- card

local card = {}

local image = love.graphics.newImage('img/dark.jpg')
card.x = 480
card.y = 270
card.dx = card.x
card.dy = card.y

function card.update(dt)
  local dx = (card.dx - card.x) * 0.1
  local dy = (card.dy - card.y) * 0.1
  
  card.x = card.x + dx
  card.y = card.y + dy
end

function card.draw()
  love.graphics.draw(image, card.x, card.y, 0, 0.1, 0.1, 400, 512)
end

function card.moveTo(x, y)
  card.dx = x
  card.dy = y
end

return card