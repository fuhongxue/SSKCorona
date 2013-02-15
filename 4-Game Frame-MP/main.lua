-- =============================================================
-- Copyright Roaming Gamer, LLC. 2009-2013 
-- =============================================================
-- main.lua
-- =============================================================
-- Short and Sweet License: 
-- 1. You may use anything you find in the SSKCorona library and sampler to make apps and games for free or $$.
-- 2. You may not sell or distribute SSKCorona or the sampler as your own work.
-- 3. If you intend to use the art or external code assets, you must read and follow the licenses found in the
--    various associated readMe.txt files near those assets.
--
-- Credit?:  Mentioning SSKCorona and/or Roaming Gamer, LLC. in your credits is not required, but it would be nice.  Thanks!
--
-- =============================================================
--
-- =============================================================

print("\n\n\n****************************************************************")
print("*********************** \\/\\/ main.cs \\/\\/ **********************")
print("****************************************************************\n\n")
io.output():setvbuf("no") -- Don't use buffer for console messages

----------------------------------------------------------------------
--	1.							GLOBALS								--
----------------------------------------------------------------------
require( "ssk.globals" ) -- Load Standard Globals (DO NOT MODIFY)
require( "data.globals" ) -- Override settings  from ssk.globals here.

----------------------------------------------------------------------
-- 2. LOAD MODULES													--
----------------------------------------------------------------------
local storyboard = require "storyboard"
local physics = require("physics")

require("ssk.loadSSK")

----------------------------------------------------------------------
-- 3. ONE-TIME INITIALIZATION										--
----------------------------------------------------------------------
-- == 
--    STATUS BAR 
-- ==
display.setStatusBar(display.HiddenStatusBar)

-- == 
--    PHYSICS
-- ==
--physics.start()
--physics.setGravity( 0, 9.8 )
--physics.setDrawMode( "hybrid" ) -- "normal", "debug", "hybrid"

-- == 
--    MULTITOUCH
-- ==
system.activate("multitouch")

-- == 
--    FONTS
-- ==
--
-- Note: Names may be different on simulator and on device due to way
-- Windows/OS X/iOS/Android differ in loading fonts
--
-- Note: You may need to extend this section, depending on how you use
-- fonts in your game.
--

if(onSimulator) then
	gameFont = native.systemFontBold
	helpFont = native.systemFont
else
	gameFont = native.systemFontBold
	helpFont = native.systemFont
end

-- == 
--    USER PRESETS
-- ==
require("data.rg_basicButtons.presets")
require("data.rg_basicLabels.presets")
require("data.rg_basicSounds.presets")


-- == 
--    DEFAULT PRESETS
-- ==
require("data.buttons")
require("data.labels")
require("data.sounds")



-- Load SSK Presets (Buttons, Labels, and Sounds)
-- 
-- Note: Do not modify these files.  Add custom settings in the user files above instead.
--
local soundsInit = require("ssk.presets.sounds")
local labelsInit = require("ssk.presets.labels")
local buttonsInit = require("ssk.presets.buttons")

local player require("data.player")

----------------------------------------------------------------------
-- 4. LOAD SPRITE / SET UP ANIMATIONS								--
----------------------------------------------------------------------
--
-- EFM WORK IN PROGRESS
--
----------------------------------------------------------------------
-- Load sprites and set up animations
--ssk.easysprites.createSpriteSet( "letterTiles", imagesDir .. "letterTiles.png", 80, 80, 54 )

----------------------------------------------------------------------
-- 5. LOAD BEHAVIORS												-- 
----------------------------------------------------------------------
--
-- EFM WORK IN PROGRESS
--
----------------------------------------------------------------------
--[[ 
local behaviorsList = 
{

	"mover_faceTouch",
	"mover_faceTouchFixedRate",
	"mover_moveToTouchFixedRate",
	"mover_moveToTouch",
	"mover_dragDrop",
--	"mover_onTouch_applyForwardForce",
--	"mover_onTouch_applyContinuousForce",
--	"mover_onTouch_applyTimedForce",
	
	"onCollisionEnded_ExecuteCallback",
	"onCollision_ExecuteCallback",

--	"onCollisionEnded_PrintMessage",
--	"onCollision_PrintMessage",
--	"onPostCollision_PrintMessage",
--	"onPreCollision_PrintMessage",
	
--	"physics_hasForce",

}

for k,v in ipairs( behaviorsList ) do
	require( "ssk.behaviors.b_" .. v )
end
 --]]

----------------------------------------------------------------------
-- 6. CALCULATE COLLISION MATRIX									-- 
----------------------------------------------------------------------
--
-- Set up a global collision calculator (here) if you have only
-- one set of collision settings.  If, on the other hand, you have
-- different settings for different parts of your game, create
-- and configure collision calulculators as you need them.
--
----------------------------------------------------------------------
--[[
_G.myCC = ssk.ccmgr:newCalculator()
_G.myCC:addName("player")
_G.myCC:addName("enemy")
_G.myCC:addName("playerBullet")
_G.myCC:addName("enemyBullet")
_G.myCC:collidesWith("player", "enemy", "enemyBullet")
_G.myCC:collidesWith("playerBullet", "enemy")
_G.myCC:dump()
--]]

----------------------------------------------------------------------
-- 7. CONFIGURE SOUND & MUSIC										--
----------------------------------------------------------------------
--  This section assumes that the current player has certain
--  settings.  To modify these settings edit "data/player.lua"
--
--  Starts a sound track if the player has music enabled.
----------------------------------------------------------------------
ssk.sounds:setEffectsVolume(currentPlayer.effectsVolume)

ssk.sounds:setMusicVolume(currentPlayer.musicVolume)

if(currentPlayer.musicEnabled) then
	ssk.sounds:play("bouncing")
end

----------------------------------------------------------------------
-- 8. DEBUG STUFF													--
----------------------------------------------------------------------
-- Print the collision matrix data
--collisionCalculator:dump()
--ssk.display.listDPP()


ssk.debug.dumpScreenMetrics()
--ssk.debug.dumpFonts()
ssk.debug.printLuaVersion()
ssk.debug.monitorMem()


print("\n****************************************************************")
print("*********************** /\\/\\ main.cs /\\/\\ **********************")
print("****************************************************************")
----------------------------------------------------------------------
--								LOAD FIRST SCENE					--
----------------------------------------------------------------------
storyboard.gotoScene( "interfaces.splashLoading" )
--storyboard.gotoScene( "interfaces.mainMenu" )
--storyboard.gotoScene( "interfaces.credits" )
--storyboard.gotoScene( "interfaces.options" )
--storyboard.gotoScene( "interfaces.join_2P_Auto" )
--storyboard.gotoScene( "interfaces.host_2P_Auto" )
--storyboard.gotoScene( "interfaces.notMe" )
--storyboard.gotoScene( "interfaces.notMeDialog" )
--storyboard.gotoScene( "interfaces.playGUI" )