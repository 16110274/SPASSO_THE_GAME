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
local deck

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
  background = love.graphics.newImage('img/background.jpg')
  
  -- Card
  card = require('card')
  
  -- Deck
  deck = require('deck')
    
  --  Music
  --bgmusic = love.audio.newSource('cavern.ogg', 'stream')
  --bgmusic:setLooping(true)
  --bgmusic:play()
end

function love.update(dt)
  card.update(dt)
end

function love.draw()
  love.graphics.draw(background, 0, 0, 0, 1, 1)
  card.draw()
  deck.draw()
  --showHUD()
end

function love.mousepressed(x, y, button)
  if button == 1 
      and x > card.x - 50 and x < card.x + 50 
      and y > card.y - 75 and y < card.y + 75
    then
    lock = lock - 1
  end
  --harusnya dipisah
  if button == 1
      and x > 680 and x < 780
      and y > 435 and y < 585
    then
    card.create(x,y)
  end
end

function love.mousereleased(x, y, button)
  if button == 1 
      and x > card.x - 50 and x < card.x + 50 
      and y > card.y - 75 and y < card.y + 75
  then
    lock = lock + 1
  end
  --harusnya dipisah
  if button == 1
    --area pemain
    and x > 680 and x < 1200 
    and y > 800 and y < 1000
  then
    lock = -1 --snap -> nilainya ditambah / dikurang
  end
end

function love.mousemoved(x, y)
  if lock == 0 then
    card.moveTo(x, y)
  end
end

local function snap()
  --
end
