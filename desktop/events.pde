// User interaction logic calling data (model) and views

String expanded_recipe; //ID of recipe in focus
String MQTT_topic = "Recipes_desktop";
int button_state = 0;

void clientConnected() {
    println("client connected to broker");
    client.subscribe(MQTT_topic);
}

void connectionLost() {
    println("connection lost");
}

void messageReceived(String topic, byte[] payload) {
    JSONObject json = parseJSONObject(new String(payload));
    if (json == null) {
        println("Recipe could not be parsed");
    } else {
        api.saveRecipetoDB(json);
        refreshData();
    }
    refreshDashboardData();
}

void controlEvent(ControlEvent theEvent) {
    // expand order if clicked via API call
    if (theEvent.getController().getValueLabel().getText().contains("O") == true) {
        // call the api and get the JSON packet
        expanded_recipe = api.getRecipesByStatus(theEvent.getController().getName())[(int) theEvent.getController().getValue()].getString("recipe_id");
        view.build_expanded_recipe(expanded_recipe);
    }
}

public void send(int theValue) {
    if (button_state > 2) {
        api.updateRecipeStatus(expanded_recipe, Status.PUBLISHED);
    }
    button_state = button_state + 1;
}

public void cancel(int theValue) {
    if (button_state > 2) {
        api.updateRecipeStatus(expanded_recipe, Status.CANCELED);
    }
    button_state = button_state + 1;
}

public void modify(int theValue) {
    if (button_state > 2) {
        api.updateRecipeStatus(expanded_recipe, Status.UPDATING);
    }
    button_state = button_state + 1;
}
