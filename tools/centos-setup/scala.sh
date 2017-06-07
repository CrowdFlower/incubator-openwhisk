# For the latest Scala options visit:
# http://www.scala-lang.org/download/all.html
VERSION="2.11.11"
wget --directory-prefix=~ "http://downloads.lightbend.com/scala/${VERSION}/scala-${VERSION}.rpm"

EXPECTED_SHA256SUM="048d9fb23d399fe87ec3de4f50d58cc76095085784add8c545d437f09ccccd56"
CALCULATED_SHA256SUM=$(sha256sum \~/scala-${VERSION}.rpm | cut -d' ' -f1)
if [ "${EXPECTED_SHA256SUM}" == "${CALCULATED_SHA256SUM}" ]; then
  sudo yum localinstall -y \~/scala-${VERSION}.rpm
else
  echo "Expected sha256sum  : ${EXPECTED_SHA256SUM}"
  echo "Calculated sha256sum: ${CALCULATED_SHA256SUM}"
  echo "Please check the validity of your scala RPM before installing it."
  exit 1
fi
