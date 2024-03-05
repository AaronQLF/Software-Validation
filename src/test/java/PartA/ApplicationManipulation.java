package PartA;

import java.io.IOException;


public class ApplicationManipulation {

    private static Process process;

    public static Process runApplication() throws InterruptedException {
        Runtime rt = Runtime.getRuntime();
        try {
            process = rt.exec("java -jar runTodoManagerRestAPI-1.5.5.jar");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return process;
    }

    public static void EndApplication() {
        process.destroy();
    }
}
