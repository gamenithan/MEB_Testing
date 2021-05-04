*** Settings ***
Library    SeleniumLibrary
Test Setup    Open MEB
Test Teardown    Close Browser

*** Test Cases ***
TC1 กลับไปเลือกหนังสือ Test To Pass
    Check click on price   //*[@id="add_book_to_cart_body"]/div/div[2]/button   Kimetsu no Yaiba

TC2 ชำระเงิน Test To Pass
    Check click on price   //*[@id="add_book_to_cart_body"]/div/div[3]/a   ตะกร้า

TC3 ชำระเงินด้วย meb.coin Test To Pass
    Check click on price   btn-fast-pay-via-meb-coin   Search Book

*** Keywords ***
Open MEB
    Open Browser    https://www.mebmarket.com   chrome 
Check click on price
    [Arguments]    ${path}    ${Checkpage}
    Maximize Browser Window
    Click Element    //*[@id="top_bar_left"]/div/div
    Wait Until Element Is Visible    //*[@id="modal_login"]/div/div/div[2]/fieldset/div[2]/button    10
    Input Text     username    gamemaipak
    Input Password    password   Game9794
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