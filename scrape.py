
import time
import sys
from selenium import webdriver
from selenium.webdriver.firefox.options import Options

from selenium.webdriver.firefox.options import Options as FirefoxOptions
from selenium import webdriver
options = FirefoxOptions()
options.add_argument("--headless")
driver = webdriver.Firefox(options=options, executable_path='/greenminds/geckodriver')
driver.set_window_size(800, 490)
driver.get("https://mimi777.000webhostapp.com/grafData3.html")
time.sleep(2)
driver.get_screenshot_as_file("/greenminds/screengrab.png") 
driver.quit()
file_object = open('/greenminds/greenminds.log', 'a')
file_object.write("{}\n".format(time.strftime("%Y%m%d %H:%M:%S")))
file_object.close()