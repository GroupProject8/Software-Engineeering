<p align="right"><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/logo1_pokefood.png" width=30% /></p>

System Design
======

## Table of Contents

**[Architecture of the entire system](#jump)**  <br>

**[Object-Oriented design of key sub-systems](#jump1)**  <br>
&emsp; [Desktop Application](#jump11) <br>
&emsp; [IoT Device](#jump12)  <br>
&emsp; [Web Application](#jump13)  <br>

**[Requirements of key sub-systems](#jump2)** <br>
&emsp; [Desktop Application](#jump21) <br>
&emsp; [M5Stack](#jump22) <br>
&emsp; [Web Application](#jump23) <br>

**[The evolution of UI wireframes](#jump3)** <br>
&emsp; [Desktop ](#jump31) <br>
&emsp; [M5Stack](#jump32) <br>
&emsp; [Web](#jump33) <br>

**[Details of the communication protocols in use](#jump4)** <br>
&emsp; [Web and M5Stack](#jump41) <br>
&emsp; [Desktop to Web](#jump42) <br>

**[Details of the data persistence mechanisms in use](#jump5)** <br>
&emsp; [Desktop Application](#jump51) <br>
&emsp; [Web Application](#jump52) <br>
&emsp; [M5Stack](#jump53) <br>

**[Details of web technologies in use](#jump6)** <br>




<span id="jump"></span>
## a. Architecture of the entire system

The entire system has three components - the *company*, the *user*, and the *market*. <br>

The **company** usually indicates the health recipe development companies. They have team of nutrition experts, which will develop a variety of delicious and health recipes for people. The **user** can be any ordinary citizens who has a mobile phone and care of their health. The **market** will be like grocery stores, food halls, and the supermarkets. They sell fresh ingredients but don't know how much is appropriate. <br>

Our design target is to realize the information interaction among these three. In techniques, we are going to implement a platform **web application** for users; we also design a **desktop application** to achieve the data visualization and control tasks for companies; the **IoT device** will be used by markets to receive information. 

The **architecture** shows in the following flow chart.

<p align="center"><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/Information%20Flow.png" width=80% /></p>

The company aims to develop various delicious and healthy recipes for users who subscribe their service on the desktop application. The the recipes will be published to MQTT topic pokefood. The users can browse recipes on web application and order the raw materials from the market.They need to subscribe the topic pokefood and send their order details to the market. The market then will receive the order and cancel or accept and prepare this order. Whether they accept or cancel the order or the order is prepared, the status will send back to the the users by MQTT and shows in the webpage.

Our system connects them together which will extent effectively address the food waste issue and health issus that we're thinking about. <br>


<span id="jump1"></span>
## b. Object-Oriented design of key sub-systems

<span id="jump11"></span>
### Desktop Application

The desktop system is for the company that provide recipes, it uses two libraries: controlP5 and
MQTTClient, and it contains four files: data.pde, events.pde, management_dashboard.pde and view.pde.
The ControlP5 helps draw table, and MQTTClient helps to connect with other sub-systems.  <br>

The *management_dashboard.pde* is the main file that specifies the size, background color, font, and title of the interface, and sets the ControlP5 and MQTTClient object. The *data.pde* file reads the data from json files , and writes it back to json files after change of recipe status. The *events.pde* file detects the occurrence of an event (such as a mouse click on a button) and make changes accordingly. The *view.pde* file specifies the layout of the page, with recipe total count on the far left and status updating, published, and canceled for each recipe on the top right. Click on the id of each recipe and specific information about the recipe will appear. If the three buttons below are clicked, the status of the recipe can be changed.  <br>

<span id="jump12"></span>
### IoT Device

IoT application will be deployed on the m5 stack for service providers. The m5 stack is highly portable, allowing service providers to accept / reject orders anytime, anywhere, and simply communicate with customers.  <br>

IoT application will connect to the Internet through the WIFI module of the m5 stack and perform data interaction based on the MQTT protocol.  <br>

The IoT application will receive the order information from the MQTT server, and the service provider can feed back the order status (receive / reject) and inventory to the MQTT server. Since there are only three buttons on the input of m5stack, some sending options (such as In stock / Out of stock) will be preset for feedback.  <br>

<span id="jump13"></span>
### Web Application

In our entire system, Web Application is mainly user-oriented, which means that users can obtain the required recipe information from the web interface and send the order information to the correspomding market at the same time.  <br>

In order to realize the information flow from company to user and user to market, the web application needs to implement the following four basic functions:  <br>
1. Receive recipe information from Desktop Application.  <br>
2. Display recipe information with pictures and text.    <br>
3. Provide selectable ingredients and freely editable notes.  <br>
4. Send order information to the IoT device, the M5Stack.  <br>


<span id="jump2"></span>
## c. Requirements of key sub-systems

<span id="jump21"></span>
### Desktop Application

The Desktop Application developed for company to send messages(recipes) to the web site for customers to choose.    <br>

For users who are responsible for sending recipes in company, they need to view the overall number of recipes in different status, the details of recipes and be able to change the status of any chosen recipe. Thus, for each recipe, its json file contains the information of recipe’s id, ingredients, status, name, and this information will be parsed and read by processing, counting the total number in different status and showing the details of recipes on UI. Three buttons named “send”, “modify” and “cancel” are created for changing status to “published”, “updating” and “canceled”.    <br>

The *json* file also contains the information of markets where customers can order these ingredients. This data is created for customers to choose which places to buy their food, thus it will be sent to web but will not show on desktop.    <br>

<span id="jump22"></span>
### M5Stack

The M5Stack is developed for merchants to receive orders from customers (website).  <br>

Users can receive order information from customers through M5Stack, including the types of items, quantity and contact information. When M5stack receives the order information in json, it will parse the json string and display the results in a suitable layout. In order to avoid delays in processing orders, M5Stack will give users a voice prompt and highlight the order status to remind users to process orders.  <br>

In addition, the user needs to give the customer feedback on the order status, including order accepted, order canceled, and order prepared. The user can use the three buttons on M5Stack to feedback order status to customers.  <br>

<span id="jump23"></span>
### Web Application

The Web Application is a user-oriented system, developed for users to browse healthy recipes released by the company and make an appointment of required ingredients with the market easily. It should act as the primary interface from *company to user* *user to market* *market to user*.  <br>

In the ideal case, users are able to log in to the website through various network devices such as laptop and cell phone. The web application will be able to retain the username upon Login and in case of a new Sign-Up send the new profile information to the server.  <br>

From company to user, the website acts like a bridge to carry all the information of newly recipes from company to user. For example, company will publish a recipe news via MQTT protocol, containing all the recipe ingredients and available market for those ingredients.  <br>

From user to market, more complex exchanges of information will occur. User can send orders to the HIVEME channel named “pokefood”. One order must contain username, telephone number, name and quantity of the item and the market they want to book the item from. Through hierarchical management, only the designated market can see the order information.   <br>

From market to user, market need to check the stock of required items and then confirm on M5Stack. From the user's perspective, they can check their order status in real time. There will be four possible states: unconfirmed, accepted, canceled and prepared. Explanations of various states will be given in M5Stack part.  <br>


<span id="jump3"></span>
## d. The evolution of UI wireframes for key sub-systems

<span id="jump31"></span>
### Desktop UI wireframe

The left image is the original prototype of UI, the right one is the look when it is implemented on processing. The overall number of recipes in different status are showed by bar graph list. <br>

<p align="center"><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/desktop--UI1.png" width=600 /><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/desktop--UI2.png" width=600 /></p>

To show more details of recipe, we expand the length of recipe bar and add more details on ingredients. Logo is also added in final version. We use dropdown list to show details of recipe, so it can be hidden when the users do not need it.  <br>

<p align="center"><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/desktop--UI3.png" width=600 /></p>

<span id="jump32"></span>
### M5Stack UI wireframe

Figure 1 shows the prototype of m5stack. The layout of the interface is relatively simple, consisting of a title in PokeFood, a monochrome background, and three key tips.   <br>

<p align="center"><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/M5Stack-UI1.png" width=600 /></p>

In order to improve the aesthetics of the interface and the friendliness of the operation, the key tips have been improved into blue button-shaped blocks.  <br>
The interface of the final version of m5stack displays the logo of PokeFood, which makes the product have more distinctive brand characteristics.  <br>

<p align="center"><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/M5Stack-UI2.png" width=600 /></p>

Figure 3 shows the interface of m5stack when receiving an order, where the order status is displayed in red to prompt the user to process the order. When the user clicks to cancel or prepared, m5stack will return to the interface in Figure 2 after five seconds.  <br>

<p align="center"><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/M5Stack-UI3.png" width=600 /></p>

<span id="jump33"></span>
### Web UI wireframe

The Web Application is definitely a user-oriented system, so it should be designed from the user's point of view.  <br>
The following is a general flow chart when a user starts to use the web application:

<p align="center"><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/Step%20Flow%20for%20users.png" /></p>

According to this flow chart, the Web Application should contain at least four websites: Login - Recipes - Place Order - Order Status.  <br>
The first website is a user Login interface. Users who already have accounts can log in with username and password. And for users who use our website for the first time, please feel free to quick register with an email address.  <br>

<p align="center"><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/web--UI1.png"  /></p>
<p align="center"><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/web--UI2.png" width=300 /><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/web--UI3.png" width=300 /></p>

After logging in, users can browse various healthy recipes released by the company.  <br>
At the top right corner of the interface, there are two orange buttons. One is “CHECK ORDER”, once the user clicks on it, he/she will turn to the order status page. The other is “ORDER NOW”. If users find a favorite dish and want to try cooking themselves, they can go to place order of all the ingredients they need with one click.  <br>
There is a hyperlink at the bottom of the page to go to the BBC recipe website "BBC Good Food".

<p align="center"><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/web--UI4.png"  /></p>
<p align="center"><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/web--UI5.png"  /></p>

Below is the web page for users to place order. Users need to click the button, “Open MQTT websocket client” in the upper right corner to subscribe “pokefood” channel. After filling all the order details, user can click “Place Order”, and the order information will be sent to the market's M5Stack through the MQTT protocol. <br>

<p align="center"><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/web--UI6.png"  /></p>

Below is the web page for users to query order status. After clicking “Connect” and “Subscribe”, users can check the real-time status of orders. For example, after the market confirmed that items are in stock, the corresponding order status will turn to “Accepted”. <br>

<p align="center"><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/web--UI7.png"  /></p>
<p align="center"><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/web--UI8.png"  /></p>

Furthermore, there is a button to return to the recipe page in the lower right corner of these two pages. Users are able to continue browsing recipes by clicking this button.  <br>

It is worth mentioning that the website logos of two versions are completely independently designed according to the theme "Poke Food", which aims to convey healthy eating habits and promote convenient purchasing methods.

<p align="center"><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/logo1_pokefood.png" height=300  /><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/logo2_food.png" height=300 /></p>

<span id="jump4"></span>
## e. Details of the communication protocols in use 

<span id="jump41"></span>
### Web and M5Stack
The data transmission between all products is in *json* based on the MQTT. The format that M5Stack receives data from the web is as follows:  <br>
{  <br>
&emsp;    "order_quantity":"1",  <br>
&emsp;    "order_item":"Chicken",   <br>
&emsp;    "telephone":"7521942775",  <br>
&emsp;    "order_id":"000001"  <br>
}  <br>
M5Stack only feedback the order status, the format is as follows：  <br>
{   <br>
&emsp;"order_status":"accpeted",   <br>
&emsp;"order_id:"000001"   <br>
}

<span id="jump42"></span>
### Desktop to Web
All recipe statistic is only stored in desktop side, web side only receive messages from MQTT. When both sides are connected on MQTT and the status of a recipe is changed on desktop, processing will print the json object of the recipe on MQTT topic (pokefood), and this message will be received by web side with the same MQTT topic. Then customers can decide which published recipe to choose and where to buy the ingredients.  <br>
{  <br>
  "market": [  <br>
&emsp;    {  <br>
 &emsp;&emsp;     "market_id": "1",  <br>
 &emsp;    &emsp; "postcode": "BS1 5SP",  <br>
  &emsp; &emsp;   "market_name": "Tesco"  <br>
  &emsp;  },  <br>
{  <br>
  &emsp; &emsp;   "market_id": "2",  <br>
  &emsp; &emsp;"postcode": "BS8 1RE",  <br>
  &emsp;  &emsp;"market_name": "Sainsbury's"  <br>
   &emsp; }  <br>
  },  <br>
  &emsp;"recipe_id": "O4HS7Kev",  <br>
  &emsp;"recipe_ingredients": "turkey breast steaks (2.07/kg), baby potatoes (0.28/each), green salad (0.35/10g)",  <br>
 &emsp; "recipe_status": "updating",  <br>
&emsp;  "recipe_name": "Turkey piccata",  <br>
 &emsp; "currency": "GBP",  <br>
 &emsp; "available_market": "Tesco, Sainsbury's"  <br>
}  <br>


<span id="jump5"></span>
## f. Details of the data persistence mechanisms in use 

Considering the limitations of the equipment and the complexity of the technology, the data transmitted between all the devices of PokeFood is temporarily stored. 

All the data in sub-systems are stored in json file. Recipe data stored in json file helps the stability of data as it is not easy to be lost when a system crash or sudden interruption happens. Each recipe stored as a separate json object, thus even a damage destroys the data of one recipe does not affect the others.

For future commercial development, we propose the following solutions for permanent storage of data. We will build a database server based on MySQL. The data structure of three sub-system shows as follows. <br>

<span id="jump51"></span>
### Desktop Application

The database in web application contains two tables. One is Recipe and another is Market. A market can own zero or many recipes and these recipes can be ordered in the market. To clarify the relationship between markets and recipes, the same recipes with the same recipe name will have different recipe id in different market so one recipe can only be owned by one market at the same time.

<img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/Desktop%20System%20-%20Data%20Structure.png"  />

<span id="jump52"></span>
### Web Application

The database in web application contains four tables. The user table is for storing user data. When the users sign in on the website, their information will be stored in this table. When they place an new order, the order information will stored in the order table and a relationship between user and order will be set up by a foreign key username in the order table. Since one order may contains several recipes and a recipe may contain several items, recipe table and item table is essentianl to show this relationship clearly. 

<img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/Web%20System%20-%20Data%20Structure.png"  />

<span id="jump53"></span>
### M5Stack

The database connected to M5Stack contains two tables. The customer will store a customer's information when he first place an order in this market. For old users, their data will not be added to this table repeatedly but the new order information and foreign key customer telephone will be added to order table.

<img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/M5Stack_Data%20Structure.jpg"  />

When the customer initiates an order request on the web side, the order data will be uploaded to the database. M5Stack will stay connected to the database and monitor the database for new data inserted every second and add the newly inserted data to the memory of M5Stack. After the user processes the current order, the new order will be displayed. After introducing a database with a permanent storage mechanism, you can also access the historical order data by optimizing the M5Stack UI and operating logic.  <br>

<img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/The%20work%20flow%20of%20M5Stack.png"  />


<span id="jump6"></span>
## g. Details of web technologies in use 

+    **Processing**: to convert the input text into a json file and send it to website;
+	**Json**: to ensure that messages are transmitted more stably through the MQTT protocol, even a damage destroys the data of one message does not affect the others;
+	**SVG**: to design and draw the logos;
+	**Html**: to develop websites;
+	**JavaScript**: to control the interactive process of web pages and parse *json* files;
+	**CSS / VUE framework**: to modify the interface layout of web pages to make it more user-friendly and beautiful;
+	**Python**: to parse the *json* file delivered by MQTT protocol and design the User Interface.
