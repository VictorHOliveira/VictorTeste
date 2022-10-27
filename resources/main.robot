*** Settings ***
# BIBLIOTECAS
Library  OperatingSystem
Library  SeleniumLibrary
Library  Collections
Library  Screenshot
Library  DateTime
Library  BuiltIn
Library  String

Variables  ${ROOT}/resources/config_helper.py

# CONFIGURAÇÕES DE EXECUÇÃO
Resource  ${ROOT}/resources/shared/setups_teardowns.robot
Resource  ${ROOT}/resources/shared/hook.robot

# PAGES - ELEMENTS/FEATURES
Resource    ${ROOT}/resources/keywords/homePage.robot
Resource    ${ROOT}/resources/keywords/searchItemPage.robot