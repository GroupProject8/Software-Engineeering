<p align="right"><img src="https://github.com/GroupProject8/Software-Engineering/blob/master/charts/logo1_pokefood.png" width=30% /></p>

System Implementation
=====

## Table of Contents
**[Design Process](#jump)** <br>
&emsp; [Sprint 1](#jump01) <br>
&emsp; [Sprint 2](#jump02) <br>
&emsp; [Sprint 3](#jump03) <br>
&emsp; &emsp;[Web](#jump031) <br>
&emsp; &emsp;[Desktop](#jump032) <br>
&emsp; &emsp;[M5Stack](#jump033) <br>
&emsp; [Sprint 4](#jump04) <br>
&emsp; [Sprint 5](#jump05) <br>

**[Evaluation of Design](#jump1)**  <br>
&emsp; [Desktop Application](#jump11) <br>
&emsp; [M5Stack Application](#jump12) <br>
&emsp; [Web Application](#jump13) <br>

**[Social and Ethical Implications](#jump2)**  <br>




<span id="jump"></span>
## Development of Project

<span id="jump01"></span>

### Sprint 1: Ideation
This sprint aims to determine the idea of our product and architecture of our system. We have various ideas about what we can do in this project at first but soon we all agree with the idea of a service related to food. This is because it is a real problem that there are a lot of waste of food in the world. Also, we considered the health problem and planed to do something good for imporving people's idea about eating healthy. <br>

Considering this situation, our initial idea of this food service is a food reminder which enables our users to upload the food information, such as name, quantity and best before date to the application. Then the application can sort the food with the date and show users which one they should consume as soon as possible. They can also use it when they are in market to see which food they have already had. Therefore, they can manage their food and reduce the waste better.   <br>

However, one key point about this project is that we need three kinds of stakeholders and applications. In order to enhance the communication among the three kinds of stakeholders, we have to change our idea and rethink about the whole system architecture. In the new idea, company and market are involved. The company give their nutrient recipes to the users so that the users can choose these recipes and place orders in markets. All the process is very simple to the users. They can save their time and manage their health better.  <br>

Then we think about the whole architecture of this system. We choose web application, desktop application and M5 Stack as three components. We choose to provide web application to users , desktop application to company and M5 Stack to markets. Through web application, the users can easily get access to the service by any devices network.  <br>

<span id="jump02"></span>
### Sprint 2: Prototype
The aim of this sprint is to build a prototype of our product. As we confirmed our product idea and system architecture, we have designed a paper prototype and then tried to draw some pictures, and take a video to build our prototype as well, which have been showed in the Prototype folder. <br>

In this stage, we firstly thought about key requirements of three sub-systems. To illustrate it more, the M5 Stack is designed for the market, so it would need to receive the customers’ message and reply the order status. The web application would need to receive recipes from company and send the orders the market. The desktop application should store the data of recipe and send them to customers. Furthermore, the UI design is very important for the prototype. The UI frameworks are considered in order to show all functions clearly for three kinds of users. Logos design also accomplished in this period.  <br>

<span id="jump03"></span>
### Sprint 3: Coding
After building a prototype, the task of sprint 3 is to code on three sub-systems and complete their functions preliminarily. Due to the outbreak of coronavirus, this part was delayed and faced with the challenge of remote work. However, we still tries our best to implement the coding part for three sub-systems, and the performance is discussed as follows.  <br>

<span id="jump031"></span>
#### Web application
Web application, assumed that would used by customers, can receive the recipes from desktop application and send order information to the market the users selected.  <br>

Let's see the user’s story:
Rachel is an office lady and there is a little time for her to pay attention to the healthy diet. One day, she downloads our application PokeFood, and an AD from HealthLife company appeared on her phone, which states that "Subscribe today for free". She signs up an account with filling in her information like age, height and weight. And everyday after that, she can receive a push of some health recipes from the company so that she can but something needed in nearby markets, and becomes healthier and healthier. <br>

Meanwhile, she likes to open the webpage of 'order now' and  place an order to the market nearby. By clicking 'check order', she will the status of her order on the webpage. It not only save the time, but also help her to develop the healthy eating habits.  <br>

<span id="jump032"></span>
#### Desktop application
Desktop application has completed the function of storing recipes and send recipes to MQTT topic Pokefood. The recipes in the desktop can be in three status and the company can change their status. <br>

Let's see the user’s story:
Peter is a staff of Healthlife company and works for technology support here. One day he receives a new recipe from the expert so he uploads it to the desktop and press ‘Send’ button and the recipe is shown in the published column. However, the next day the experts tell him that the recipe should be modified a little bit, so he presses ‘Modify’ button and the recipe is shown in the update column. Few months passed, the expert informed him that some ingredients in the recipe are not in season , so he presses ‘Cancel’ button and the recipe is shown in the cancelled column.

<span id="jump033"></span>
#### M5Stack
M5Stack implemented the function of receiving orders and replying order status. The order has three status: accept, cancel and prepared. <br>

Let's see the final user story:  <br>

John is an owner of grocery store and one day he has received an order from a customer. In specific, the customer asked for a coconut, some rice and a chicken. However, the coconut is out of stock in his store so he has to press the ‘Cancel’ button to tell customer the sad news. Meanwhile, rice and chick are still available so he also presses the ‘Accept’ button to tell customer the order is partially accepted. After he has prepared all things well, he pressed the ‘Prepared’ button and waiting for the customer to pick up.

<span id="jump04"></span>
### Sprint 4: Integration
After coding on web application, desktop application and M5 Stack, it is essential for us to integrate them and make some modifications in this sprint. Since there are two data transmission paths in our system, our work of integration was divided into two parts. One is transmission of recipes from desktop application to web application. Another is transmission of order and order status between web application and M5 Stack. The transmission from desktop to web allows company to send their recipes and the information of cooperative market to the users by MQTT. The two-way trans-mission between web and M5Stack also uses MQTT. The customers can send order information to market and market gives current status to customers.   <br>

We also made some modifications in this stage. The evolution of UI framework has been considered and the logos were added to each sub-system in order to show their relationship in this project. Furthermore, the interfaces of three sub-systems are also beautified. The web application was added a login webpage which allows customers to sign up their accounts.  <br>

Overall, the three sub-systems are integrated to whole system through methods as mentioned above.   <br>

Considering the situation of coronavirus, we believed the system could really help a lot in this difficult time.   <br>

Here is developed user's story: Mary is a housewife and she usually prepare the meals for her family. However, her city lockdown and citizens are told that they should stay at home unless they go to the market to buy necessities. Mary is nervous and she wants to avoid staying in the super-market for a long time. The online supermarket need to wait a long queue for delivery service. One day Mary find Pokefood and she sign up on the website. She find there are many recipes can be selected and ordered online. She try to order “Chicken & avocado sandwich topper” in Tesco. Soon the supermarket send ‘accept’ message to her. About one hour after, supermarket send ‘prepared’ message to her and she go to collect her order. <br>

Look, by using our system, you can reduce the risk of contact with others under this situation. <br>

<span id="jump05"></span>
### Sprint 5: Report

The last sprint is to complete our report by adding some diagrams and pictures. As the preparation of writing a report, our group held a meeting for confirming the details in every part. After discussion, we decided to divide our report into four Markdown files - an overall descriptions and three explanations files for design, implement and evaluation. The draft has been finished in the end of April, we uploaded it to the Github so that we can modify it directly on the Github in later. <br>

The report was finally completed in mid-May.

<span id="jump1"></span>
## Evaluation of the design in three aspects

<span id="jump11"></span>
### Evaluation of Desktop
+ Not success to make each ingredient has different supermarkets for customers to choose.
+	There is no way that company users can add or remove recipes or change recipe details directly from the user interface. Except status, changes and additions to the data require direct modification in *json* files.
+ The message transmitted at MQTT is cluttered in *json* format.

<span id="jump12"></span>
### Evaluation of M5stack
+ M5Stack completes the basic functions required by PokeFood, such as parsing *json* strings, displaying order data, and feeding back order status.
+ M5Stack also has the function of prompting users to process orders, with good interactivity. In terms of logical design, the M5Stack interface will not be refreshed until the user finishes processing the current order. If there are currently unprocessed orders, M5Stack will give customers feedback that the order has not been accepted, thus ensuring that the current order data will not be overwritten. However, this design makes the efficiency of processing orders low, and is not friendly to customers from the web side, because they may need to repeatedly submit orders.
+ Since there is no persistent storage mechanism, the information in M5Stack is temporarily stored. If the user restarts M5Stack by mistake or forgets to charge, the current order information will be lost, causing inconvenience to merchants and customers.

<span id="jump13"></span>
### Evaluation of web
+	Due to the limited technology currently available, the information of Desktop and M5Stack are not able to display in a fixed format on the web page, which can be read more easily.
+	Due to limited of time and capacity, the database for supporting web page to store and retrieve information has not yet been built. If the necessary information such as user telephone number can be stored in the database, it will be more convenient for users to place orders.
+	The method for users to place orders can become more intelligent. For example, when users browse for their favorite dish, they can directly select the quantity of ingredients they want to order on the current page. In addition, if the user's telephone number and other necessary information in the database can also be automatically filled, the user can quickly place an order without the need to fill in additional information.


<span id="jump2"></span>
## Social and Ethical implications of the work
In building this project, we fully considered in improve the phenomenon of *security problem* and *potential healthy problem*.  <br>

Potentially ethical implication might be privacy and data security. Those who use our application need to provide personal information such as name, phone number in order to inform them of updated information and confirm their identities when collecting order. What is more, the information of searching and browsing the recipes will also be recorded automatically for providing better and targeted service. These information will be sent to both company and market. If they sell information to others or collude with each other to stimulate users’ consumption intention maliciously, it is quite unsafe for the users.  <br>

Another implication might be healthy influence for those who have some specific diseases. Most of our healthy recipes are designed for healthy people without chronic diseases. If someone with chronic diseases or specific body corporeity believes these recipes are good to their health and have these diets in their daily life, his condition may be worse. For example, one of our users has diabetes and he should follow recipe with less carbohydrates. However, our recipes for healthy people may contain many carbohydrates such as pasta and potatoes and also use some sugar for flavor. This kind of recipes may do harm to the user when consumed over a long period. Thus it is important for our users to take their physical condition into consideration when choosing these recipes.  <br>

Finally, there is also an implication on the intellectual property. All the recipes will be designed by professional nutritionist and the company will pay for it. However, our service is free for everyone to subscribe. If someone, especially our competitors, copy our recipes and publish them on other platforms, there will be a great loss to the company because they may lose potential customers who are attracted by other similar service.  <br>

In order to reduce these kinds of implications and protect our customers, some effective measures should be taken. Firstly, we should choose the reliable food supplier and market. It is very essential to evaluate the quality of the supply companies. The well-known markets such as Tesco, Sainsbury’s and M&S will be our primary choices. We will also sign a contract with them which includes their duty to keep customers’ information confidential.The next step is that we should inform our customers of the obligation and right of both users and company and sign a contract with them when they sign up on the website. The company have duty to protect the privacy of our customers and the customers should not share our recipe on the other platform without permission. The third measure is for the customers with diseases or in special physical conditions. We are planning to add instruction of allergen and people who are not suitable to every recipe in the future.  <br>
