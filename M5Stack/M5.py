from m5stack import *
from m5ui import *
from uiflow import *
import json

from m5mqtt import M5mqtt

setScreenColor(0x222222)


m5mqtt = M5mqtt('M5Stack', 'broker.mqttdashboard.com', 1883, '', '', 300)

title0 = M5Title(title="Title", x=3 , fgcolor=0xFFFFFF, bgcolor=0x0000FF)
orderID = M5TextBox(60, 50, "Text", lcd.FONT_Default,0xFFFFFF, rotate=0)
accept = M5TextBox(45, 210, "Accept", lcd.FONT_Default,0xffffff, rotate=0)
cancel = M5TextBox(134, 210, "Cancel", lcd.FONT_Default,0xFFFFFF, rotate=0)
dispatch = M5TextBox(216, 210, "Dispatch", lcd.FONT_Default,0xFFFFFF, rotate=0)
items = M5TextBox(60, 85, "Text", lcd.FONT_Default,0xFFFFFF, rotate=0)
deliveryID = M5TextBox(60, 120, "Text", lcd.FONT_Default,0xFFFFFF, rotate=0)
status = M5TextBox(60, 155, "Text", lcd.FONT_Default,0xFFFFFF, rotate=0)

jsonObject = None


def fun_PokeFood__M5Sub_(topic_data):
  global jsonObject
  jsonObject = json.loads(topic_data)
  orderID.setText(str("OrderID: " + jsonObject['order_id']))
  orderID.setColor(0x000000)
  items.setText(str("Items: " + jsonObject['order_items']))
  items.setColor(0x000000)
  deliveryID.setText(str("DeliveryID: " + jsonObject['delivery_id']))
  deliveryID.setColor(0x000000)
  status.setText(str("Status: waiting to be processed"))
  status.setColor(0xff0000)
  speaker.tone(1800, 200)
  pass
m5mqtt.subscribe(str('PokeFood\\M5Sub'), fun_PokeFood__M5Sub_)

def buttonA_wasPressed():
  global jsonObject
  accept.setColor(0xff0000)
  wait(1)
  accept.setColor(0x000000)
  m5mqtt.publish(str('PokeFood\\M5Pub'),str('Order Accepted'))
  status.setText(str("Status: Accepted!"))
  status.setColor(0x000000)
  pass
btnA.wasPressed(buttonA_wasPressed)

def buttonB_wasPressed():
  global jsonObject
  cancel.setColor(0xff0000)
  wait(1)
  cancel.setColor(0x000000)
  m5mqtt.publish(str('PokeFood\\M5Pub'),str('Order Canceled'))
  status.setText(str("Status: Canceled!"))
  status.setColor(0x000000)
  pass
btnB.wasPressed(buttonB_wasPressed)

def buttonC_wasPressed():
  global jsonObject
  dispatch.setColor(0xff0000)
  wait(1)
  dispatch.setColor(0x000000)
  m5mqtt.publish(str('PokeFood\\M5Pub'),str('Order Dispatched'))
  status.setText(str("Status: Dispatched!"))
  status.setColor(0x000000)
  pass
btnC.wasPressed(buttonC_wasPressed)


setScreenColor(0xffffcc)
title0.setTitle('PokeFood')
title0.setBgColor(0x000000)
accept.setColor(0x000000)
cancel.setColor(0x000000)
dispatch.setColor(0x000000)
m5mqtt.start()