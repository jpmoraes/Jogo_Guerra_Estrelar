Jogo = Classe:extend()

function Jogo:new()
    nave = Nave()
    tempoInimigo =0
    listaInimigo={}
    listaItem={}

   -- fase ={
        
        ---x, velocidade, tempoAparecer
       -- {100, 75, 2},
       -- {200, 75, 2},
       -- {300, 75, 2},
       -- {700, 150,1},
       -- {600, 75, 2},
       -- {500, 150,1},
      --  {love.math.random(400,700),75,1},
       -- {love.math.random(200,400),200,3}

   -- }
  --  indexFase=1
end

function Jogo:update(dt)
    tempoInimigo = tempoInimigo+dt

   -- if indexFase <= #fase and tempoInimigo > fase[indexFase][3] then
     --   local inimigo = Inimigo(fase[indexFase][1], -100,fase[indexFase][2]) 
     --   table.insert(listaInimigo, inimigo)
     --   tempoInimigo = 0
      --  indexFase=indexFase+1
  --  end

   if tempoInimigo > 1 then
    local inimigo = Inimigo(love.math.random(0,700), -100, 200) 
    table.insert(listaInimigo, inimigo)
    tempoInimigo = 0
    end

    nave:update(dt)

    for i, inimigo in pairs (listaInimigo) do
        inimigo:update(dt)

        if colisao(inimigo, nave) then
            nave:perderVida()
            table.remove(listaInimigo,i)
            nave:voltarNormal()
            if nave.vidas <= 0 then
                cenaAtual= "gameOver"
            end
        end

        if inimigo:removeInimigo() then
            table.remove(listaInimigo,i)
        end

        for j, tiro in pairs (nave.listaTiro) do
            
            if colisao(inimigo, tiro) then
                inimigo.vidas = inimigo.vidas- nave.forcaTiro
               
                
                
                if inimigo.vidas <= 0 then
                    table.remove(listaInimigo,i)
                    nave:pontuacao(inimigo.pontosInimigo)
                    
                    if nave.pontos%3 == 0 then
                    local tipo = love.math.random(1,2)
                    local item = Item(tipo,inimigo.x,inimigo.y)
                    table.insert(listaItem,item)
                    inimigo.contador=0
                    end    
                    
                end

                
                
                table.remove(nave.listaTiro,j)
                
                
            end
        end

    end

    for i, item in pairs (listaItem) do
        item:update(dt)

        if item:removeItem() then
            table.remove(listaItem,i)
        end

        if colisao(nave, item) then
            if item.tipo ==1 then
                nave:disparaTiro()
            elseif item.tipo ==2  then
                nave:ficaRapido()
            end
            --table.remove(listaItem,i)
            
        end
        
    end
end


function Jogo:draw()
    nave:draw()

    for i, inimigo in pairs (listaInimigo) do
        inimigo:draw()
    end
    
    for i=1,nave.vidas do
        love.graphics.draw(nave.imagem,20*i,30,0,0.3)
    end

    for i, item in pairs (listaItem) do
        item:draw()
    end
    love.graphics.print("Pontos: "..nave.pontos, 40,50,0, 1.3)
end

function colisao(a,b)
    if a.x < b.x + b.largura and a.x + a.largura > b.x and a.y < b.y + b.altura and a.y + a.largura > b.y then
        return true
    end
end