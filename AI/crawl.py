from pathlib import Path
root = Path().cwd()/"images"

from jmd_imagescraper.core import * # dont't worry, it's designed to work with import *

keywords=['군대상장']

for i in keywords:
    duckduckgo_search(root,i,i,max_results=10)