.PHONY: test test-basic test-comprehensive test-help test-config test-network test-legacy test-execution test-mev test-coinbase test-graffiti test-checkpoint test-grafana test-remote test-history test-ssv test-lido test-validator test-consensus test-obol test-dkg test-ipv6 test-build test-os test-keys

test: test-basic test-comprehensive test-help test-config test-network test-legacy test-execution test-mev test-coinbase test-graffiti test-checkpoint test-grafana test-remote test-history test-ssv test-lido test-validator test-consensus test-obol test-dkg test-ipv6 test-build test-os test-keys

test-basic:
	./tests/test_basic.sh

test-comprehensive:
	./tests/test_comprehensive.sh

test-help:
	./tests/test_help.sh

test-config:
	./tests/test_config.sh

test-network:
	./tests/test_network.sh

test-legacy:
	./tests/test_legacy.sh

test-execution:
	./tests/test_execution.sh

test-mev:
	./tests/test_mev.sh

test-coinbase:
	./tests/test_coinbase.sh

test-graffiti:
	./tests/test_graffiti.sh

test-checkpoint:
	./tests/test_checkpoint.sh

test-grafana:
	./tests/test_grafana.sh

test-remote:
	./tests/test_remote.sh

test-history:
	./tests/test_history.sh

test-ssv:
	./tests/test_ssv.sh

test-lido:
	./tests/test_lido.sh

test-validator:
	./tests/test_validator.sh

test-consensus:
	./tests/test_consensus.sh

test-obol:
	./tests/test_obol.sh

test-dkg:
	./tests/test_dkg.sh

test-ipv6:
	./tests/test_ipv6.sh

test-build:
	./tests/test_build.sh

test-os:
	./tests/test_os.sh

test-keys:
	./tests/test_keys.sh

install-dependencies:
	sudo apt-get update
	sudo apt-get install -y expect whiptail