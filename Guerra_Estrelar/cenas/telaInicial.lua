TelaInicial= Classe:extend()


function TelaInicial:new()
    self.imagem = love.graphics.newImage("recursos/imagens/tela inicial.png")
    self.op ={"Jogar", "Sair"}

    self.icSelect = {}
    self.icSelect.imagem = love.graphics.newImage("recursos/imagens/nave.png")
    self.icSelect.x = largura_tela/2 - 70
    self.icSelect.y = altura_tela/2 +50

    self.escolha = 1 ---1 jogar, 2 sair
    self.tempoEscolha = 0
end

function TelaInicial:update(dt)
    self.tempoEscolha = self.tempoEscolha + dt
    if love.keyboard.isDown("up","down") and self.tempoEscolha >0.5 then
        self.tempoEscolha = 0
        if self.icSelect.y == altura_tela/2 + 50 then
            self.icSelect.y = altura_tela/2 + 100
            self.escolha=2
        elseif self.icSelect.y == altura_tela/2 + 100 then
            self.icSelect.y = altura_tela/2 + 50
            self.escolha = 1
        end

    end

    if love.keyboard.isDown("space") then
        
        if self.escolha == 1 then
            cenaAtual = "jogo"
            jogo:new()
        elseif self.escolha==2 then
            love.event.quit()
        end
    end
end

function TelaInicial:draw()
    love.graphics.draw(self.imagem)

    for i=1, #self.op do
        love.graphics.print(self.op[i], largura_tela/2, altura_tela/2 + 50*i)
    end

    love.graphics.draw(self.icSelect.imagem,self.icSelect.x,self.icSelect.y,1.5,0.3)
end