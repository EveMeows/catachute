world = {
	active = nil
}

function world:set(new)
	if new == nil then
		return
	end

	self.active = new
	self.active:init()
end

function world:update()
	if self.active != nil then
		self.active:update()
	end
end

function world:draw()
	if self.active != nil then
		self.active:draw()
	end
end