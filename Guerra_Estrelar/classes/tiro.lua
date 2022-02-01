Tiro= Classe:extend()

function Tiro:new(x,y)
    self.x =x
    self.y =y
    self.velocidade= 500
    self.altura = 8
    self.largura = 3

end

function Tiro:update (dt)
    self.y =self.y - self.velocidade*dt
    
end

function Tiro:draw()
    love.graphics.rectangle("fill",self.x,self.y,3,8)
    
end

function Tiro:removetiro()
    if self.y < -self.altura then
        return true
      
    end
    return false

end