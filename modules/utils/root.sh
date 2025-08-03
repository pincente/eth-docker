#!/usr/bin/env bash
# Root handling functions for ethd

__handle_root() {
  __cannot_sudo=0
  if [ "${EUID}" -eq 0 ]; then
    __as_owner="sudo -u ${OWNER}"
    __auto_sudo=""
  else
    __as_owner=""
    if groups | grep -q '\bsudo\b' || groups | grep -q '\badmin\b'; then
      __auto_sudo="sudo"
    else
      __auto_sudo=""
      __cannot_sudo=1
    fi
  fi
}