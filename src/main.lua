---------------------------------------------------------------------------
-- SPASSO THE GAME
-- Author: SPASSO TEAM
-- 
-- main.lua
-- Main entry point
---------------------------------------------------------------------------

-- coordinates
local width
local height
local lock

-- music and font
--local bgmusic
--local font

-- references for game objects
local background
local card

-- score and button
--local score

-- show Head Up Display (HUD)
local function showHUD()
  --love.graphics.print('score: ' .. score, 10, 10)
end

-- reset the game
local function resetGame()
  -- write your code here
end

function love.load()
  -- System
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  lock = 1
  
  -- Background
  background = love.graphics.newImage('img/neko.jpg')
  
  -- Card
  card = require('card')
  card.x = width/2
  card.y = height/2
    
  --  Music
  --bgmusic = love.audio.newSource('cavern.ogg', 'stream')
  --bgmusic:setLooping(true)
  --bgmusic:play()
end

function love.update(dt)
  card.update(dt)
end

function love.draw()
  love.graphics.draw(background, 0, 0, 0, 0.5, 0.5)
  card.draw()
  --showHUD()
end

function love.mousepressed(x, y, button)
    if button == 1 
      and x > card.x - 40 and x < card.x + 40 
      and y > card.y - 51 and y < card.y + 51
    then
    lock = 0
  end
end

function love.mousereleased(x, y, button)
  if button == 1 then
    lock = 1
  end
end

function love.mousemoved(x, y)
  if lock == 0 then
    card.moveTo(x, y)
  end
end
