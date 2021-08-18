

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
			-- 第一段先確保藍牙有開。Credit：Gariele Cirulli <https://stackoverflow.com/questions/19752438/applescript-to-toggle-bluetooth#answer-26824210>
			
			tell application "System Preferences"
				activate
				-- reveal pane id "com.apple.preferences.Bluetooth"
				-- activate
				
				set the current pane to pane id "com.apple.preferences.Bluetooth"
				get the name of every anchor of pane id "com.apple.preferences.Bluetooth"
				delay 1
				tell application "System Events"
					set target_button to a reference to (first button whose name is "開啟藍牙") of (window "藍牙" of application process "System Preferences")
					if target_button exists then
						-- display notification "" with title "沒有按鈕" subtitle "" sound name "Sosumi"
						click target_button
						-- delay 3
					else
						-- click button "開啟藍牙" of window "藍牙" of application process "System Preferences"
						display notification "" with title "藍牙原本就是開著的了。" subtitle "" sound name "Sosumi"
					end if
				end tell
				
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
			end tell
		end if
	end tell
	quit
end tell