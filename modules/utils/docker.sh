#!/usr/bin/env bash
# Docker handling functions for ethd

__dodocker() {
  $__docker_sudo $__docker_exe "$@"
}

__docompose() {
  # I want word splitting here
  # shellcheck disable=SC2086
  $__docker_sudo $__compose_exe "$@"
}

__handle_docker() {
  set +e
  if [[ ("$__distro" =~ "debian" || "$__distro" = "ubuntu") ]] && ! grep -qi microsoft /proc/version; then
    systemctl status docker >/dev/null
    __result=$?
    if [ ! "${__result}" -eq 0 ]; then
      echo "The Docker daemon is not running. Please check Docker installation."
      echo "\"sudo systemctl status docker\" and \"sudo journalctl -fu docker\" will be helpful."
      echo "Aborting."
      exit 1
    fi
  fi
  set -e

  __docker_version=$(docker --version | awk '{ gsub(/,/, "", $3); print $3 }')
  __docker_major_version=$(docker --version | awk '{ split($3, version, "."); print version[1]; }')
  if [ "${__docker_major_version}" -lt 23 ]; then
    __old_docker=1
    echo "Docker ${__docker_version} detected"
  else
    __old_docker=0
  fi
  __docker_sudo=""
  if ! docker images >/dev/null 2>&1; then
    if [ "$__cannot_sudo" -eq 1 ]; then
      echo "Cannot call Docker and cannot use sudo. Please make your user part of the docker group"
      exit 1
    fi
    echo "Will use sudo to access Docker"
    __docker_sudo="sudo"
  fi
  # TODO: Add the rest of the Docker handling logic
}

__check_compose_version() {
  # Check for Compose V2 (docker compose) vs Compose V1 (docker-compose)
  if docker compose version >/dev/null 2>&1; then
    __compose_version=$($__docker_sudo docker compose version | sed -n -E -e "s/.*version [v]?([0-9.-]*).*/\1/ip")
    __compose_major=${__compose_version%%.*}
    __compose_minor=${__compose_version#*.}
    __compose_minor=${__compose_minor%%.*}
    if [[ "${__compose_major}" -eq 1 ]]; then
      __old_compose=1
    elif [[ "${__compose_minor}" -lt 18 ]]; then
      __old_compose=1
    else
      __old_compose=0
    fi
  else
    __old_compose=1
    __compose_version=$($__docker_sudo docker-compose --version | sed -n -E -e "s/.*version [v]?([0-9.-]*).*/\1/ip")
  fi
  # TODO: Add the rest of the compose version checking logic
}