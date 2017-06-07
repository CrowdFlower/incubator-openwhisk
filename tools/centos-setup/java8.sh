# For the latest Java Oracle options visit:
# http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
VERSION="8u131"
BUILD="11"
wget --directory-prefix=~ --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/${VERSION}-b${BUILD}/d54c1d3a095b4ff2b6607d096fa80163/jdk-${VERSION}-linux-x64.rpm"

EXPECTED_SHA256SUM="3d1e8cc66f4fd77acef6093329d5dd95bd06e4a03926c52df794f311a0c093f8"
CALCULATED_SHA256SUM=$(sha256sum \~/jdk-${VERSION}-linux-x64.rpm | cut -d' ' -f1)
if [ "${EXPECTED_SHA256SUM}" == "${CALCULATED_SHA256SUM}" ]; then
  sudo yum localinstall -y \~/jdk-${VERSION}-linux-x64.rpm
else
  echo "Expected sha256sum  : ${EXPECTED_SHA256SUM}"
  echo "Calculated sha256sum: ${CALCULATED_SHA256SUM}"
  echo "Please check the validity of your java RPM before installing it."
  exit 1
fi
