-- card

local card = {}

local image = love.graphics.newImage('img/back.png')
card.x = love.graphics.getWidth()/2
card.y = love.graphics.getHeight()/2
card.dx = card.x
card.dy = card.y

-- array for card created
card.deal = {}

function card.create(X,Y)
  local r = {}
  r.x = X
  r.y = Y
  
  -- insert the rock into array
  table.insert(card.deal, r)
end

function card.update(dt)
  local dx = (card.dx - card.x) * 0.1
  local dy = (card.dy - card.y) * 0.1
  
  card.x = card.x + dx
  card.y = card.y + dy
end

function card.draw()
  love.graphics.draw(image, card.x, card.y, 0, 0.2, 0.2, 250, 375)
end

function card.moveTo(x, y)
  card.dx = x
  card.dy = y
end

return card