function LaunchTimer_Init()
    return {
        interval = 1,
        diff = 0.2,
        tick = 0,
        next = 0
    }
end

function LaunchTimer_Update(self, dt, spawn)
    self.tick = self.tick + dt

    if self.tick >= self.next then
        LaunchTimer_Reset(self)
        spawn()
    end
end

function LaunchTimer_Reset(self)
    self.tick = 0
    self.next = self.interval - self.diff + self.diff * 2 * math.random()
end
