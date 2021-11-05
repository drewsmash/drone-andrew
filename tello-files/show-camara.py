from djitellopy import Tello
import cv2, math, time

tello = Tello()
tello.connect()

tello.streamon()
frame_read = tello.get_frame_read()

while True:
    frame = frame_read.frame
    cv2.imshow("Tello", frame)
    key = cv2.waitKey(1)
    if key == ord('q'):
        break
    time.sleep(0.05)