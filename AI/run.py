import numpy as np
from PIL import Image
from matplotlib import pyplot as plt
from copy import deepcopy
import cv2

from model import Deeplabv3

from paddleocr import PaddleOCR,draw_ocr
import csv
import os,sys

IMAGE_PATH=sys.argv[1]

ocr = PaddleOCR(use_angle_cls=True, lang='korean',use_gpu=False)
result = ocr.ocr(IMAGE_PATH, cls=True)
text=""

for line in result:
    text+=line[1][0]+"\n"

inhibit_list = list()
f = open("inhibit_list.csv",'r')
rea = csv.reader(f)
for row in rea:
    inhibit_list.append(row)
f.close

for s in inhibit_list:
    if s[0] in text:
        sys.exit("inhibited text detected : "+s[0])

trained_image_width=512 
mean_subtraction_value=127.5
image = np.array(Image.open(IMAGE_PATH))
orig_imginal = np.array(image)

target = [
    'bicycle', 'bird', 'bottle', 'cat', 'chair', 'cow', 
    'diningtable', 'dog', 'horse','person', 
    'pottedplant', 'sheep', 'sofa']

LABEL_NAMES = [
    'background', 'aeroplane', 'bicycle', 'bird', 'boat', 'bottle', 'bus',
    'car', 'cat', 'chair', 'cow', 'diningtable', 'dog', 'horse', 'motorbike',
    'person', 'pottedplant', 'sheep', 'sofa', 'train', 'tv'
]

w, h, _ = image.shape
ratio = float(trained_image_width) / np.max([w, h])
resized_image = np.array(Image.fromarray(image.astype('uint8')).resize((int(ratio * h), int(ratio * w))))

resized_image = (resized_image / mean_subtraction_value) - 1.

pad_x = int(trained_image_width - resized_image.shape[0])
pad_y = int(trained_image_width - resized_image.shape[1])
resized_image = np.pad(resized_image, ((0, pad_x), (0, pad_y), (0, 0)), mode='constant')

deeplab_model = Deeplabv3()
res = deeplab_model.predict(np.expand_dims(resized_image, 0))
labels = np.argmax(res.squeeze(), -1)

if pad_x > 0:
    labels = labels[:-pad_x]
if pad_y > 0:
    labels = labels[:, :-pad_y]
labels = np.array(Image.fromarray(labels.astype('uint8')).resize((h, w)))

person_not_person_mapping = deepcopy(image)
for content in target:
    person_not_person_mapping[labels != LABEL_NAMES.index(content)] = 0
    person_not_person_mapping[labels == LABEL_NAMES.index(content)] = 255

mapping_resized = cv2.resize(person_not_person_mapping, (orig_imginal.shape[1], orig_imginal.shape[0]), Image.ANTIALIAS)

gray = cv2.cvtColor(mapping_resized, cv2.COLOR_BGR2GRAY)
blurred = cv2.GaussianBlur(gray,(15,15),0)
ret3,thresholded_img = cv2.threshold(blurred,0,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)

mapping = cv2.cvtColor(thresholded_img, cv2.COLOR_GRAY2RGB)

blurred_original_image = cv2.GaussianBlur(orig_imginal, (251,251), 0)

layered_image = np.where(mapping != (0,0,0), orig_imginal, blurred_original_image)

im_rgb = cv2.cvtColor(layered_image, cv2.COLOR_BGR2RGB)
cv2.imwrite("/home/osam22/APP_WEB_AI_AIMS_MOJIRI/WEB/temp/result.jpg", im_rgb)
