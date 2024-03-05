package TestAPI;

import org.junit.After;
import org.junit.Before;

import static TestAPI.ApplicationManipulation.EndApplication;
import static TestAPI.ApplicationManipulation.runApplication;
import static io.restassured.RestAssured.get;


public class BaseTestSetup {
    @Before
    public void setUp() {
        try {
            boolean appStarted = false;
            Process process = runApplication();
            Thread.sleep(200);
            while (!appStarted) {
                try {
                    get("http://localhost:4567/");
                    appStarted = true;
                } catch (Exception e){
                    Thread.sleep(200);
                }
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @After
    public void cleanUp() throws InterruptedException {
        EndApplication();
        Thread.sleep(260);
    }
}
