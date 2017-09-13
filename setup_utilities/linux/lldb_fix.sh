# source lldb_fix.sh

##############################################################################################################
# Description: 
# the symlinks that the lldb python package installs may be broken / do not exist
#
# reference / credit: https://stackoverflow.com/questions/30869945/how-to-import-lldb-in-a-python-script
##############################################################################################################

# TO BE CHANGED / ADJUSTED:
LLDB_VERSION=3.8
PYTHON_VERSION=2.7

# RUN SCRIPT
CURRENT_DIR=$(pwd)
LLDB_PATH=/usr/lib/llvm-${LLDB_VERSION}/lib/python${PYTHON_VERSION}/site-packages/lldb/

echo "* Change to directory ${LLDB_PATH}"
cd ${LLDB_PATH}

sudo rm _lldb.so
sudo ln -s ../../../liblldb.so.1 _lldb.so
sudo rm libLLVM-${LLDB_VERSION}.0.so.1
sudo ln -s ../../../libLLVM-${LLDB_VERSION}.0.so.1 libLLVM-${LLDB_VERSION}.0.so.1
sudo rm libLLVM-${LLDB_VERSION}.so.1
sudo ln -s ../../../libLLVM-${LLDB_VERSION}.0.so.1 libLLVM-${LLDB_VERSION}.so.1

printf "* copy the following to your ~/.bashrc: \n  export PYTHONPATH='/usr/lib/llvm-3.6/lib/python2.7/site-packages(/lldb)'\n"

cd $CURRENT_DIR
