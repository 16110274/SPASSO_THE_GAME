---------------------------------------------------------------------------
-- SPASSO THE GAME
-- Author: SPASSO TEAM
-- 
-- main.lua
-- Main entry point
---------------------------------------------------------------------------
--io.stdout:setvbuf("no") --Debug Output

--import
require 'fyshuffle'

local background

--Card list
Card = {}
Card["A"] = {}
Card["A"]["Score"] = 1
Card["A"]["Front"] = 'img/back.png'
Card["B"] = {}
Card["B"]["Score"] = 1
Card["B"]["Front"] = 'img/back.png'
Card["C"] = {}
Card["C"]["Score"] = 1
Card["C"]["Front"] = 'img/back.png'
Card["D"] = {}
Card["D"]["Score"] = 1
Card["D"]["Front"] = 'img/back.png'
Card["E"] = {}
Card["E"]["Score"] = 1
Card["E"]["Front"] = 'img/back.png'
Card["F"] = {}
Card["F"]["Score"] = 2
Card["F"]["Front"] = 'img/back.png'
Card["G"] = {}
Card["G"]["Score"] = 2
Card["G"]["Front"] = 'img/back.png'
Card["H"] = {}
Card["H"]["Score"] = 2
Card["H"]["Front"] = 'img/back.png'
Card["I"] = {}
Card["I"]["Score"] = 3
Card["I"]["Front"] = 'img/back.png'
Card["J"] = {}
Card["J"]["Score"] = 3
Card["J"]["Front"] = 'img/back.png'

--Deck initiation
Deck = {}
for i= 1, 14 do --14
  Deck[i]="A"
end
for i= 15, 28 do
  Deck[i]="B"
end
for i= 29, 40 do --12
  Deck[i]="C"
end
for i= 41, 52 do
  Deck[i]="D"
end
for i= 53, 64 do
  Deck[i]="E"
end
for i= 65, 72 do --8
  Deck[i]="F"
end
for i= 73, 80 do
  Deck[i]="G"
end
for i= 81, 88 do
  Deck[i]="H"
end
for i= 89, 94 do --6
  Deck[i]="I"
end
for i= 95, 100 do
  Deck[i]="J"
end
--Shuffle Deck
Deck = FYShuffle(Deck)

--Deal Deck
function deal_deck()
  Pick ={}
  for i=1, 5 do
    Pick[i] = Deck[table.getn(Deck)]
    table.remove(Deck)
  end
end

--Player
Player ={}
for i=1, 4 do
  Player[i] = {}
  Player[i]["Card"] = {}
  Player[i]["Score"] = 0
end

--Player take card
function playerGetCard(GetCard,Playerid) --GETCARD object?
  Player[Playerid]["Card"] = GetCard["A"]["Front"]
  Player[Playerid]["Score"] = Player[Playerid]["Score"]+GetCard["A"]["Score"]
end

function love.draw()
  love.graphics.draw(background, 0, 0, 0, 1, 1)
  
  if Pick ~= nill then
    for i=1, 5 do
      picked = love.graphics.newImage(Card[Pick[i]]["Front"])
      love.graphics.draw(picked, 470+80*i, 305, 0, 0.15, 0.15)
    end
  end
  
  for i=1, 4 do
    love.graphics.print('score: ' .. Player[i]["Score"], 100, 100)
    if Player[i] ~= nill then
      for j=1, table.getn(Player[i]["Card"])do
        hand = love.graphics.newImage(Card[Player[i]["Card"][j]]["Front"])
        love.graphics.draw(hand, 200, 200)
      end
    end
  end
  
end

function love.load()
  -- System
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  
  -- Background
  background = love.graphics.newImage('img/background.jpg')
end

function love.update()
end

function love.mousepressed(x, y, button)
  deal_deck()
end
