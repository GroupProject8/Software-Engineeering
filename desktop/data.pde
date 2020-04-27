static abstract class Status {
  static final String[] LIST = {
    Status.PUBLISHED, 
    Status.UPDATING,
    Status.CANCELED
  };
  static final String PUBLISHED = "published";
  static final String UPDATING = "updating";
  static final String CANCELED = "canceled";
}

public class Metric {
  public String name;
  public float value;
  // The Constructor
  Metric(String _name, float _value) {
    name = _name;
    value = _value;
  }
}

private class Database {
  int max_recipes = 100;
  JSONObject[] recipes = new JSONObject[max_recipes];
  Database() {
  }
  int max_recipes() {
    return max_recipes;
  }
}

void refreshData() {
  File dir;
  File[] files;
  dir = new File(dataPath(""));
  files = dir.listFiles();
  JSONObject json;
  if (files != null) {
    for (int i = 0; i <= files.length - 1; i++) {
      String path = files[i].getAbsolutePath();
      if (path.toLowerCase().endsWith(".json")) {
        json = loadJSONObject(path);
        if (json != null) {
          db.recipes[i] = json;
        }
      }
    }
  }
}

public class RecipeData {
  JSONObject[] getRecipesByStatus(String status) {
    JSONObject[] ret = new JSONObject[0];
    for (JSONObject recipe : db.recipes) {
      if (recipe != null) {

        if (status.contains(recipe.getString("recipe_status"))) {
          ret = (JSONObject[]) append(ret, recipe);
        }
      }
    }
    return ret;
  }
  // API CALL 1
  JSONObject getRecipeByID(String id) {
    JSONObject ret = new JSONObject();
    for (JSONObject recipe : db.recipes) {
      if (recipe != null) {
        if (id.contains(recipe.getString("recipe_id"))) {
          ret = recipe;
        }
      }
    }
    return ret;
  }
  // API CALL 2
  void saveRecipetoDB(JSONObject recipe) {
    if (recipe == null) {
      return;
    } else {
      saveJSONObject(recipe, "data/" + recipe.getString("recipe_id") + ".json");
    }
  }
  // API CALL 3
  void updateRecipeStatus(String id, String newstatus) {
    JSONObject[] ret = new JSONObject[db.max_recipes()];

    JSONObject recipe = getRecipeByID(id);
    // key, value
    recipe.setString("recipe_status", newstatus);
    client.publish("recipes", recipe.toString());
  }
}
