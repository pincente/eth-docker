#!/usr/bin/env bash
# Help command for ethd

__update_help() {
  echo "usage: $__me update [--refresh-targets] [--non-interactive]"
  echo
  echo "Updates Eth Docker itself, as required the contents of \"${__env_file}\", and the clients."
  echo
  echo "A combination of \"git pull\" for Eth Docker, some bash scripting to bring new variables from \"default.env\""
  echo "and \"docker compose pull\" as well as \"docker compose build\" for the clients."
  echo
  echo "If warranted, will also offer resync when clients require it, or upgrade of PostgreSQL version."
  echo
  echo "\"--refresh-targets\" sets Docker tags, source targets, and repos of clients back to the defaults in \"default.env\"."
  echo "\"--non-interactive\" does not ask questions and assumes Yes for database resyncs and migrations."
  echo
}

__full_help() {
  echo "usage: $__me [-h|--help] <command>"
  echo
  echo "commands:"
  echo "  install"
  echo "    attempts to install Docker and Docker Compose for you"
  echo "  config"
  echo "    configures ${__project_name} with your choice of Ethereum clients"
  echo "  keys ACTION [--non-interactive] [--debug]"
  echo "    list, count, delete, import keys; their fee recipients; and gas fees"
  echo "    Run without ACTION to get help text"
  echo "  update [--refresh-targets] [--non-interactive] [--debug] [--trace]"
  echo "    updates all client versions and ${__project_name} itself"
  echo "    --refresh-targets will reset your custom build targets in ${__env_file} to defaults"
  echo "  up|start [service-name]"
  echo "    starts the Ethereum node, or restarts containers that had their image or"
  echo "    configuration changed. Can also start a specific service by name"
  echo "  down|stop [service-name]"
  echo "    stops the Ethereum node, or a specific service by name"
  echo "  restart [service-name]"
  echo "    restarts the Ethereum node, or a specific service by name, a combination of down and up"
  echo "  version"
  echo "    prints the version(s) of currently running client(s)"
  echo "  logs"
  echo "    shows logs"
  echo "  cmd <compose-command>"
  echo "    executes an arbitrary Docker Compose command. Use \"cmd help\" to list them"
  echo "  terminate"
  echo "    stops the Ethereum node and destroys all data stores"
  echo "  prune-nethermind [--non-interactive]"
  echo "    restarts the Nethermind execution client and prunes its DB."
  echo "  prune-besu [--non-interactive]"
  echo "    stops the Besu execution client and prunes trie-logs."
  echo "  prune-reth [--non-interactive]"
  echo "    stops the Reth execution client and prunes its DB."
  echo "  prune-history [--non-interactive]"
  echo "    stops the execution client and prunes pre-merge history, if supported."
  echo "  prune-lighthouse [--non-interactive]"
  echo "    stops the Lighthouse consensus client and prunes state."
  echo "  resync-execution"
  echo "    removes the execution layer database and forces a resync."
  echo "  resync-consensus"
  echo "    removes the consensus layer database and forces a resync."
  echo "  space"
  echo "    show Docker volume space usage"
  echo "  attach-geth"
  echo "    launches an interactive geth attach repl"
  echo "  help"
  echo "    print this help screen"
  echo
  echo "  Instead of \"--non-interactive\" you may also use the \"ETHD_FRONTEND=noninteractive\" environment variable"
  echo
  echo "The logs command can be appended by flags and specify the container(s). Example: "
  echo
  echo "  $__me logs -f --tail 50 execution"
  echo "    shows logs only for execution service"
  echo
  echo "✍️ Give feedback and report issues on GitHub:"
  echo "  * https://github.com/ethstaker/eth-docker"
  echo "🤗 Get support on Discord:"
  echo "  * http://discord.gg/ethstaker"
}

help() {
  case $* in
    *update*) __update_help;;
    *) __full_help;;
  esac
}