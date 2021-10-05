# import about image segmentation
import numpy as np
from PIL import Image
from matplotlib import pyplot as plt
from copy import deepcopy
import cv2

from model import Deeplabv3

# import about easyocr -> PaddleOCR
# import easyocr
from paddleocr import PaddleOCR,draw_ocr
import csv
import os,sys

# Generates labels using most basic setup.  Supports various image sizes.  Returns image labels in same format
# as original image.  Normalization matches MobileNetV2

# input image through argv
IMAGE_PATH=sys.argv[1]
# make temp directory
if(not(os.path.exists('./temp'))):
    os.mkdir('./temp')

# OCR Code Start
'''
text=""
reader=easyocr.Reader(['ko'],model_storage_directory='EasyOCR/easyocr/model')
result=reader.readtext(IMAGE_PATH)
'''
ocr = PaddleOCR(use_angle_cls=True, lang='korean',use_gpu=False)
result = ocr.ocr(IMAGE_PATH, cls=True)
text=""

for line in result:
    #print(line)
    text+=line[1][0]+"\n"

inhibit_list = list()
f = open("inhibit_list.csv",'r')
rea = csv.reader(f)
for row in rea:
    inhibit_list.append(row)
f.close
#print(inhibit_list)

# for i in result:
#     text+=i[1]+" "
#print(text)

for s in inhibit_list:
    if s[0] in text:
        sys.exit("inhibited text detected")
# OCR Code Finish

# Image Segmentation Start
trained_image_width=512 
mean_subtraction_value=127.5
image = np.array(Image.open(IMAGE_PATH))
orig_imginal = np.array(image)
target = 'person'

LABEL_NAMES = [
    'background', 'aeroplane', 'bicycle', 'bird', 'boat', 'bottle', 'bus',
    'car', 'cat', 'chair', 'cow', 'diningtable', 'dog', 'horse', 'motorbike',
    'person', 'pottedplant', 'sheep', 'sofa', 'train', 'tv'
]

# resize to max dimension of images from training dataset
w, h, _ = image.shape
ratio = float(trained_image_width) / np.max([w, h])
resized_image = np.array(Image.fromarray(image.astype('uint8')).resize((int(ratio * h), int(ratio * w))))

# apply normalization for trained dataset images
resized_image = (resized_image / mean_subtraction_value) - 1.

# pad array to square image to match training images
pad_x = int(trained_image_width - resized_image.shape[0])
pad_y = int(trained_image_width - resized_image.shape[1])
resized_image = np.pad(resized_image, ((0, pad_x), (0, pad_y), (0, 0)), mode='constant')

# make prediction
deeplab_model = Deeplabv3()
res = deeplab_model.predict(np.expand_dims(resized_image, 0))
labels = np.argmax(res.squeeze(), -1)

# remove padding and resize back to original image
if pad_x > 0:
    labels = labels[:-pad_x]
if pad_y > 0:
    labels = labels[:, :-pad_y]
labels = np.array(Image.fromarray(labels.astype('uint8')).resize((h, w)))
# Image Segmentation Finish

# Image Blur Start
person_not_person_mapping = deepcopy(image)  # Seperating background & foreground classes using Segmap.
person_not_person_mapping[labels != LABEL_NAMES.index(target)] = 0        # Replacing the pixel intensity values to 0 where the car class is not found in segmentation map  i.e changing background to balck.
person_not_person_mapping[labels == LABEL_NAMES.index(target)] = 255

mapping_resized = cv2.resize(person_not_person_mapping, # Resizing the mapped image to the original image size.
                             (orig_imginal.shape[1],
                              orig_imginal.shape[0]),
                             Image.ANTIALIAS)

gray = cv2.cvtColor(mapping_resized, cv2.COLOR_BGR2GRAY) # Converting mapped image to gary.
blurred = cv2.GaussianBlur(gray,(15,15),0) # Applying the gaussin blur effect.
ret3,thresholded_img = cv2.threshold(blurred,0,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU) # Applying binarization based on Otsu's

mapping = cv2.cvtColor(thresholded_img, cv2.COLOR_GRAY2RGB)

blurred_original_image = cv2.GaussianBlur(orig_imginal, (251,251), 0)

layered_image = np.where(mapping != (0,0,0), orig_imginal, blurred_original_image)

im_rgb = cv2.cvtColor(layered_image, cv2.COLOR_BGR2RGB) # Saving the new bokeh image.
cv2.imwrite("./temp/result.jpg", im_rgb)
# Image Blur Finish