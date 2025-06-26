function deg2rad(deg)
	local rad = 0.01745329251 -- pi / 180
	return deg * rad
end

-- from my old projects
function move_towards(from,to,delta)if abs(to-from)<=delta then;return to;end;return from+sgn(to-from)*delta;end
function roll_all(min,max)return flr(rnd(max-min))+min;end

-- from pico-8 bbs.
-- made by user mimick
-- slightly modified by me to support sprite rot.
function spra(angle,n,x,y,w,h,flip_x,flip_y,origin_x,origin_y)
 if w==nil or h==nil then
  w,h=8,8
 else
  w=w*8
  h=h*8
 end
 origin_x = origin_x or w/2
 origin_y = origin_y or h/2

 local radius = ceil(sqrt(w*w + h*h))  -- covers whole sprite
 flip_x, flip_y = flip_x and -1 or 1, flip_y and -1 or 1
 local cosa, sina = cos(angle), sin(angle)
 local nx, ny = n%16*8, flr(n/16)*8

 for i=-radius, radius do
  for j=-radius, radius do
   local rx = i - origin_x
   local ry = j - origin_y
   local u = cosa*rx + sina*ry + origin_x
   local v = cosa*ry - sina*rx + origin_y
   if u >= 0 and u < w and v >= 0 and v < h then
    local col = sget(nx + u, ny + v)
    if col != 0 then
     pset(x + flip_x * i, y + flip_y * j, col)
    end
   end
  end
 end
end