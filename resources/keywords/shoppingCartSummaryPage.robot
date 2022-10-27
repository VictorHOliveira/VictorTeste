*** Settings ***
Documentation  Controller and PageObjects about Shopping Cart Summary
Resource  ${ROOT}/resources/main.robot

*** Variables ***
&{shoppingCartSummaryPage}
...  priceTotal_1=//*[@id="cart_summary"]/tbody/tr[1]/td[6]/span
...  priceTotal_2=//*[@id="cart_summary"]/tbody/tr[2]/td[6]/span
...  totalShipping=total_shipping
...  totalPrice=total_price

*** Keywords ***
I validate if te sum of this items is correct
    ### Get value of the first article and replace the $ to EMPTY ###
    ${sumPrice1}  Get Text    ${shoppingCartSummaryPage.priceTotal_1}
    ${sumStringRpl1} =  Replace String  ${sumPrice1}  $  ${EMPTY}
   
    ### Get value of the second article and replace the $ to EMPTY ###
    ${sumPrice2}  Get Text    ${shoppingCartSummaryPage.priceTotal_2}
    ${sumStringRpl2} =  Replace String  ${sumPrice2}  $  ${EMPTY}
    
    ### Get value of the total shipping and replace the $ to EMPTY ###
    ${totalShipping}  Get Text    ${shoppingCartSummaryPage.totalShipping}
    ${totalShippingRpl} =  Replace String  ${totalShipping}  $  ${EMPTY}
    
    ### Get value of the total price and replace the $ to EMPTY ###
    ${totalPrice}  Get Text    ${shoppingCartSummaryPage.totalPrice}
    ${totalPriceRpl} =  Replace String  ${totalPrice}  $  ${EMPTY}

    ### Sum the values ###
    ${SUM} =  Evaluate  ${sumStringRpl1} + ${sumStringRpl2} + ${totalShippingRpl}
    
    Scroll Element Into View  ${shoppingCartSummaryPage.totalPrice}
    Take Screenshot

    IF     ${SUM} == ${totalPriceRpl}
        Pass Execution  TEST PASS, THE VALUE OF SUM AND TOTAL PRICE ARE EQUAL!
    ELSE
        Fail    TEST FAIL, THE VALUE OF SUM AND TOTAL PRICE ARE DIFERENT!
    END