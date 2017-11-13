/*
 This is the Geb configuration file.
 See: http://www.gebish.org/manual/current/configuration.html
 */


import org.openqa.selenium.firefox.FirefoxDriver
import io.github.bonigarcia.wdm.ChromeDriverManager
import org.openqa.selenium.chrome.ChromeDriver
import org.openqa.selenium.chrome.ChromeOptions
import org.openqa.selenium.phantomjs.PhantomJSDriver


ChromeOptions options = new ChromeOptions()
options.addArguments("test-type")
options.addArguments("--disable-extensions")

reportsDir = new File("target/geb-reports")
reportOnTestFailureOnly = false
baseUrl = 'http://localhost:8080/'

//ChromeDriverManager.getInstance().setup()

environments {

    chrome {
        ChromeOptions options = new ChromeOptions()
        options.addArguments("test-type")
        options.addArguments("--disable-extensions")
        driver = {  new ChromeDriver(options) }
    }

    phantomJs {
        driver = { new PhantomJSDriver() }
    }

    firefox {
        driver = { new FirefoxDriver() }
    }
}

waiting {
    timeout = 15
    retryInterval = 0.6
}

atCheckWaiting = true




