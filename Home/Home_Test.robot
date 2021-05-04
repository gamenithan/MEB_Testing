*** Settings ***
Library    SeleniumLibrary
Test Setup    Open MEB
Test Teardown    Close Browser

*** Test Cases ***
TC1 ทดสอบเลือกหนังสือจากหน้าแรก Test To Pass
    Check Books in every navbar    //*[@id="bottom_bar_menu"]/li[1]/a     //*[@id="feature_book_new"]/div[2]/div[1]

TC2 ทดสอบเลือกหนังสือจากหน้าขายดี Test To Pass
    Check Books in every navbar    //*[@id="bottom_bar_menu"]/li[2]/a     //*[@id="feature_bestsellers"]/div[1]/div[2]/div[1]

TC3 ทดสอบเลือกหนังสือจากหน้ามาใหม่ Test To Pass
    Check Books in every navbar    //*[@id="bottom_bar_menu"]/li[3]/a     //*[@id="feature_new_entry"]/div[1]/div[2]/div[1]

TC4 ทดสอบเลือกหนังสือจากหน้าโปรโมชั่น Test To Pass
    Check Books in every navbar    //*[@id="bottom_bar_menu"]/li[4]/a     //*[@id="promotion"]/div[2]/div[1]

TC5 ทดสอบเลือกหนังสือจากหน้าฟรีกระจาย Test To Pass
    Check Books in every navbar    //*[@id="bottom_bar_menu"]/li[5]/a     //*[@id="feature_free"]/div[1]/div[2]/div[1]

TC6 ทดสอบเลือกหนังสือจากหน้าฮิตขึ้นหิ้ง Test To Pass
    Check Books in every navbar    //*[@id="bottom_bar_menu"]/li[6]/a     //*[@id="book_list"]/div[2]/div[1]

TC7 ทดสอบเลือกหนังสือจากหน้าแนะนำ Test To Pass
    Check Books in every navbar    //*[@id="bottom_bar_menu"]/li[7]/a     //*[@id="book_list"]/div[2]/div[1]

TC8 กดที่ราคาแล้วคลิ๊กกลับไปเลือกหนังสือ Test To Pass
    Check click on price   //*[@id="add_book_to_cart_body"]/div/div[2]/button   Kimetsu no Yaiba

TC9 กดที่ราคาแล้วคลิ๊กชำระเงิน Test To Pass
    Check click on price   //*[@id="add_book_to_cart_body"]/div/div[3]/a   ตะกร้า

TC10 กดที่ราคาแล้วคลิ๊กชำระเงินด้วย meb.coin Test To Pass
    Check click on price   btn-fast-pay-via-meb-coin   Search Book



*** Keywords ***
Open MEB
    Open Browser    https://www.mebmarket.com   chrome 
Check Books in every navbar
    [Arguments]    ${page}    ${book}
    Maximize Browser Window
    Click Element    //*[@id="top_bar_left"]/div/div
    Wait Until Element Is Visible    //*[@id="modal_login"]/div/div/div[2]/fieldset/div[2]/button    10
    Input Text     username    gamemaipak
    sleep    0.5s
    Input Password    password   Game9794
    sleep    0.5s
    sleep     0.5s
    Click Button    //*[@id="btn-login"]
    sleep     1s
    Click Link    ${page}
    sleep     1s
    Click Element    ${book}
    Switch Window    NEW
    Page should Contain    ติดตาม
Check click on price
    [Arguments]    ${path}    ${Checkpage}
    Maximize Browser Window
    Click Element    //*[@id="top_bar_left"]/div/div
    Wait Until Element Is Visible    //*[@id="modal_login"]/div/div/div[2]/fieldset/div[2]/button    10
    Input Text     username    gamemaipak
    sleep    0.5s
    Input Password    password   Game9794
    sleep    0.5s
    sleep     0.5s
    Click Button    //*[@id="btn-login"]
    sleep     2s
    Input Text    input_search_main_header    yaiba
    Press keys    input_search_main_header    RETURN
    Wait Until Page Contains    Kimetsu no Yaiba
    Click Button    //*[@id="book_list_147993"]/div/div[3]/table/tbody/tr/td[2]/input
    Wait Until Page Contains    เพิ่มหนังสือลงตะกร้าแล้ว
    sleep    1s
    Click Element    ${path}
    sleep    1s
    Wait Until Page Contains    ${Checkpage}
    Page Should Contain    ${Checkpage}