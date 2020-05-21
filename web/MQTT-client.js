// Create a client instance, we create a random id so the broker will allow multiple sessions

client = new Paho.MQTT.Client("broker.mqttdashboard.com", 8000, "clientId" + makeid(3));

// set callback handlers
client.onConnectionLost = onConnectionLost;
client.onMessageArrived = onMessageArrived;

// connect the client
client.connect({ onSuccess: onConnect });

function placeOrder() {
    var x = document.getElementById("frm1");
    var text = "";

    var newOrder = {

        order_id: "O" + makeid(7),
        order_status: x.elements[1].value,
        user: {
            name: x.elements[2].value,
            telephone: x.elements[3].value,
        },
        market: {
            market_id: x.elements[4].value,
            market_name: x.elements[5].value,
            market_postcode: x.elements[6].value
        },
        order_item: x.elements[7].value,
        order_quantity: x.elements[8].value
    };

    document.getElementById("order").innerHTML = JSON.stringify(newOrder);
    document.getElementById("status").innerHTML = newOrder.order_status;
    onSubmit(JSON.stringify(newOrder));
}

// called when the client connects
function onSubmit(payload) {
    // Once a connection has been made, make a subscription and send a message.
    console.log("onSubmit");
    client.subscribe("pokefood");
    message = new Paho.MQTT.Message(payload);
    message.destinationName = "pokefood";
    client.send(message);
}

function updateTable(payload) {
    var tr;
    tr = $('<tr/>');
    tr.append("<td>" + json[0].order_id + "</td>");
    tr.append("<td>" + json[1].status + "</td>");
    tr.append("<td>" + json[4].market_postcode + "</td>");
    $('table').append(tr);
}

// called when the client connects
function onConnect() {
    // Once a connection has been made report.
    console.log("Connected");
}

// called when the client loses its connection
function onConnectionLost(responseObject) {
    if (responseObject.errorCode !== 0) {
        console.log("onConnectionLost:" + responseObject.errorMessage);
    }
}

// called when a message arrives
function onMessageArrived(message) {
    console.log("onMessageArrived:" + message.payloadString);
}

// called to generate the IDs
function makeid(length) {
    var result = '';
    var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for (var i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}