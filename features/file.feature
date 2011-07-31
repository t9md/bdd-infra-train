Feature: empty file test
  several file test

  # Scenario: empty file
		# Given we have an empty file named '/tmp/test'
		# Then a file named '/tmp/test' should exist

	Scenario: file remove
    Then a file named '/tmp/testfile' should contain 'hoge'
    Then a file named '/tmp/testfile' should contain 'hoge' only '3' times
    Then the file named '/tmp/testfile' should be owned by 'vagrant'
    Then the package named 'libxml2' should be 'installed'
    Then the package named 'libxml2-dev' should be 'installed'
    Then the package named 'libxslt1-dev' should be 'installed'
    Then the process named 'portmap' should be 'running' as 'daemon'
