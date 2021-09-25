import easyocr
import cv2
from matplotlib import pyplot as plt
import numpy as np

IMAGE_PATH='images/군대상장/004_46775a1c.jpg'
text=""
reader=easyocr.Reader(['ko'])
result=reader.readtext(IMAGE_PATH)

for i in result:
    text+=i[1]+" "

print(text)