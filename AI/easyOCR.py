import easyocr
import cv2
from matplotlib import pyplot as plt
import numpy as np
import sys

IMAGE_PATH=sys.argv[1]
text=""
reader=easyocr.Reader(['ko'],model_storage_directory='EasyOCR/easyocr/model')
result=reader.readtext(IMAGE_PATH)

for i in result:
    text+=i[1]+" "

file = open('result.txt', 'w')
file.write(text)
file.close() 