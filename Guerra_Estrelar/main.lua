altura_tela = love.graphics.getHeight()
largura_tela = love.graphics.getWidth()

function love.load()
    Classe = require "classic"
    require "cenas/jogo"
    require "cenas/telaInicial" 
    require "cenas/gameOver"
    require "classes/nave"
    require "classes/tiro"
    require "classes/inimigo"
    require "classes/item"
    jogo = Jogo()
    telaInicial = TelaInicial()
    gameOver = GameOver()

    cena ={
        jogo = jogo,
        telaInicial = telaInicial,
        gameOver = gameOver

    }
    cenaAtual = "telaInicial"
end

function love.update(dt)
 --jogo:update(dt)
    cena[cenaAtual]:update(dt)

end

function love.draw()
    --jogo:draw()
    cena[cenaAtual]:draw()
end

 