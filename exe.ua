from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time
 
test1 = webdriver.Chrome()
test1.get('https://exe.ua')

title = test1.find_element(By.XPATH,'//*[@id="search_query"]')

items = ["Монітор","Мишка","Смартфони","Телевізори","Ноутбуки"]
Ex_titles= ['Монітор DELL 31.6" S3225QC HDMI, USB-C, MM, QD-OLED, 3840x2160, 120Hz, 0.03ms, sRGB (210-BRVT)',
            'Мишка A4Tech FG45CS Air Wireless lcy Blue (4711421993210)',
            'Смартфон Tecno Spark 30 (KL6) 8/128GB Astral Ice (4894947047909)',
            'Телевізор HISENSE 50E7Q',
            'Ноутбук Lenovo V15 G4 AMN (82YU00QYPB)(15.6"/Ryzen 5 7520U/16/SSD512/DOS)']
time.sleep(2)
time.sleep(0.5)
search = test1.find_element(By.XPATH,'//*[@id="search_query"]')
 
 
for elem in items:
    try:
        time.sleep(0.5)
        search = test1.find_element(By.XPATH,'//*[@id="search_query"]')
        search.clear()
        search.send_keys(elem)
        search.send_keys(Keys.ENTER)
        time.sleep(2)
        title = test1.find_element(By.XPATH,'//*[@id="product-list"]/div[2]/div[1]/div/h5[1]/a')
        if title :
            print("ok")
            if title.text in Ex_titles:
                print(title.text)
            else :
                print("not title")
        else:
            print("not")
 
    except Exception as e :
        print("Error")
 
test1.quit()
print("test 1 - finished")
