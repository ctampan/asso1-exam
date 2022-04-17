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

WebUI.click(findTestObject('Home Page/create_new_button'))

WebUI.setText(findTestObject('Home Page/title_input'), 'baz')

WebUI.setText(findTestObject('Home Page/content_input'), 'bar')

WebUI.click(findTestObject('Home Page/modal_close_button'))

WebUI.verifyElementText(findTestObject('Home Page/todo_title'), 'baz')

WebUI.verifyElementNotVisible(findTestObject('Home Page/todo_content'), FailureHandling.STOP_ON_FAILURE)

WebUI.click(findTestObject('Home Page/todo_title'))

WebUI.verifyElementVisible(findTestObject('Home Page/todo_content'), FailureHandling.STOP_ON_FAILURE)

WebUI.verifyElementText(findTestObject('Home Page/todo_content'), 'bar')

WebUI.click(findTestObject('Home Page/todo_title'))

WebUI.verifyElementNotVisible(findTestObject('Home Page/todo_content'), FailureHandling.STOP_ON_FAILURE)

