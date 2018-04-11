-- Title: TouchAndReact
-- Name: John Ngundeng
-- Course: ICS2O/3C
-- This program that displays a button. When you click the button it changes 
-- color and displays text and an image.

-- set the background color 
display.setDefault ("background", 215/255, 61/255, 121/255)
 
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create blue button, set it's position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 98)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true 

-- create red button, set it's position and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 98)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create text object, set it's position and make it invisible
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1, 1, 0)
textObject.isVisible = false


-- creating sound variable
local Sound1 = audio.loadSound("Sounds/Clicked.mp3") 
local Clicked

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text 
-- appear with red button and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		Clicked = audio.play(Sound1)
	end 

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end
end
-- Function: RedButtonListener
-- Input: touch listener
-- Output: none
-- Description: when red button is released, it will make the text disappear
-- and red button
-- disappear, and then blue button reappear
local function RedButtonListener(touch)

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end
end
-- add the event listeners 
blueButton:addEventListener("touch",BlueButtonListener) 
redButton:addEventListener("touch", RedButtonListener)

