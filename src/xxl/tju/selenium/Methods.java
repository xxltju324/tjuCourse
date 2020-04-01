package xxl.tju.selenium;

import jxl.*;
import jxl.read.biff.BiffException;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
//import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;



import static org.junit.Assert.*;

import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

@RunWith(Parameterized.class)
public class Methods {
	//public static Sheet sheet;
	public String user,psd;
	
	public static WebDriver driver;
	
	
	public Methods(String user,String psd) {
		// TODO Auto-generated constructor stub
		 this.user=user;this.psd=psd;
	}

	@Parameters
	public  static List<String[]> getAccounts() throws BiffException, IOException {  //比BeforeClass先执行
		Workbook book = Workbook.getWorkbook(new File(".//others//Selenium+Lab2020.xls"));//相对路径;jxl-2.6.12.jar只能处理2003年版的excel文件,后缀名为xls
		Sheet sheet=book.getSheet(0);
		List<String[]>list = new ArrayList<>();
		//String[]strs=new String[2];
		for(int i=0;i<20;i++) {
			String[]strs=new String[2];//                     能放for循环外面吗？
			strs[0]=sheet.getCell(1, i).getContents();//列，行
			strs[1]=sheet.getCell(2, i).getContents();
			list.add(strs);                                 //null.add()？
		}
		
		
		
		return list;
	}
	@BeforeClass
	public static void getDriver() {       //BeforeClass与AfterClass在有Parameters的情况下也是只执行一次
		String driverPath = System.getProperty("user.dir") + "/others/geckodriver.exe";   //该参数函数只执行一次
		System.setProperty("webdriver.gecko.driver", driverPath);
		driver = new FirefoxDriver();
		driver.get("http://103.120.226.190/selenium-demo/git-repo");
	}
	@Test
	public void Test() {
		
		//待定
		    driver.findElement(By.cssSelector("div.form-group:nth-child(2) > input:nth-child(1)")).click();//cssSelector与xpath可在浏览器右键复制
		    
		    driver.findElement(By.cssSelector("div.form-group:nth-child(2) > input:nth-child(1)")).sendKeys(user);
		  
		    driver.findElement(By.xpath("/html/body/div[1]/div/div/div/div/div/div[2]/div/form/div[2]/input")).click();
		    
		    driver.findElement(By.xpath("/html/body/div[1]/div/div/div/div/div/div[2]/div/form/div[2]/input")).sendKeys(psd);
		    
		    driver.findElement(By.cssSelector(".btn")).click();
		    
		    String message=driver.findElement(By.cssSelector("div.mb-2:nth-child(6) > code:nth-child(1)")).getText();  //getText() or toString()? which
		    System.out.println(message);
		    boolean a=(message==psd);
		    assertTrue(a);
		    
		    //如何关闭driver？
		
		
	}
	@AfterClass
	public static void close() {
		driver.close();
	}
	
	
	
	


}
