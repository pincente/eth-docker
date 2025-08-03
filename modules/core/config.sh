#!/usr/bin/env bash
# Core configuration functions for ethd

__project_name="Eth Docker"
__app_name="Ethereum node"
__sample_service="consensus"
__docker_exe="docker"
__old_docker=0
__compose_exe="docker compose"
__old_compose=0
__compose_upgraded=0
__target_pg=17
__distro=""
__os_major_version=""
__eol_os=0
__min_ubuntu=22
__suggest_ubuntu="24.04 or 22.04."
__upgrade_ubuntu="24.04: https://gist.github.com/yorickdowne/94f1e5538007f4c9d3da7b22b0dc28a4"
__min_debian=11
__suggest_debian="12 or 11."
__upgrade_debian="12: https://gist.github.com/yorickdowne/ec9e2c6f4f8a2ee93193469d285cd54c"

# Environment file
__env_file=.env