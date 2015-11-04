#!/bin/sh

####作業用変数#################
DIR_BASE=/tmp
EXEC_LOG=${DIR_BASE}/Command_Loop_`date "+%Y%m%d%H%M%S"`

####実行回数指定(数字を編集)###
COUNT=3

####実処理#####################

echo "このスクリプトは約$((COUNT * 3 + 2))分程度で完了致します。"

for i in `seq $COUNT` #回数指定
do

while read line #実行コマンドを読み込みループ処理
do
   echo "$line" >> $EXEC_LOG #実行コマンド名をログに記載
   echo "------------------出力ログ------------------" >> $EXEC_LOG
   $line >> $EXEC_LOG #ここでコマンドを実行
   echo "####################################" >> $EXEC_LOG
   echo "####ここから次のコマンドです。######" >> $EXEC_LOG
   echo "####################################" >> $EXEC_LOG

done <<END #以下実行コマンドリスト
date
hostname
date
sleep 180

END
done

exit
