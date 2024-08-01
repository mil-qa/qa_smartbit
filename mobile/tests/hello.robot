*** Settings ***
Documentation            Robot Appium

Library                  AppiumLibrary

*** Test Cases ***
Deve abrir o app da SmartBit
    Open Application	http://localhost:4723/wd/hub
    ...	                alias=SmartBit
    ...	                automationName=UiAutomator2
    ...                 platformName=Android
    ...                	deviceName='Android Virtual'
    ...                	app=${EXECDIR}/app/smartbit-beta.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true
    
    Sleep               3
    Close Application