sha256() {
  if [[ "${DEPENDENCY}" == "jdk" || "${DEPENDENCY}" == "jre" ]]; then
    cat "${ROOT}"/dependency/sapmachine-*_linux-x64_bin.sha256.txt | cut -f 1 -d ' '
  else
    cat "${ROOT}"/dependency/sha256
  fi
}

uri() {
  if [[ "${DEPENDENCY}" == "jdk" || "${DEPENDENCY}" == "jre" ]]; then
    echo "https://github.com/SAP/SapMachine/releases/download/sapmachine-$(cat "${ROOT}"/dependency/version)/$(basename "${ROOT}"/dependency/sapmachine-*_linux-x64_bin.tar.gz)"
  else
    cat "${ROOT}"/dependency/uri
  fi
}

version() {
  local PATTERN="([0-9]+)\.?([0-9]*)\.?([0-9]*)(.*)"

  if [[ $(cat "${ROOT}"/dependency/version) =~ ${PATTERN} ]]; then
    echo "${BASH_REMATCH[1]}.${BASH_REMATCH[2]:-0}.${BASH_REMATCH[3]:-0}"
    return
  else
    echo "version is not semver" 1>&2
    exit 1
  fi
}
