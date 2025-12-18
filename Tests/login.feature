Feature: User Registration
  Scenario: Successful registration with valid details
    Given I am a new user on the registration page
    When I enter my name, a valid email address, and a strong password
    And I click the 'Register' button
    Then my account should be created
    And I should be redirected to the welcome page

  Scenario: Registration with invalid email format
    Given I am a new user on the registration page
    When I enter my name, an invalid email address, and a strong password
    And I click the 'Register' button
    Then I should see an error message indicating the email format is invalid
    And my account should not be created

  Scenario: Registration with weak password
    Given I am a new user on the registration page
    When I enter my name, a valid email address, and a weak password
    And I click the 'Register' button
    Then I should see an error message indicating the password is too weak
    And my account should not be created

Feature: Password Reset
  Scenario: Request password reset link
    Given I am on the login page
    And I have forgotten my password
    When I request a password reset link for my registered email address
    Then I should receive a password reset link via email

  Scenario: Password reset link expires after 24 hours
    Given I have received a password reset link via email
    When I try to use the link after 24 hours
    Then I should see an error message indicating the link has expired
    And I should be prompted to request a new password reset link

  Scenario: Set a new password that meets security requirements
    Given I have received a valid password reset link
    When I enter a new password that meets security requirements
    And I confirm the new password
    Then my password should be updated
    And I should be able to log in with the new password

  Scenario: Set a new password that does not meet security requirements
    Given I have received a valid password reset link
    When I enter a new password that does not meet security requirements
    And I confirm the new password
    Then I should see an error message indicating the password does not meet security requirements
    And my password should not be updated

Feature: Profile Update
  Scenario: Update profile information successfully
    Given I am logged in to my account
    When I update my name, email address, and profile picture with valid information
    And I save the changes
    Then my updated profile information should be saved
    And the changes should be reflected immediately

  Scenario: Update profile with invalid email format
    Given I am logged in to my account
    When I update my email address with an invalid format
    And I save the changes
    Then I should see an error message indicating the email format is invalid
    And my profile information should not be updated
