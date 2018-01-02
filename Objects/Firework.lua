function Firework_Init()
    firework = {}
    firework.x = math.random() * love.graphics.getWidth()
    firework.y = love.graphics.getHeight()
    firework.die = love.graphics.getHeight() / 2 * math.random()
    firework.color = {}
    firework.color.r = 63 + 192 * math.random()
    firework.color.g = 127 + 128 * math.random()
    firework.color.b = 255 * math.random()
    firework.velocity = love.graphics.getHeight() / (2 + 3 * math.random())
    return firework
end

function Firework_Update(self, dt)
    self.y = self.y - self.velocity * dt
end

function Firework_IsDead(self)
    return self.y <= self.die
end

function Firework_SpawnShards(self, shardConsumer)
    for i = 1, 100 + 400 * math.random() do
        shard = Shard_Init(self)
        shardConsumer(shard)
    end
end

function Firework_Draw(self)
    love.graphics.setColor(self.color.r, self.color.g, self.color.b)
    love.graphics.setPointSize(4)
    love.graphics.points(self.x, self.y)
end
