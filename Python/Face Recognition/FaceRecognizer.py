import face_recognition
import cv2
import numpy as np
import os
import glob

faces_encodings = []
faces_names = []
cur_dir = os.getcwd()
path = os.path.join(cur_dir, 'Data/Faces/')
list_of_files = [f for f in glob.glob(path+'*.jpg')]
number_files = len(list_of_files)
names = list_of_files.copy()

for i in range(number_files):
    globals()['image_{}'.format(i)] = face_recognition.load_image_file(list_of_files[i])
    globals()['image_encoding_{}'.format(i)] = face_recognition.face_encodings(globals()['image_{}'.format(i)])[0]
    faces_encodings.append(globals()['image_encoding_{}'.format(i)])
# Create array of known names
    names[i] = names[i].replace(cur_dir, "")
    faces_names.append(names[i])

print(faces_names)

face_locations = []
face_encodings = []
face_names = []
process_this_frame = True
video_capture = cv2.VideoCapture(0)
