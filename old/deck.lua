local deck = {}
function deck:new (card_data)
    local self = {
      stack = {}
    }
      k = 0
      --CARD A & B
      for i = 0, 1 do
        for j = 0, 13 do
          k = k+(14*i+j)
          self.stack[k] = 1
        end
      end
      --CARD C & D & E
      for i = 0, 2 do
        for j = 0, 11 do
          k = k+(12*i+j)
          self.stack[k] = 1
        end
      end
      --CARD F & G & H
      for i = 0, 2 do
        for j = 0, 7 do
          k = k+(8*i+j)
          self.stack[k] = 2
        end
      end
      --CARD C & D & E
      for i = 0, 1 do
        for j = 0, 5 do
          k = k+(6*i+j)
          self.stack[k] = 3
        end
      end  
end

local remove = function()
  return table.remove(self.stack,0)
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