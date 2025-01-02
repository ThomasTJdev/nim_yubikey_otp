# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

import yubikey_otp

test "general":
  let otp = "ccaccbs3nuggwrigbbhqfrrluevbiwilccvvjurjdcui"
  let pid = yubikeyExtractPublicID(otp)
  check(pid == "00001be55")
  check(pid != "00002be55")

  check(yubikeyPublicIDValidate(pid, otp))
  check(yubikeyOTPValidate("102222", otp) == false)