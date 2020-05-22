【图片】
# PokeFood
- - -
Team Members:  <br>
Han Wu; Tianbo Wang; Nuo Xu; Lan Zhong; Yijing Zhu

# Introduction
- - -
## Motivation
Since pace of people's life is getting faster and faster, health problems are often overlooked. According to the survey on the Internet, there are more than 75% people do not have a health eating habits. Especially people who live in a metropolis, they often eat fast food to save time. When nutrition experts investigated the fact behind it, they found that one of reasons is because learning the nutrition knowledge for most people is impractical. Therefore, designing an application to improve people's quality of life and health will be beneficial for our society. With this in mind, our group planed to design a system relevant to healthy menu, with convenience and scientific. There are two key points to consider in order for this program to really work - one is the convenience and another is the scientific. Currently, most applications in this field is one-way transmission of information, such as advertisement push. However, if information and data transmission can be applied to multi directions, the efficiency will be improved.

## Implement
The entire project has three components - the *company*, the *user*, and the *market*, and uses three methods to function them - *Iot device*, *Web application* and *Desktop application*.  <br>

In details, the **company** usually indicates the health recipe development companies. They have team of nutrition experts, which will develop a variety of delicious and health recipes for people. The **user** can be any ordinary citizens who has a mobile phone and care of their health. They don't know what to buy and how much they needed for a meal. The **market** will be like grocery stores, food halls, and the supermarkets. When they work together, data transmission has two ways, one is from company to customer, and another is both directions between customer and market. More specifically, we used Iot device - M5Stack to complete the part of market; desktop application to complete part of company; web application to complete part of customers.

### Iot device
Since customers need to place an order on ingredients，M5Stack will receive data from Web application and give feedback to Web.It will tell customers about the status of food in the order.
### Web application
Web application has been designed for customer focus. It contains login interface and customers can browse for different kinds of recipe information, which received from desktop.
### Desktop application
A desktop application are designed for companies which developed and sent healthy matches of food for customers. Besides, it also provides information about where can buy the ingredients included in the recipe.  


# Report
- - -
The report analysis the development of PokeFood system and consisted of three sections:  <br>
[System Design](Portfolio/DESIGN.md). <br>
[System Evaluation](Portfolio/EVALUATION.md). <br>
[System Implement](https://github.com/GroupProject8/Software-Engineering/blob/master/Portfolio/IMPLEMENT.md). <br>
