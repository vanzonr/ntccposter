#!/bin/bash
cat > /tmp/mywordcloud.py <<EOF
#!/usr/bin/env python
import wordcloud
from wordcloud import WordCloud, STOPWORDS
import matplotlib.pyplot as plt
import matplotlib as mpl
import numpy as np
from PIL import Image

cmap = mpl.colors.LinearSegmentedColormap.from_list('my_gradient_cmap', [
(1.00,0.961,0.737),
(0.769, 1.00, 0.776)])
mpl.colormaps.register(name='my_gradient_cmap', cmap=cmap)

text_file = "Downloads/trainingwords.txt"
with open(text_file, "r") as f:
	text = f.read()

wordcloud_instance = WordCloud(
        stopwords=STOPWORDS,
        background_color="white",
        width=540,
        height=280,
        margin=0,
        colormap='my_gradient_cmap',
        min_font_size=7,
        max_font_size=13,
        repeat=True
    )

wordcloud_instance.generate(text)
print("A")
s = wordcloud_instance.to_svg()
with open("wordcloud.svg", "w") as f:
	print(s.replace('_',' '),file=f)
print("B")
EOF
python /tmp/mywordcloud.py

