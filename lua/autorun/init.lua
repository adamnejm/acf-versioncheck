AddCSLuaFile()

-- fuck nrlulz, bubus and other acf fags for thinking their addons deserve special attention

if CLIENT then
	-- ACF-3 & ACF-3 Missiles
	timer.Simple(1, function()
	    net.Receive("ACF_VersionSync", function() end)
	end)
	
	-- ACF (only suppress the chat printing, there's no other way reliable way)
	local src_chatAddText = chat.AddText
	chat.AddText = function(a, b, ...)
		if a == Color(255,0,0) and b == "A newer version of ACF is available!" then
			chat.AddText = src_chatAddText
			src_chatAddText = nil
		else
			src_chatAddText(a, b, ...)
		end
	end
	-- revert override if not printing anything
	timer.Simple(10, function()
		if not src_chatAddText then return end
		chat.AddText = src_chatAddText
		src_chatAddText = nil
	end)
else
	-- ACF Missiles
	timer.Simple(1, function()
		net.Receive("acfm_versioncheck", function() end)
	end)
end
