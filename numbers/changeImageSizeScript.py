from PIL import Image
from resizeimage import resizeimage
import os, sys

size1 = [25, 25]
size2 = [50, 50]
size3 = [75, 75]
for infile in sys.argv[1:]:
	try:
		image = Image.open(infile)
		cover1 = resizeimage.resize_cover(image, size1, validate=False)
		cover2 = resizeimage.resize_cover(image, size2, validate=False)
		cover3 = resizeimage.resize_cover(image, size3, validate=False)
		cover1.save(os.path.splitext(infile)[0] + "1.png", image.format)
		cover2.save(os.path.splitext(infile)[0] + "1@2x.png", image.format)
		cover3.save(os.path.splitext(infile)[0] + "1@3x.png", image.format)
	except IOError:
		print("cannot create thumbnail for '%s'" % infile)