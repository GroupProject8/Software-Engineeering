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

**[Reflection of Working Practices and Impact of Coronavirus](#jump2)** <br>

<span id="jump"></span>
## Reflection of Success
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
+ Success to parse and read recipe data from *json* files, change the recipe status on UI and save the change in *json* file. However, as mentioned before, other changes and additions to the data require direct modification in *json* files.
+	Success to send messages to web at MQTT.
+	Success to build a simple UI for users to view all recipes and make simple changes.

<span id="jump03"></span>
### Success of Web  
+ The user interface of the website is very easy to operate and user-friendly. It's easy and quick for users to log in and buy ingredients.  
+ The content of our websites is of high quality, providing the latest healthy recipe information.
+ The website logo is carefully designed according to the theme, and is designed in two sizes to accommodate various web page layouts.  

<span id="jump1"></span>
## Future Work of System
For this project, there are still many space left which can be developed. Firstly, we can't ensure that every ingredients in the recipe are liked by customers. So, we can focus on the improvement of data analysis in the future work and give better recommendations. In addition to, the system can add functions like "Health Check" by creating a forum so that our customers can communicates with others who also care about healthy diets. Moreover, this system may develop the "Delivery" function, which allows market to delivery the order to customer. By doing this way, convenience will be improved so that the commercial value of the PokeFood will also increase. The specific plan for future work is mentioned here:  <br>

<span id="jump11"></span>
### Future work of M5Stack  
+ Although m5stack implements basic functions, including data sending and receiving, m5stack's UI interface is too simple and cannot meet the aesthetic needs of users. Therefore, in subsequent work, we should continue to optimize the UI layout to present data to users in a more beautiful and convenient way. M5Stack does not support querying historical orders. If users want to query the orders that have been processed, M5Stack cannot meet the demand.
+ M5Stack also has the problems of inefficient order processing and unfriendly to customers from the web. Therefore, it is also necessary to optimize the logic of processing the order queue, for example, construct a new data structure to store the order data, and refresh the next order information directly after the user processes the order, thereby avoiding the problem that the customer may needs to repeatedly submit the order. <br>

<span id="jump12"></span>
### Future work of Desktop  
+	Increase number of recipes and add different recipe categories.
+ Refine user interface to make it more good-looking.
+ Add ways to modify recipe details or add new recipe directly on UI.
+	Make each ingredient as a *json* object and each of them contains different available market information. A recipe *json* object can be linked with these objects, which shows the recipe needs these ingredients. Then customers on web side can choose to buy food in different markets.

<span id="jump13"></span>
### Future work of Web
+ A health report could be automatically generated every month based on the recipes cooked by the user. For example, Peter didn’t order any kind of fish in May, so the report would suggest that he is supposed to increase the intake of fish protein.
+ The web application can selectively recommend some recipes based on the user's dietary preferences.
+ The website can add a discussion section to allow users to communicate and interact.

<span id="jump2"></span>
## Reflection of Working Practices and Impact of Coronavirus

At first, we held some face-to-face meetings to discuss the initial idea of our project and system architecture. We believed that it is the most efficient and effective way in exploring new ideas among discussion. As supplement, we also build a chat group on Wechat, which is a social app, and we efficiently use it to share some pictures and videos of prototype. In our original plan, the group is divided to three small groups and every group works focus on different device so that it is more flexible for each group to schedule their tasks. Also, we planed to integrate them together when we all finished code.  <br>

However, because of the outbreak of coronavirus, two of our group members come back to their home country and we found it difficult to communicate with each other effectively and efficiently. In order to overcome the difficult of distance and time difference, we decided to re-divide our group into two sub groups. One is composed of three members who still lived in Bristol and they were responsible for each parts of coding. By doing this way, they can contact each other as soon as possible once they have any problem of coding and integration. The specific arrangement is -- Yijing for desktop application, Han for web application and Tianbo for M5 Stack. Meanwhile, another group started to focus on writing report.  <br>

Then we use our Wechat group as the communication tool and use Github to share our progress. Because of impossibility of face-to-face meeting, it is essential to find another method to hold a group meeting. We choose to use video group chat on Wechat because it is very convenient to allow all group members have a meeting and also send messages, pictures and files at the same time. Thus we can make some word record and share some materials to make further explanations when chatting. It helps us a lot in the period of working remotely. Another advantage of our Wechat group is that we can send messages easily once we have some problems to ask, ideas to share and update on Github. Sometimes other member cannot reply as soon as possible due to time difference but the app will record these messages and they can reply after they read them. Github is another helpful tool for us. Especially in writing report, it is convenient for us to focus on the structure so that we will know which parts is imperfect. Besides, we can share all codes and materials through it, so that everyone will follow the update all the time. <br>


