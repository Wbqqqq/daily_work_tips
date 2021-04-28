
downloadPath=$1

echo downloadPath

if  [ ! -d $downloadPath ];then
   echo "开始下载🍺🍺:$downloadPath";
   result=`expect -d /Users/wangbingquan/Desktop/github/My-shell/download_expect.sh $downloadPath [/bash]`
   echo $result
else
  echo "文件已下载"
fi








