function Shard_Init(firework)
    shard = {}

    shard.x = firework.x
    shard.y = firework.y
    shard.color = firework.color
    
    local r = love.graphics.getWidth() / 5 * math.random()

    local vx = -1 + 2 * math.random()
    local vy = -1 + 2 * math.random()
    local len = vx * vx + vy * vy
    if len == 0 then
        len = 1
    end
    local lensq = math.sqrt(len)

    vx = vx / lensq
    vy = vy / lensq

    shard.vx = vx * r
    shard.vy = vy * r

    shard.life = 1 + 3 * math.random()
    shard.tick = 0

    return shard
end

function Shard_Update(self, dt)
    self.tick = self.tick + dt
    self.x = self.x + self.vx * dt
    self.y = self.y + self.vy * dt
end

function Shard_Draw(self)
    love.graphics.setColor(self.color.r, self.color.g, self.color.b)
    love.graphics.setPointSize(2)
    love.graphics.points(self.x, self.y)
end

function Shard_IsDead(self)
    return self.tick >= self.life
end
