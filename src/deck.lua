-- card

local deck = {}
function deck:new (card_data)
    local self = { 
        _id = nil
    }
end

local image = love.graphics.newImage('img/back.png')
deck.x = 730
deck.y = 510

function deck.update(dt)
  
end

function deck.draw()
  love.graphics.draw(image, deck.x, deck.y, 0, 0.2, 0.2, 250, 375)
end

return deck