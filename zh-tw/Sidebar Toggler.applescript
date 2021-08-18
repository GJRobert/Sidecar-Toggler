

tell application "System Preferences"
	activate
	set the current pane to pane id "com.apple.preference.sidecar"
	get the name of every anchor of pane id "com.apple.preference.sidecar"
	delay 1
	tell application "System Events"
		set target_button to a reference to (first button whose name is "中斷連線") of (window "並行" of application process "System Preferences")
		if target_button exists then
			click target_button
		else
			-- 第一段先確保藍牙有開。需要使用 blueutil ☞ How can I write an Apple Script in order to check if bluetooth and ethernet are on or off? - Ask Different <https://apple.stackexchange.com/questions/158924/how-can-i-write-an-apple-script-in-order-to-check-if-bluetooth-and-ethernet-are/158939>
			set btStatus to do shell script "/usr/local/bin/blueutil -p"

			if btStatus = "0" then do shell script "/usr/local/bin/blueutil -p 1"

		
				delay 3
				
				-- 第二段才開 Sidecar
				tell application "System Preferences"
					activate
					reveal pane id "com.apple.preference.sidecar"
					-- set the current pane to pane id "com.apple.preferences.sidecar"
					delay 1
					tell application "System Events"
						click menu button "選擇裝置" of window "並行" of application process "System Preferences"
						count menu items of menu of menu button "選擇裝置" of window "並行" of application process "System Preferences"
						select item 1 of menu button "選擇裝置" of window "並行" of application process "System Preferences"
						key code 125
						key code 76
					end tell
				end tell
			
		end if
	end tell
	quit
end tell