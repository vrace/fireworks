require("Scenes/MainScene")

local currentScene = nil

function love.load()
    love.window.setTitle("2018")
    currentScene = MainScene
    currentScene.load()
end

function love.update(dt)
    currentScene.update(dt)
end

function love.draw()
    currentScene.draw()
end
