from m5stack import *
from m5ui import *
from uiflow import *
import json

from m5mqtt import M5mqtt
#Create mqtt service
m5mqtt = M5mqtt('M5Stack', 'broker.mqttdashboard.com', 1883, '', '', 300)
setScreenColor(0xffffff)
#Create UI
title0 = M5Title(title="PokeFood", x=3 , fgcolor=0xFFFFFF, bgcolor=0x000000)
orderID = M5TextBox(60, 50, "Text", lcd.FONT_Default,0xFFFFFF, rotate=0)
rectangle0 = M5Rect(210, 205, 75, 30, 0x4177c3, 0xFFFFFF)
rectangle1 = M5Rect(120, 205, 75, 30, 0x4177c3, 0xFFFFFF)
rectangle2 = M5Rect(31, 205, 75, 30, 0x4177c3, 0xFFFFFF)
accept = M5TextBox(46, 210, "Accept", lcd.FONT_Default,0xffffff, rotate=0)
cancel = M5TextBox(134, 210, "Cancel", lcd.FONT_Default,0xffffff, rotate=0)
prepared = M5TextBox(216, 210, "Prepared", lcd.FONT_Default,0xFFFFFF, rotate=0)
items = M5TextBox(60, 85, "Text", lcd.FONT_Default,0xFFFFFF, rotate=0)
quantity = M5TextBox(60, 115, "Text", lcd.FONT_Default,0xFFFFFF, rotate=0)
telephone = M5TextBox(60, 145, "Text", lcd.FONT_Default,0xFFFFFF, rotate=0)
status = M5TextBox(60, 175, "Text", lcd.FONT_Default,0xFFFFFF, rotate=0)
image0 = M5Img(85, 98, "res/pokefood.jpg", True)
isProcessed = True
jsonObject = None

#Subscribe to topics
def fun_PokeFood__M5Sub_(topic_data):
  global jsonObject
  isProcessed = False
  image0.hide()
  jsonObject = json.loads(topic_data)
  orderID.setText(str("OrderID: " + jsonObject['order_id']))
  orderID.setColor(0x000000)
  items.setText(str("Items: " + jsonObject['order_items']))
  items.setColor(0x000000)
  quantity.setText(str("Items: " + jsonObject['order_quantity']))
  quantity.setColor(0x000000)
  telephone.setText(str("telephone: " + jsonObject['delivery_id']))
  telephone.setColor(0x000000)
  status.setText(str("Status: waiting to be processed"))
  status.setColor(0xff0000)
  speaker.tone(1800, 200)
  pass

if isProcessed :
  m5mqtt.subscribe(str('pokefood/M5Sub'), fun_PokeFood__M5Sub_)
  
#Accept the order
def buttonA_wasPressed():
  global jsonObject
  accept.setColor(0x000000)
  wait(1)
  accept.setColor(0xffffff)
  m5mqtt.publish(str('pokefood/M5Pub/' + jsonObject['delivery_id']),str('{\"order_status\":\"Order Accepted\"}'))
  status.setText(str("Status: Order Accepted!"))
  status.setColor(0x000000)
  
  pass
btnA.wasPressed(buttonA_wasPressed)

#Cancel the order
def buttonB_wasPressed():
  global jsonObject
  cancel.setColor(0x000000)
  wait(1)
  cancel.setColor(0xffffff)
  m5mqtt.publish(str('pokefood/M5Pub/' + jsonObject['delivery_id']),str('{\"order_status\":\"Order Canceled\"}'))
  status.setText(str("Status: Out of stock!"))
  status.setColor(0x000000)
  wait(5)
  orderID.setColor(0xffffff)
  items.setColor(0xffffff)
  quantity.setColor(0xffffff)
  telephone.setColor(0xffffff)
  status.setColor(0xffffff)
  image0.show()
  pass
btnB.wasPressed(buttonB_wasPressed)

#Feedback the customer that the order is ready
def buttonC_wasPressed():
  global jsonObject
  isProcessed = True
  prepared.setColor(0x000000)
  wait(1)
  prepared.setColor(0xffffff)
  m5mqtt.publish(str('pokefood/M5Pub/' + jsonObject['delivery_id']),str('{\"order_status\":\"Order Prepared\"}'))
  status.setText(str("Status: Order Prepared!"))
  status.setColor(0x000000)
  wait(5)
  orderID.setColor(0xffffff)
  items.setColor(0xffffff)
  quantity.setColor(0xffffff)
  telephone.setColor(0xffffff)
  status.setColor(0xffffff)
  image0.show()
  pass
btnC.wasPressed(buttonC_wasPressed)

m5mqtt.start()
