---------------------------------------------------------------------------
-- SPASSO THE GAME
-- Author: SPASSO TEAM
-- 
-- main.lua
-- Main entry point
---------------------------------------------------------------------------

math.randomseed(os.time()) -- so that the results are always different

--import
require 'fyshuffle'

local background
local currentScreen
local player_turn = 1

function love.load()
  --System
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  
  --Background
  background = love.graphics.newImage('img/background.jpg')
  title = love.graphics.newImage('img/Title.png')
    
  --BGM
  bgm = love.audio.newSource('music.wav', 'stream')
  bgm:setLooping(true)
  bgm:play()
  
  --Menu
  currentScreen = 'menu'
  
  --Deck
  Deck = {}
  back = love.graphics.newImage('img/back.png')
  
  --Card list
  Card = {}
  Card["A"] = {}
  Card["A"]["Score"] = 1
  Card["A"]["Front"] = 'img/a.png'
  Card["B"] = {}
  Card["B"]["Score"] = 1
  Card["B"]["Front"] = 'img/b.png'
  Card["C"] = {}
  Card["C"]["Score"] = 1
  Card["C"]["Front"] = 'img/c.png'
  Card["D"] = {}
  Card["D"]["Score"] = 1
  Card["D"]["Front"] = 'img/d.png'
  Card["E"] = {}
  Card["E"]["Score"] = 1
  Card["E"]["Front"] = 'img/e.png'
  Card["F"] = {}
  Card["F"]["Score"] = 2
  Card["F"]["Front"] = 'img/f.png'
  Card["G"] = {}
  Card["G"]["Score"] = 2
  Card["G"]["Front"] = 'img/g.png'
  Card["H"] = {}
  Card["H"]["Score"] = 2
  Card["H"]["Front"] = 'img/h.png'
  Card["I"] = {}
  Card["I"]["Score"] = 3
  Card["I"]["Front"] = 'img/i.png'
  Card["J"] = {}
  Card["J"]["Score"] = 3
  Card["J"]["Front"] = 'img/j.png'

  --Counter
  Pick ={}

  --Player
  Player ={}

end

function love.update(dt)
  if currentScreen == 'game' 
  then
    gameUpdate(dt)
  elseif currentScreen == 'result' 
  then
    resultUpdate(dt)
  else
    menuUpdate(dt)
  end
end

function love.draw()
  if currentScreen == 'game' 
  then
    gameDraw(dt)
  elseif currentScreen == 'result' 
  then
    resultDraw(dt)
  else
    menuDraw(dt)
  end
end

function menuUpdate(dt)
  local x, y = love.mouse.getX(), love.mouse.getY()
  if love.mouse.isDown(1)
  and x > 618 and x < 1366
  and y > 407 and y < 768
  then
    currentScreen = 'game'
    init_game()
  end
end

function gameUpdate(dt)
  if table.getn(Pick) == 0 and table.getn(Deck) == 0
  then
    currentScreen = 'result'
  end
end

function resultUpdate(dt)
  local x, y = love.mouse.getX(), love.mouse.getY()
  if love.mouse.isDown(1)
  and x > 500 and x < 1366
  and y > 500 and y < 768
  then
    currentScreen = 'menu'
  end
end

function menuDraw(dt)
  love.graphics.setBackgroundColor(255, 255, 255, 255)
  love.graphics.draw(title, 433, 250, 0, 1, 1)
  
  love.graphics.setColor(0,0,0)
  love.graphics.setNewFont(20)
  love.graphics.print('Click to Start ', 618, 470)
  love.graphics.setColor(255,255,255)
end

function gameDraw()
  --Background
  love.graphics.draw(background, 0, 0, 0, 1, 1)
  love.graphics.draw(back, 370, 285, 0, 0.2, 0.2)
    
  --Draw Counter
  if Pick ~= nill 
  then
    for i=1, table.getn(Pick) do
      picked = love.graphics.newImage(Card[Pick[i]]["Front"])
      love.graphics.draw(picked, 470+80*i, 305, 0, 0.75, 0.75)
    end
  end
  
  --Draw Player
  for i=1, 4 do
    if Player[i] ~= nill 
    then
      for j=1, table.getn(Player[i]["Card"])do
        hand = love.graphics.newImage(Card[Player[i]["Card"][j]]["Front"])
        if i == 1
        then
          love.graphics.draw(hand, 540+15*j, 585, 0, 0.75, 0.75)
        elseif i == 2
        then
          love.graphics.draw(hand, 175, 415-15*j, math.pi/2, 0.75, 0.75)
        elseif i == 3
        then
          love.graphics.draw(hand, 775-15*j, 145, math.pi, 0.75, 0.75)
        elseif i == 4
        then
          love.graphics.draw(hand, 1160, 295+15*j, -math.pi/2, 0.75, 0.75)
        end
      end
    end
  end
  
  --Score Player
  love.graphics.setColor(0,0,0)
  love.graphics.setNewFont(12)
  love.graphics.print('score: ' .. Player[1]["Score"], 500, 575)
  love.graphics.print('score: ' .. Player[2]["Score"], 100, 525)
  love.graphics.print('score: ' .. Player[3]["Score"], 770, 140)
  love.graphics.print('score: ' .. Player[4]["Score"], 1195, 165)
  love.graphics.print('card left: ' .. table.getn(Deck), 380, 445)
  
  --Draw Info
  if table.getn(Pick) == 0
  then
    love.graphics.setNewFont(22)
    love.graphics.print('CLICK DECK TO DRAW', 550, 350)
  end
  love.graphics.setColor(255,255,255)
end

function resultDraw()
end

function love.mousepressed(x, y, button)
  if button == 1 
    and x > 370 and x < 470
    and y > 285 and y < 435
    and (Pick == nill or table.getn(Pick) < 1)
  then
    deal_deck()
  end
  
  if Pick ~= nill 
  then
    for i = 1, table.getn(Pick) do
      X = 470+80*i
      if button == 1
        and y > 305 and y < 417
        and x > X and x < X + 75
      then
        playerGetCard(Pick,i,1)
        table.remove(Pick, i)
        player_turn = 2
        
        --enemy move
        for j = 2,4 do
          if table.getn(Pick) < 1
          then
            deal_deck()
          end
          playerGetCard(Pick,math.random(table.getn(Pick)),j)
          table.remove(Pick, table.getn(Pick))
          
          if player_turn == 4
          then
            player_turn = 1
          else
            player_turn = player_turn + 1
          end
        end
      end
    end
  end
end

--Game initiation
function init_game()
  --Deck init
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
  
  --Player init
  for i=1, 4 do
    Player[i] = {}
    Player[i]["Card"] = {}
    Player[i]["Score"] = 0
  end
end

--Deal Deck
function deal_deck()
  for i=1, 5 do
    Pick[i] = Deck[table.getn(Deck)]
    table.remove(Deck)
  end
end

--Player take card
function playerGetCard(GetCard,id,Playerid)
  table.insert(Player[Playerid]["Card"], GetCard[id])
  Score = Card[GetCard[id]]["Score"]
  Player[Playerid]["Score"] = Player[Playerid]["Score"] + Score
end
