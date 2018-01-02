require("Objects/LaunchTimer")
require("Objects/Firework")
require("Objects/Shard")

MainScene = {}

function MainScene.load()
    print("[MainScene] Load")
    timer = LaunchTimer_Init()
    fireworks = {}
    shards = {}
end

function MainScene.update(dt)
    LaunchTimer_Update(timer, dt, MainScene.spawnFirework)
    MainScene.updateFireworks(dt)
    MainScene.updateShards(dt)
end

function MainScene.updateFireworks(dt)
    local i = 1
    while i <= #fireworks do
        firework = fireworks[i]
        Firework_Update(firework, dt)
        
        if Firework_IsDead(firework) then
            Firework_SpawnShards(firework, MainScene.consumeShard)
            table.remove(fireworks, i)
        else
            i = i + 1
        end
    end
end

function MainScene.updateShards(dt)
    local i = 1
    while i <= #shards do
        shard = shards[i]
        Shard_Update(shard, dt)

        if Shard_IsDead(shard) then
            table.remove(shards, i)
        else
            i = i + 1
        end
    end
end

function MainScene.draw()
    width = love.graphics.getWidth()
    love.graphics.printf("Goodbye 2017! Welcome 2018!", 0, 50, width, "center")
    
    for i = 1, #fireworks do
        Firework_Draw(fireworks[i])
    end
    
    for i = 1, #shards do
        Shard_Draw(shards[i])
    end
end

function MainScene.spawnFirework()
    firework = Firework_Init()
    table.insert(fireworks, firework)
end

function MainScene.consumeShard(shard)
    table.insert(shards, shard)
end
