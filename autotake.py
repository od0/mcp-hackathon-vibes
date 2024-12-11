import os

import cv2

# Create a folder to save frames
output_folder = "saved_frames"
os.makedirs(output_folder, exist_ok=True)

# Open the default camera (index 0)
cap = cv2.VideoCapture(0)

if not cap.isOpened():
    print("Error: Could not access the camera.")
    exit()

print("Press 'q' to quit.")

frame_count = 0

while True:
    # Capture frame-by-frame
    ret, frame = cap.read()

    if not ret:
        print("Error: Failed to capture frame.")
        break

    # Save the frame every 1 second
    frame_filename = os.path.join(output_folder, f"frame_{frame_count}.jpg")
    cv2.imwrite(frame_filename, frame)
    print(f"Saved: {frame_filename}")

    frame_count += 1

    # Display the frame
    cv2.imshow("Camera Feed", frame)

    # Wait for 1 second
    key = cv2.waitKey(1000) & 0xFF

    # Break the loop if 'q' is pressed
    if key == ord("q"):
        break

# Release the camera and close windows
cap.release()
cv2.destroyAllWindows()
