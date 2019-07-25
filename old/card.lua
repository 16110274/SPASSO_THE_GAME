local card = {}

local image = love.graphics.newImage('img/back.png')
card.dealed = {}

function card.create(X,Y)
  -- create card object
  local r = {}
  r.x = X
  r.y = Y
  r.dx = r.x
  r.dy = r.y
  -- insert into array
  table.insert(card.dealed, r)
end

function card.update(dt)
  for i = #card.dealed, 1, -1 do
    local r = card.dealed[i]
    local dx = (r.dx - r.x) * 0.1
    local dy = (r.dy - r.y) * 0.1  
    r.x = r.x + dx
    r.y = r.y + dy
  end
end

function card.draw()
  for i = #card.dealed, 1, -1 do
    local r = card.dealed[i]
    love.graphics.draw(image, r.x, r.y, 0, 0.2, 0.2, 250, 375)
  end
end

function card.moveTo(x, y)
  for i = #card.dealed, 1, -1 do
    local r = card.dealed[i]
    r.dx = x
    r.dy = y
  end
end
return card