# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest
import rdstdin

import yubikey_otp

test "flow":
  echo "Full flow test, prepare clientID and YubiKey OTP..."
  echo "----------------------------------------"
  let clientID = readLineFromStdin("ClientID: ")
  echo "----------------------------------------"
  let otp = readLineFromStdin("OTP: ")
  echo "----------------------------------------"
  let pid = yubikeyExtractPublicID(otp)
  echo "Public ID: " & pid
  echo ""
  echo "Validating Public ID..."
  let pidValid = yubikeyPublicIDValidate(pid, otp)
  check(pidValid)
  echo "Public ID is valid."
  echo "----------------------------------------"
  echo ""
  echo "Validating OTP..."
  let otpValid = yubikeyOTPValidate(clientID, otp)
  check(otpValid)
  echo "OTP is valid."
  echo "----------------------------------------"