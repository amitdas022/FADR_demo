#Author: your.email@your.domain.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios
#<> (placeholder)
#""
## (Comments)
#Sample Feature Definition Template
@tag 
Feature: Login with UI 
I want to login
As Admin

#  Background: 
#    Given navigate to the FADR Login page
  
  Scenario Outline: Login with incorrect credentails, that is, "<Description>" 
     When Enter "<email>" and "<password>" 
      And User clicks Login button 
     Then Login fails with error message "<error_message>" 
  
    Examples: 
      | Description                             | email                        | password           | error_message                        | 
      | Login with incorrect email              | admin@eaton.com              | valid password     | Invalid Email or Password            | 
      | Login with incorrect password           | fadr_support_admin@eaton.com | somerandompassword | Invalid Email or Password            | 
      | Login with invalid email format         | admin@eaton                  | valid password     | E-mail must be a valid email address | 
      | Login with incorrect email and password | admin@eaton.com              | somerandompassword | Invalid Email or Password            | 
  
  Scenario Outline: Login with blank credentials, that is, "<Description>" 
     When Enter "<email>" and "<password>" 
      And User clicks Login button 
     Then Login fails with error message "<error_message>" 
  
    Examples: 
      | Description                         | email                        | password       | error_message        | 
      | Login with blank password           | fadr_support_admin@eaton.com |                | Password is required | 
      | Login with blank email              |                              | valid password | E-mail is required   | 
      | Login with blank email and password |                              |                | E-mail is required   | 
  
  Scenario Outline: Verify the when remember me check box is checked, email should be autofilled 
     When Enter "<email>" and "<password>" 
     When Remember Me button is <button> 
      And User clicks Login button 
      And User clicks the logout button 
     Then Verify if username field on login page is <username field> 
  
    Examples: 
      | button    | username field | email                        | password      | 
      | unchecked | not autofilled | fadr_support_admin@eaton.com | validpassword | 
      | checked   | autofilled     | fadr_support_admin@eaton.com | validpassword | 
  
  Scenario Outline: Password masking and unmasking 
     When Enter "<email>" and "<password>" 
     When Eye button is clicked <times> 
     Then Password should be <visibility> 
  
    Examples: 
      | times | visibility | email                        | password           | 
      | once  | unmasked   | fadr_support_admin@eaton.com | somerandompassword | 
      | twice | masked     | fadr_support_admin@eaton.com | somerandompassword | 
  
  Scenario: Forgot password 
     When Forgot password link is clicked 
     Then Redirect to Forgot password page 
  
  Scenario: Contact EATON support 
     When Contact EATON support representative link is clicked 
     Then Help section dialog box opens up 
  
