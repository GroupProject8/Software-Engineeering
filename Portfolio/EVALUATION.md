Project Evaluation
=====

## Table of Contents
**[Discussion of Project Success](#jump)** <br>
&emsp; [M5Stack](#jump01) <br>
&emsp; [Desktop ](#jump02) <br>
&emsp; [Web](#jump03) <br>

**[Discussion of Future Work](#jump1)** <br>
&emsp; [M5Stack](#jump11) <br>
&emsp; [Desktop ](#jump12) <br>
&emsp; [Web](#jump13) <br>

**[Reflection on Working Practices](#jump2)** <br>

**[Impact of Coronavirus](#jump3)**  <br>


<span id="jump"></span>
## a. Reflective discussion of the success of the project
Overall, the principle of this project is splendid.  
For the company, this is a good way to promote healthy diet for all and it can also attract a large number of users with high-quality content. As a result, fees through advertising and subscription benefits it most. Meanwhile, the company can seek for sponsorship in the market, because this can help the market to sell excess items to a certain extent.  <br>

For the user, the software engineering system we developed can improve user’s procurement efficiency and balance nutrition intake scientifically. Especially during the special period of COVID-19, in order to slow down the spread of the virus and prevent infection of themselves and their families, people have actively responded to the government's call to reduce the number of going out in public. As a result, the inability to supplement fresh ingredients frequently and eating relatively simple for a long time will harm to people's health. Therefore, this system can help users reduce the impact.  <br>

For the market, the overstocking of food can also be alleviated to a certain extent by promoting this system. Based on our observation, we have seen that many foods in supermarkets were overstocked. However, if users have ordered the ingredients in advance, supermarkets are able to estimate the demand for goods and adjust the inventory correspondingly.  <br>

<span id="jump01"></span>
### Success of M5Stack  
M5Stack is portable and has a built-in WIFI module, so that users can view and receive orders anywhere through m5stack. The user can hold m5stack to view the required goods while preparing the order, so that the user does not need to remember the complicated order content.  <br>
+ The three buttons of m5stack are preset with corresponding order status feedback functions, and users can send the order status to customers with one click.   <br>
+ In terms of interaction design, M5Stack uses sounds and text to remind users to avoid delays in orders. In addition, M5Stack also has a simple and beautiful operation interface.  <br>
+ For the customer who initiated the order, because the merchant uses m5stack, the order processing efficiency has been improved, and the order status can be obtained conveniently, which indirectly improves the customer's shopping experience.  <br>

<span id="jump02"></span>
### Success of Desktop  
+ Success to parse and read recipe data from json files, change the recipe status on UI and save the change in *json* file. However, as mentioned before, other changes and additions to the data require direct modification in *json* files.
+	Success to send messages to web at MQTT.
+	Success to build a simple UI for users to view all recipes and make simple changes.

<span id="jump03"></span>
### Success of Web  
+ The user interface of the website is very easy to operate and user-friendly. It's easy and quick for users to log in and buy ingredients.  
+ The content of our websites is of high quality, providing the latest healthy recipe information.
+ The website logo is carefully designed according to the theme, and is designed in two sizes to accommodate various web page layouts.  

<span id="jump1"></span>
## b. Discussion of future work (in terms of design, development and evaluation)
For this project, there are still many space left which can be developed. Firstly, we can't ensure that hoarding information in every market can be accurately sent to their consumers, even if there is a company acting as an intermediary. So, we can focus on the improvement of positioning accuracy in the future work. In addition to, .......

<span id="jump11"></span>
### Future work of M5Stack  
Although m5stack implements basic functions, including data sending and receiving, m5stack's UI interface is too simple and cannot meet the aesthetic needs of users. Therefore, in subsequent work, we should continue to optimize the UI layout to present data to users in a more beautiful and convenient way. M5Stack does not support querying historical orders. If users want to query the orders that have been processed, M5Stack cannot meet the demand. M5Stack also has the problems of inefficient order processing and unfriendly to customers from the web. Therefore, it is also necessary to optimize the logic of processing the order queue, for example, construct a new data structure to store the order data, and refresh the next order information directly after the user processes the order, thereby avoiding the problem that the customer may needs to repeatedly submit the order.

<span id="jump12"></span>
### Future work of Desktop  
+	Increase number of recipes and add different recipe categories.
+ Refine user interface to make it more good-looking.
+ Add ways to modify recipe details or add new recipe directly on UI.
+	Make each ingredient as a *json* object and each of them contains different available market information. A recipe *json* object can be linked with these objects, which shows the recipe needs these ingredients. Then customers on web side can choose to buy food in different markets.

<span id="jump13"></span>
### Future work of Web
The Web Application can further develop a lot of functions that help people keep fit:
+ A health report could be automatically generated every month based on the recipes cooked by the user. For example, Peter didn’t order any kind of fish in May, so the report would suggest that he is supposed to increase the intake of fish protein.
+ The web application can selectively recommend some recipes based on the user's dietary preferences.
+ The website can add a discussion section to allow users to communicate and interact.

<span id="jump2"></span>
## c. Reflect on the working practices of your group, how well they did or did not work, e.g, management of issues, communication, Agile (etc).

At first, we held some face-to-face meetings to discuss the idea of our project and system architecture and it is the most efficient and effective way for us to share our ideas and work together. We also build a chat group on Wechat which is a social app and widely used by our group members to share some pictures and videos of prototype. In our initial plan, the group is divided to three small groups and every group works on one device so that it is more flexible for every small group to schedule their task. Then we can share the three devices and integrate them together.  <br>

However, because of the outbreak of coronavirus, two of our group members come back to their home country and we found it difficult to communicate with each other effectively and efficiently. In order to overcome the difficult of distance and time difference, we decide to redivide our group to two small groups and make full use of our chat group and Github.  <br>

Firstly, we redivide our group to two small groups. One is composed of three members in Bristol and they are responsible of the part of coding. Therefore, they can contact each other as soon as possible if they have any problem of coding and integration. There are three devices in our system so that everyone in this group is responsible for one -- Yijing for desktop application, Han for web application and Tianbo for M5 Stack. Another small groups which is consists of two members in other country, Nuo and Lan, take charge of the report.   <br>

Then we use our Wechat group as a communication tool and Github to share our progress and files. Because of impossibility of face-to-face meeting, it is essential to find another method to hold a group meeting. We choose using video group chat on Wechat because it is very convenient to allow all group members have a meeting and also send messages, pictures and files at the same time. Thus we can make some word record and share some materials to make further explanations when chatting. It helps us a lot in the period of working remotely. Another advantage of our Wechat group is that we can send messages easily once we have some problems to ask, ideas to share and update on Github. Sometimes other member cannot reply as soon as possible due to time difference but the app will record these messages and they can reply after they read them. Github is another helpful tool for us. We can share all the codes and materials through it. When someone finish his work, he can update to Github so that everyone can read.  <br>

Although working remotely is great challenge to us and our work efficiency was influenced to some extents, the group members try their best to work on the project and find alternative methods to enhance collaboration during this period.  <br>

<span id="jump3"></span>
## d. This is a chance to reflect on how coronavirus has affected your project (remote working practices etc)
Due to the outbreak of coronavirus, our plan was completely upset. Originally, we were going to divide 3 small groups to write the code together. After the system has been accomplished, we would take the next step together. However, for now, 3 people of our group still in the United Kingdom and 2 people back to their home country, so coding together became hardly to proceed. We had to change the division of labour, which makes our group work more efficiently.  <br>
Also, we had to overcome time difference problem because we were in different countries. We used online video chat to substitute face to face talk, which actually delay the progress a little bit.  <br>
This is the challenge for everyone, but this is also a good chance to improve the team cohesion. Even though we still got a lot of room for improvement in this project, everyone's efforts cannot be ignored.
