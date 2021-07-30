


### Variables ###
&{CUSTOMER}    first_name=May   last_name=Fernandes   password=123456   address=rua Frameword, Bairro Robot   city=Floripa   id_state=9   id_postcode=12345   id_phone_mobile=999888777
${BROWSER}     chrome
${URL}         http://automationpractice.com/


Preencher os dados obrigatórios
    Wait Until Element Is Visible                  xpath=//*[@id="account-creation_form"]//h3[contains(text(),"Your personal information")]
    Click Element          id=id_gender2
    Input Text             id=customer_firstname   ${CUSTOMER.first_name}
    Input Text             id=customer_lastname    ${CUSTOMER.last_name}
    Input Text             id=passwd               ${CUSTOMER.password}
    Input Text             id=address1             ${CUSTOMER.address}
    Input Text             id=city                 ${CUSTOMER.city}
    
    Set Focus To Element   id=id_state

    Select From List By Index       id=id_state             ${CUSTOMER.id_state}
    Input Text                      id=postcode             ${CUSTOMER.id_postcode}
    Input Text                      id=phone_mobile         ${CUSTOMER.id_phone_mobile}



