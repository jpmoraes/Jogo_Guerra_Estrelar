Nave = Classe:extend()

function Nave:new()
    self.imagem = love.graphics.newImage("recursos/imagens/nave.png")
    self.x = 400
    self.y = 300
    self.largura = self.imagem:getWidth()
    self.altura = self.imagem:getHeight()
    self.velocidade =200
    self.listaTiro ={}
    self.pontos = 0
    self.vidas=3
    self.tmpTiro=0

    self.forcaTiro=1
end

function Nave:update(dt)
    self:mover(dt)
    self:manter_tela()

   for i, tiro in pairs(self.listaTiro) do
    tiro:update(dt)

        if tiro:removetiro() then
            table.remove(self.listaTiro,i)
        end

   end
   self.tmpTiro=self.tmpTiro + dt
    if love.keyboard.isDown("space") and self.tmpTiro > 0.2  then
        self.tmpTiro=0
        self:atirar(dt)
    end
end

function Nave:draw()
       
    for i, tiro in pairs(self.listaTiro) do
        tiro:draw()
    end
    --love.graphics.print(#self.listaTiro)
    love.graphics.draw(self.imagem,self.x,self.y)
    
    
end

function  Nave:mover(dt)
    if love.keyboard.isDown("up") then
        self.y = self.y - self.velocidade*dt
    elseif love.keyboard.isDown("down") then
        self.y = self.y + self.velocidade*dt
    end

    if love.keyboard.isDown("left") then
        self.x = self.x - self.velocidade*dt

    elseif love.keyboard.isDown("right") then
        self.x = self.x + self.velocidade*dt
    end
   

end

function Nave:manter_tela ()
    if self.x <0 then
        self.x=0
    elseif self.x + self.largura > largura_tela then
        self.x = largura_tela - self.largura

    end

    if self.y <0 then
        self.y= 0
    elseif self.y + self.largura > altura_tela then
        self.y = altura_tela - self.altura
    end

end


function  Nave:atirar(dt)
    local tiro=Tiro(self.x + self.largura/2 ,self.y)
    table.insert(self.listaTiro,tiro)
end;

function Nave:pontuacao(pontosInimigos)
    self.pontos = self.pontos + pontosInimigos
    
end

function Nave:perderVida()
    self.vidas = self.vidas-1
end

function Nave:ganharVida()
    self.vidas = self.vidas+1
    
end

function Nave:disparaTiro()
    self.forcaTiro = self.forcaTiro + 0.1
end

function Nave:ficaRapido()
    self.velocidade = self.velocidade + 0.2
end

function Nave:voltarNormal()
    self.velocidade = 200
end