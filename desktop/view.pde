ListBox l;
Chart overview;
DropdownList published_recipes, unpublished_recipes, updating_recipes;
int is_expanded = 0;

void refreshDashboardData() {
    // We just rebuild the view rather than updating existing
    for (String status: Status.LIST) {
        cp5.remove(status + " total ");
        cp5.remove(status);
    }
    view.resetSpacing();
    updateDashboardData();
}

void updateDashboardData() {
    refreshData();
    surface.setTitle("Stack Delivery Management Dashboard");
    for (String status: Status.LIST) {
        view.build_metric(status + " total ", (float) api.getRecipesByStatus(status).length);
        view.build_list(status, api.getRecipesByStatus(status));
    }
}

public class Dashboard_view {

    int is_expanded = 0;
    int vert_margin_spacing = 150;
    int horiz_margin_spacing = 70;
    int metric_x_size = 130;
    int metric_spacing = 0;
    int metric_y_size = 30;
    int list_spacing = 0;
    int list_x_size = 100;
    int list_y_size = 200;

    void build_metric(String name, Float value) {
        cp5.addNumberbox(name)
            .setValue(value)
            .setPosition(horiz_margin_spacing, vert_margin_spacing + metric_spacing)
            .setSize(metric_x_size, metric_y_size)
            .setFont(createFont("arial",14));
        metric_spacing = metric_spacing + (2 * metric_y_size);
    }
    
    void build_list(String list_name, JSONObject[] recipes) {

        ScrollableList list = cp5.addScrollableList(list_name)
            .setPosition((4 * horiz_margin_spacing+90) + list_spacing, vert_margin_spacing)
            .setSize(list_x_size, list_y_size);
        list.setBackgroundColor(color(0));
        list.setItemHeight(30);
        list.setBarHeight(30);
        list.setFont(createFont("arial",14));
        list.setColorBackground(color(255, 100, 0));
        list.setColorForeground(color(255, 239, 90));
        list.setColorActive(color(255, 239, 90));
        list_spacing = list_spacing + list_x_size + 60;
        list.clear();
        list.open();
        for (JSONObject recipe: recipes) {
            int i = 0;
            if (recipe != null) {
                list.addItem(recipe.getString("recipe_id"), i);
                i = i + 1;
            }
        }
    }
    
    void build_expanded_recipe(String recipeid) {

        if (is_expanded == 1) {
            cp5.get("Expanded recipe").remove();
            cp5.get("send").remove();
            cp5.get("modify").remove();
            cp5.get("cancel").remove();
            is_expanded = 0;
            button_state = 0; // this ensures that the creation of buttons aren't reported for call backs
        }

        ListBox recipe = cp5.addListBox("Expanded recipe")
            .setPosition((2 * horiz_margin_spacing-70), 3 * vert_margin_spacing-90)
            .setSize(760, 150)
            .setItemHeight(30)
            .setBarHeight(30)
            .setColorBackground(color(188, 188, 184))
            .setColorActive(color(0))
            .setColorForeground(color(255, 239, 90))
            .setFont(createFont("arial",14));

       
        recipe.addItem(api.getRecipeByID(recipeid).getString("recipe_name"), 0);
        recipe.addItem(api.getRecipeByID(recipeid).getString("currency"), 1);
        recipe.addItem(api.getRecipeByID(recipeid).getString("recipe_ingredients"), 2);
        recipe.addItem(api.getRecipeByID(recipeid).getString("available_market"), 3);
        recipe.addItem(api.getRecipeByID(recipeid).getString("recipe_status"), 4);


        // create the buttons
        cp5.addButton("send")
            .setValue(0)
            .setPosition((3 * horiz_margin_spacing-50), 3 * vert_margin_spacing+80 )
            .setSize(100, 40)
            .setFont(createFont("arial",14));

        cp5.addButton("modify")
            .setValue(0)
            .setPosition((3 * horiz_margin_spacing + 175), 3 * vert_margin_spacing+80 )
            .setSize(100, 40)
            .setFont(createFont("arial",14));

        cp5.addButton("cancel")
            .setValue(0)
            .setPosition((3 * horiz_margin_spacing + 400), 3 * vert_margin_spacing+80)
            .setSize(100, 40)
            .setFont(createFont("arial",14));

        is_expanded = 1;
    }

    void resetSpacing() {
        list_spacing = 0;
        metric_spacing = 0;
    }
}
