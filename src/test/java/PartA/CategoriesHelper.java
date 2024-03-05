package PartA;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.json.simple.JSONObject;

import static io.restassured.RestAssured.*;
import static org.hamcrest.CoreMatchers.containsString;

public abstract class CategoriesHelper {

    private static final String base_URL = "http://localhost:4567";
    private static final int created_code = 201;

    public static String createCategory(String title, String description)
    {
        JSONObject requestBody = new JSONObject();
        //To solve the type safety issue, you need to parameterize the HashMap with the appropriate types.
        requestBody.put("title", title);
        requestBody.put("description", description);
        

        RequestSpecification request = given()
                .body(requestBody.toJSONString())
                .header("Content-Type", "application/json")
                .header("Accept", "application/json")
                .baseUri(base_URL);

        Response response = request.post("/categories");

        response.then()
                .assertThat().statusCode(created_code)
                .assertThat().body(containsString("id"))
                .assertThat().body(containsString(title))
                .assertThat().body(containsString(description));

        return response.jsonPath().getString("id");
    }

    public static String createProject() {
        String title = "proj1";
        boolean completed = false;
        boolean active = true;
        String description = "this is a proj";

        JSONObject requestBody = new JSONObject();
        requestBody.put("title", title);
        requestBody.put("completed", completed);
        requestBody.put("active", active);
        requestBody.put("description", description);

        RequestSpecification request = given();

        request.header("Content-Type", "application/json")
                .header("Accept", "application/json")
                .body(requestBody.toJSONString())
                .baseUri(base_URL);


        Response response = request.post("/projects");

        response.then()
                .assertThat().statusCode(created_code)
                .assertThat().body(containsString("id"))
                .assertThat().body(containsString(title))
                .assertThat().body(containsString(description));

        return response.jsonPath().get("id");
    }

    public static String createTodo() {
        RequestSpecification request = RestAssured.given();

        String title = "test title";

        JSONObject requestParams = new JSONObject();
        requestParams.put("title", title);

        request.header("Content-Type", "application/json")
                .header("Accept", "application/json")
                .body(requestParams.toJSONString())
                .baseUri(base_URL);

        Response response = request.post("/todos");

        response.then().assertThat().statusCode(created_code);

        return response.jsonPath().get("id");
    }

}
