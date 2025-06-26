game = {}

function game:init()
	self.data = {

	}

	car:init()
end

function game:update()
	car:update()
end

function game:draw()
	cls(12)
	car:draw()
end