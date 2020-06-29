## Qitmeer 085testnet-data

### 1. Prepare data 

restore the `blocks.ibd.zip` from the archive files.

```
$ cd ibd
$ ./unar.sh blocks.ibd.zip
x ./._blocks.ibd.zip
x blocks.ibd.zip
```

unzip the `blocks.ibd.zip`
```
$ unzip blocks.ibd.zip
Archive:  blocks.ibd.zip
  inflating: blocks.ibd
```

restore the 0.8.5 stable block data from the `blocks.ibd` file

```
./fastibd import blocks.ibd`
```


### 2. Get UTXO balance from the last stable edger data
Using the `payledger` command to get the detail output of the UTXO balance from the last stable edger data. The Block hash is `000000b4aef80adc15ab993cd8291ca08fc3000ed42fe5f696dd7b4a59c244e6` and Block Order is `542370`.  And save the output to the `payledger.output.txt` file.  

```
./payledger --srcdatadir=./ibd/data --endpoint=000000b4aef80adc15ab993cd8291ca08fc3000ed42fe5f696dd7b4a59c244e6 --disablebar > payledger.out.txt
```

### 3. Check the output file
check the output match with the stable balance (order=542370) of the kafh wallet.

```
./check_balance.sh payledger.output.txt 
```
## Note
1. The shipped `./payledger` binary version is for Dardwin (MacOS), src is [here](https://github.com/qitmeer/qitmeer/blob/0.8.5-dev/cmd/payledger/). see [doc](https://github.com/Qitmeer/qitmeer/blob/0.8.5-dev/cmd/payledger/README.md) for more details.
2. The shipped `./ibd/fastibd` binary version is for Dardwin (MacOS), src is [here](https://github.com/Qitmeer/qitmeer/tree/master/cmd/fastibd/),  see [doc](https://github.com/Qitmeer/qitmeer/blob/master/cmd/fastibd/README.md) for more details.

