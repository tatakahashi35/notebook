#!/usr/local/bin/zsh

echo 'starting jupyter lab'

# jupyter-labがヒットした行数
grep_result_length=`ps aux | grep jupyter-lab | wc -l`
if test $grep_result_length -eq 1; then
    # jupyter labの実行
    echo 'running...'
    cd $HOME/notebook; nohup jupyter lab >> jupyterlab.log 2>&1 &
    # cd ~/; nohup jupyter lab --ip=0.0.0.0 --no-browser >> jupyterlab.log 2>&1 &
elif test $grep_result_length -eq 2; then
    # (たぶん)起動中
    echo 'already running'
else
    # jupyterがヒットする別のプログラムが動いてるかもなので確認
    echo 'check process'
    ps aux | grep jupyter-lab
fi
