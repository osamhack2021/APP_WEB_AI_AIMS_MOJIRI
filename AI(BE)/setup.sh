git clone https://github.com/bonlime/keras-deeplab-v3-plus.git
pip3 install --upgrade pip
pip3 install -r requirements.txt
cp run.py keras-deeplab-v3-plus/
sed -i "170s/.*/    in_channels = inputs.shape[-1]/g" ./keras-deeplab-v3-plus/model.py
