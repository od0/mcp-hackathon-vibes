on run
    set imageFolder to (choose folder with prompt "Select folder containing images:")
    
    tell application "Claude"
        activate
        tell application "System Events"
            key code 49 using {option down} -- Option + Space (only once at start)
            delay 0.5
            
            -- Type the system prompt
            keystroke "Hey, you're going to recieve live footage of a crowd. Would you be my personal DJ for this event? Try to use spotify to play songs that match the crowd's energy."
            delay 0.2
            keystroke return
            delay 0.2
            keystroke return
            delay 0.5
        end tell
    end tell
    
    repeat
        tell application "Finder"
            set imageFiles to files of imageFolder
            set randomImage to some item of imageFiles
        end tell
        
        -- Copy the image itself to clipboard
        tell application "System Events"
            set the clipboard to (read (randomImage as alias) as «class PNGf»)
        end tell
        
        tell application "Claude"
            activate
            
            tell application "System Events"
                -- Paste the image
                keystroke "v" using {command down}
                delay 0.5
                
                -- Send the message
                keystroke return
                delay 0.2
                keystroke return
            end tell
        end tell
        
        delay 10
    end repeat
end run