import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import static com.kms.katalon.core.testobject.ObjectRepository.findWindowsObject
import com.kms.katalon.core.checkpoint.Checkpoint as Checkpoint
import com.kms.katalon.core.cucumber.keyword.CucumberBuiltinKeywords as CucumberKW
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling as FailureHandling
import com.kms.katalon.core.testcase.TestCase as TestCase
import com.kms.katalon.core.testdata.TestData as TestData
import com.kms.katalon.core.testng.keyword.TestNGBuiltinKeywords as TestNGKW
import com.kms.katalon.core.testobject.TestObject as TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import com.kms.katalon.core.windows.keyword.WindowsBuiltinKeywords as Windows
import internal.GlobalVariable as GlobalVariable
import org.openqa.selenium.Keys as Keys

WebUI.verifyElementPresent(findTestObject('Home Page/todo_title'), 0)

title_before = WebUI.getText(findTestObject('Home Page/todo_title'))

try {
    WebUI.verifyElementVisible(findTestObject('Home Page/todo_content'))
}
catch (Exception e) {
    WebUI.click(findTestObject('Home Page/todo_title'))
} 
finally { 
    content_before = WebUI.getText(findTestObject('Home Page/todo_content'))

    WebUI.click(findTestObject('Home Page/todo_expand'))
}

WebUI.setText(findTestObject('Home Page/title_input'), 'edited baz')

WebUI.setText(findTestObject('Home Page/content_input'), 'edited bar')

WebUI.click(findTestObject('Home Page/modal_close_button'))

WebUI.verifyElementNotPresent(findTestObject('Home Page/todo_title'), 0)

WebUI.click(findTestObject('Home Page/incomplete_toggle'))

WebUI.verifyElementNotPresent(findTestObject('Home Page/todo_title'), 0)

