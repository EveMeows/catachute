-- honk honk
car = {}

function car:init()
	self.data = {
		sp = 1, spd = 2,
		x = 60, y = 20,
		vx = 0, vy = 0,
		acc = 0.3, deacc = 0.1,
		flp = false,

		rot = {
			avail = true,
			val = 0, max = 5,
			spd = 1.5, deacc = 1,
		},
	}
end

function car:update()
	local data = self.data
	local rot = data.rot

	if btn(0) then
		data.vx = move_towards(data.vx, -data.spd, data.acc)
		data.flp = true

		if rot.avail then
			rot.val = move_towards(rot.val, -rot.max, rot.spd)
		end
	elseif btn(1) then
		data.vx = move_towards(data.vx, data.spd, data.acc)
		data.flp = false

		if rot.avail then
			rot.val = move_towards(rot.val, rot.max, rot.spd)
		end
	else
		data.vx = move_towards(data.vx, 0, data.deacc)
		rot.val = move_towards(rot.val, 0, rot.deacc)
	end

	data.x += data.vx
	data.y += data.vy

	-- clamp cat in the middle of screen
	data.x = mid(0, data.x, 120)
	if data.x == 0 or data.x == 120 then 
		data.vx = 0 
		rot.avail = false

		rot.val = move_towards(rot.val, 0, rot.deacc)
	else
		rot.avail = true
	end

	-- sinewave
	local sy = sin(t() + 20) * 0.3
	data.y += sy
end

function car:draw()
	local data = self.data

	-- parachute
	-- needs adjustement based on key
	local chx = data.x - 5
	if data.flp then
		chx = data.x - 2
	end

	-- draw
	spra(deg2rad(data.rot.val), 16, chx, data.y - 12, 2, 2, false, false, 8, 16)

	-- car
	spr(data.sp, data.x, data.y, 1, 1, data.flp, false)
end