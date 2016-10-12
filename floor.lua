--[[
floor by oxguy3
Lays down a rectangular floor of blocks

how to execute: floor <length> <width>

The following ASCII diagram is a birdseye view 
of how your turtle should be positioned when you 
start this program. The caret (^) represents 
your turtle, which should be facing the direction 
the caret is pointing. The C represents the chest 
or container that has all your blocks for the 
floor, and the # symbols represent the wall/edge 
of your floor area.

  ####C#
      ^#
       #

Assumptions made by this program:

- The turtle has enough fuel for the entire job.
- 'length' is no greater than 64.
- The chest/container has enough blocks.
- There are no blocks in the way of the turtle's
  path.

--]]

local args = { ... }
length=tonumber(args[1])
width=tonumber(args[2])

function aggroForward()
  while not turtle.forward() do
    turtle.attack()
  end
end


for i=0,width do
  turtle.turnRight()
  for j=0,i-2 do
    aggroForward()
  end
  turtle.turnLeft()
  turtle.suck(length)
  turtle.turnLeft()
  for j=0,i-1 do
    aggroForward()
  end
  turtle.turnLeft()
  for j=0,length-1 do
    turtle.placeDown()
    if j ~= length-1 then
      aggroForward()
    end
  end
  turtle.turnLeft()
  turtle.turnLeft()
  for j=0,length-2 do
    aggroForward()
  end
end
