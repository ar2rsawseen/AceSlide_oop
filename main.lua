stage:setOrientation(Stage.LANDSCAPE_LEFT)

--initialize slider
local slider = AceSlide.new({
	orientation = "horizontal",
	spacing = 100,
	speed = 5,
	unfocusedAlpha = 0.75,
	easing = nil,
	allowDrag = true,
	dragOffset = 10
})

stage:addChild(slider)

--create 10 boxes
for i = 1, 10 do
	local box = Bitmap.new(Texture.new("images/crate.png"))
	slider:add(box)
end

--just to show as example
--of modifying all elements
slider:applyToAll(function(elem)
	elem:setScale(2)
end)

--display slider
slider:show()


--create buttons to switch content
local leftButton = Button.new(Bitmap.new(Texture.new("images/left-up.png")), Bitmap.new(Texture.new("images/left-down.png")))
leftButton:setPosition((application:getDeviceHeight()-leftButton:getWidth())/5, (application:getDeviceWidth()/2)-(leftButton:getHeight()/2))
stage:addChild(leftButton)
leftButton:addEventListener("click", 
	function()	
		slider:prevItem()
	end
)

local rightButton = Button.new(Bitmap.new(Texture.new("images/right-up.png")), Bitmap.new(Texture.new("images/right-down.png")))
rightButton:setPosition(((application:getDeviceHeight()-rightButton:getWidth())/5)*4, (application:getDeviceWidth()/2)-(rightButton:getHeight()/2))
stage:addChild(rightButton)
rightButton:addEventListener("click", 
	function()	
		slider:nextItem()
	end
)
	