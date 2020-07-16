import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;

public class HtmlAddTest {
    public static void main(String[] args) {

        WebDriver driver = new HtmlUnitDriver();
        driver.get("http://my-tcc2:8080/webapp/add.html");

        // Replace INPUT1, INPUT2 & RESULT - during runtime
        int t1 = INPUT1;
        int t2 = INPUT2;
        int res = RESULT;

        WebElement element1 = driver.findElement(By.name("t1"));
        WebElement element2 = driver.findElement(By.name("t2"));

        element1.sendKeys(t1);
        element2.sendKeys(t2);
        element1.submit();

        System.out.println("Page title is: " + driver.getTitle());

        if (driver.getPageSource().contains(res)) {
          System.out.println("Pass: Sum of " + t1 + " & " + t2 + " is " + res);
        } else {
          System.out.println("Fail: Sum of " + t1 + " & " + t2 + " is not " + res);
        }

        driver.quit();
    }
}
