from paddleocr import PaddleOCR,draw_ocr
import csv, sys
# Paddleocr supports Chinese, English, French, German, Korean and Japanese.
# You can set the parameter `lang` as `ch`, `en`, `fr`, `german`, `korean`, `japan`
# to switch the language model in order.

inhibit_list = list()
f = open("inhibit_list.csv",'r')
rea = csv.reader(f)
for row in rea:
    inhibit_list.append(row)
f.close

ocr = PaddleOCR(use_angle_cls=True, lang='korean',use_gpu=False) # need to run only once to download and load model into memory
img_path = './test2.jpg'
result = ocr.ocr(img_path, cls=True)
text=""
for line in result:
    #print(line)
    text+=line[1][0]+"\n"

for s in inhibit_list:
    if s[0] in text:
        sys.exit("inhibited text detected : "+s[0])
    else:
        print('success')