GameOver= Classe:extend()


function GameOver:new()
    self.imagem = love.graphics.newImage("recursos/imagens/game over.jpg")
end

function GameOver:update(dt)
    if love.keyboard.isDown("x") then
        cenaAtual = "telaInicial"
    end
end

function GameOver:draw()
    love.graphics.draw(self.imagem)
    love.graphics.print("Aperte X para voltar ao menu", 200, altura_tela/2)
end