# Generates a test filler around wrc20.wat

WRC20 is defined up to the interface, and each implementation can internally store balances in their own way. So first choose a footer.txt with the correct internal representation of your initial state, it is in the curly braces at the top.

We have a script to wrap a `wrc20.wat` into an ewasm test which executes each of the four tests in the original description of wrc20 https://gist.github.com/axic/16158c5c88fbc7b1d09dfa8c658bc363 .

Generate the test filler.

```sh
python3 generate_wrc20_filler.py wrc20.wat header.txt footer1.txt
```

The output is `wrc20Filler.yml`. You need an ewasm client which can handle yml fillers. For example, we follow notes from the ewasm benchmarking repo which also uses the test system.

```sh
TEST_DIR=<path to ewasm tests, found at https://github.com/ewasn/tests>
TESTETH_EXEC=<path to testeth executable, can download release of aleth which includes this executable>
HERA_SO=<path to hera.so, must compile hera found at https://github.com/ewasm/hera>

cp wrc20Filler.yml $TEST_DIR/src/GeneralStateTestsFiller/stEWASMTests/

# fill the test
ETHEREUM_TEST_PATH=$TEST_DIR $TESTETH_EXEC -t GeneralStateTests/stEWASMTests -- --filltests --vm $HERA_SO --evmc engine=binaryen --singlenet "Byzantium" --singletest wrc20

# execute the test
ETHEREUM_TEST_PATH=$TEST_DIR $TESTETH_EXEC -t GeneralStateTests/stEWASMTests -- --vm $HERA_SO --evmc engine=binaryen --singlenet "Byzantium" --singletest wrc20
```
