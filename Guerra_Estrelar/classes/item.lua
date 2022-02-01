Item = Classe:extend()

function Item:new(tipo,x,y)
    self.x = x
    self.y =y
    self.tipo =tipo
    self.velocidade = 200

    if self.tipo ==1 then
      self.imagem = love.graphics.newImage("recursos/imagens/raioDourado.png")  
    elseif self.tipo == 2 then
      self.imagem = love.graphics.newImage("recursos/imagens/raioAzul.png") 
    
    end

    self.largura = self.imagem:getWidth()
    self.altura = self.imagem:getHeight()
end

function Item:update(dt)
    self.y = self.y + self.velocidade * dt

end

function Item:draw()
    love.graphics.draw(self.imagem, self.x, self.y,0,0.2)
end


function Item:removeItem()
    if self.y > altura_tela then
        return true
    end
    return false

end
