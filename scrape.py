import time
import sys
from PIL import Image
from selenium import webdriver
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.firefox.options import Options as FirefoxOptions
from selenium import webdriver
#Initialise Selenium
options = FirefoxOptions()
options.add_argument("--headless")
driver = webdriver.Firefox(options=options, executable_path='/greenminds/geckodriver')
driver.set_window_size(800, 554)
# Get screenshow
driver.get("http://77.68.77.144:7000/grafData.html")
time.sleep(2)
driver.get_screenshot_as_file("/greenminds/screengrab.png") 
driver.quit()
# Save to Apache root
Image.open("/greenminds/screengrab.png").save("/var/www/html/screengrab.bmp")
# Log operation
file_object = open('/greenminds/greenminds.log', 'a')
file_object.write("{}\n".format(time.strftime("%Y%m%d %H:%M:%S")))
file_object.close()
