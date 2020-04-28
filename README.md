#### Group 8: Han Wu, Tianbo Wang, Nuo Xu, Lan Zhong, Yijing Zhu

# System Design
## a. Architecture of the entire system
This project was started with the health of most people and food waste in mind. The entire system has three components - the *company*, the *user*, and the *market*. <br>

The **company** usually indicates the health recipe development companies. They have team of nutrition experts, which will develop a variety of delicious and health recipes for people. The **user** can be any ordinary citizens who has a mobile phone and care of their health. The **market** will be like grocery stores, food halls, and the supermarkets. They sell fresh ingredients but don't know how much is appropriate. <br>

Our design target is to realize the information interaction among these three. In techniques, we are going to implement a platform **web application** for users; we also design a **desktop application** to achieve the data visualization and control tasks for companies; the **IoT device** will be used by markets to receive information. The **specific process** will be .... **Data communication** ...... **Data repository** ....  <br>

Our system connects them together which will extent effectively address the food waste issue and health issus that we're thinking about. <br>
Welcome to the **story 1**: John has been running a grocery store. In the last five years, he threw away, on average, a batch of fruit every three days that has rotted because it es not sold in time. One day, he found our smart system and decided to have a try. He paid the promotion fee of 50 pounds per month to the recipe development company - HealthLife. When there is a large stock of a certain food, such as tomatoes, John will informed the HealthLife company and they are expected to publish more recipe about tomatoes to nearby residents. Then, residents who receive this seemingly healthy and delicious recipe for tomatoes will have the idea of shopping tomatoes recently. In this way, John's tomatoes are sold off before they turned bad.  <br>

Here is the **story 2**: Rachel is an office lady and there is a little time for her to pay attention to the healthy diet. One day, an AD from HealthLife company appeared on her phone, which states that "Subscribe today for free". She signs up an account with filling in her information like age, height and weight. And everyday after that, she can receive a push of some health recipes from the company so that she can but something needed in nearby markets, and becomes healthier and healthier. However, the outbreak of COVID-19 limited people's normal life, which means going to the market became a dangerous things in this period. Many people stock up on food which may lead food be un-fresh when they were used. Now, our smart system helped to solve the problem. Rachel found a service in our system - as long as you order food the night before, you can pick it up quickly in the specific market the next day, without meeting crowed of people. She paid 15 pounds per month for this service to the John's grocery, which is the market she loved most, and enjoyed the fresh food while still being safe.  <br>


## b. Object-Oriented design of key sub-systems

### Desktop Application
The desktop system is for the company that provide recipes, it uses two libraries: controlP5 and
MQTTClient, and it contains four files: data.pde, events.pde, management_dashboard.pde and view.pde.
The ControlP5 helps draw table, and MQTTClient helps to connect with other sub-systems.  <br>

The management_dashboard.pde is the main file that specifies the size, background color, font, and title of the interface, and sets the ControlP5 and MQTTClient object. The data.pde file reads the data from json files , and writes it back to json files after change of recipe status. The events.pde file detects the occurrence of an event (such as a mouse click on a button) and make changes accordingly. The view.pde file specifies the layout of the page, with recipe total count on the far left and status updating, published, and canceled for each recipe on the top right. Click on the id of each recipe and specific information about the recipe will appear. If the three buttons below are clicked, the status of the recipe can be changed.  <br>

### IoT Device
IoT application will be deployed on the m5 stack for service providers. The m5 stack is highly portable, allowing service providers to accept / reject orders anytime, anywhere, and simply communicate with customers.  <br>

IoT appliction will connect to the Internet through the WIFI module of the m5 stack and perform data interaction based on the MQTT protocol.  <br>

The IoT application will receive the order information from the MQTT server, and the service provider can feed back the order status (receive / reject) and inventory to the MQTT server. Since there are only three buttons on the input of m5stack, some sending options (such as In stock / Out of stock) will be preset for feedback.  <br>


### Web Application
In our entire system, Web Application is mainly user-oriented, which means that users can obtain the required recipe information from the web interface and send the order information to the correspomding market at the same time.  <br>

In order to realize the information flow from company to user and user to market, the web application needs to implement the following four basic functions:  <br>
1. Receive recipe information from Desktop Application.  <br>
2. Display recipe information with pictures and text.    <br>
3. Provide selectable ingredients and freely editable notes.  <br>
4. Send order information to the IoT device, the M5Stack.  <br>


## c. Requirements of key sub-systems (in the form of selected user stories)


## d. The evolution of UI wireframes for key sub-systems


## e. Details of the communication protocols in use (including a rational for your choice)


## f. Details of the data persistence mechanisms in use (including a rational for your choice)


## g. Details of web technologies in use (including a rational for your choice)


# System Implementation
## a. Breakdown of project into sprints (showing the users stories implemented in each).


## b. Details of how you evaluated your designs (techniques used & awareness of their limitations)


## c. Discussion of Social and Ethical implications of the work
In building this project, we fully considered in improve the phenomenon of *environmental pollution* and *resource waste*.  <br>
The unreasonable quantity of food in the market leads to a lot of food waste, and this is particularly serious in developed countries. Millions of gallons of milk were dumped while they passed the expired date; the rotten fruit piled up into a mountain; which are not only making the environment worse and worse, but also causing the resource waste. To put it further, if we can't control this situation but indulge their development, social problems such as environmental pollution, resource inequality and wealth gap will become more and more serious. Therefore, we want to do something good for our planet so we got the idea of this project.  <br>

Potentially ethical implication might be privacy and data security. Those who use our application need to provide personal information such as name, phone number in order to inform them of updated information and confirm their identities when collecting order. What is more, the information of searching and browsing the recipes will also be recorded automatically for providing better and targeted service. These information will be sent to both company and market. If they sell information to others or collude with each other to stimulate users’ consumption intention maliciously, it is quite unsafe for the users.  <br>

Another implication might be healthy influence for those who have some specific diseases. Most of our healthy recipes are designed for healthy people without chronic diseases. If someone with chronic diseases or specific body corporeity believes these recipes are good to their health and have these diets in their daily life, his condition may be worse. For example, one of our users has diabetes and he should follow recipe with less carbohydrates. However, our recipes for healthy people may contain many carbohydrates such as pasta and potatoes and also use some sugar for flavor. This kind of recipes may do harm to the user when consumed over a long period. Thus it is important for our users to take their physical condition into consideration when choosing these recipes.  <br>


# Project Evaluation
## a. Reflective discussion of the success of the project


## b. Discussion of future work (in terms of design, development and evaluation)
For this project, there are still many space left which can be developed. Firstly, we can't ensure that hoarding information in every market can be accurately sent to their consumers, even if there is a company acting as an intermediary. So, we can focus on the improvement of positioning accuracy in the future work. In addition to, .......

## c. Reflect on the working practices of your group, how well they did or did not work, e.g, management of issues, communication, Agile (etc).



## d. This is a chance to reflect on how coronavirus has affected your project (remote working practices etc)
Due to the outbreak of coronavirus, our plan was completely upset. Originally, we were going to divide 3 small groups to write the code together. After the system has been accomplished, we would take the next step together. However, for now, 3 people of our group still in the United Kingdom and 2 people back to their home country, so coding together became hardly to proceed. We had to change the division of labour, which makes our group work more efficiently.  <br>
Also, we had to overcome time difference problem because we were in different countries. We used online video chat to substitute face to face talk, which actually delay the progress a little bit.  <br>
This is the challenge for everyone, but this is also a good chance to improve the team cohesion. Even though we still got a lot of room for improvement in this project, everyone's efforts cannot be ignored.
