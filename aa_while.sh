#!/bin/bash

# さっき書いたんだけど！testブランチにてファイル更新
# git用にここを変更

nitiwa_flg="false"
banwa_flg="false"
fox_flg="false"

count=0

################################################################################
# function flgCountMark
# 引数 : フラグ名
# 戻り値 : なし
################################################################################
function flgCountMark ( ) {
   flg="$1"

   count=$((count + 1))

   if [ "$flg" = "nitiwa" ];then
     nitiwa_flg="true"
    echo  "### こんにちは!!! [${count}]"
   elif [ "$flg" = "banwa" ];then
     banwa_flg="true"
     echo  "### こんばんわ!!! [${count}]"
   elif [ "$flg" = "fox" ];then
     fox_flg="true"
     echo  "### やーんく!!! [${count}]#####"
   else
     echo "[$key]:ワードがちがうか複数回いったわね..."
     echo  "### バグはゆるさん!!!"
   fi
}


################################################################################
# Main
################################################################################
while :
do

  # 初期処理
  echo "こん？"

  # ユーザーの入力を待つ
  read key


  # 条件1 指定ワード (にちは、ばんは、きつね) かつ 1回だけ許容する
  if [ "${key}" = "にちは" -a "${nitiwa_flg}" = "false" ];then
    flgCountMark nitiwa
  elif [ "${key}" = "ばんは" -a "${banwa_flg}" = "false" ];then
    flgCountMark banwa
  elif [ "${key}" = "きつね" -a "${fox_flg}" = "false" ];then
    flgCountMark fox
  else
    # 指定ワード以外をいったら何もしない
    echo "[$key]:ワードがちがうか複数回いったわね..."
  fi

  # 全部のワードを言ったら処理終了
  if [ "${count}" -eq 3 ];then
    echo "全部いったからおわり"
    break
  fi

done


# 正常終了
exit
-
