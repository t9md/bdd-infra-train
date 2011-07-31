Feature: example.org ssh logins
  As a user of example.org
  I need to login remotely

  Scenario: Basic login
    Given I have no public keys set
    Then I can ssh to "box1" with the following credentials:
      | username | password |
      | vagrant | vagrant |

  Scenario: Login to multiple hosts
    Given I have no public keys set
    Then I can ssh to the following hosts with these credentials:
      | hostname | username | password |
      | box1 | vagrant | vagrant |

  Scenario: Login with a key
    Given I have the following public keys:
      | keyfile |
      | /home/t9md/.ssh/id_rsa |
    Then I can ssh to the following hosts with these credentials:
      | hostname | username |
      | box1 | root |

  Scenario: Login with an inline key
    Then I can ssh to the following hosts with these credentials:
      | hostname | username | keyfile |
      | box1 | root | /home/t9md/.ssh/id_rsa |

  Scenario: Checking /etc/passwd
    When I ssh to "box1" with the following credentials:
      | hostname | username | keyfile |
      | box1 | root | /home/t9md/.ssh/id_rsa |
    And I run "cat /etc/passwd"
    Then I should see "vagrant" in the output

  Scenario: ping box1
    When I ping "box1"
    Then it should respond
