#!/usr/bin/bash

read -p "请输入你要创建的用户前缀: " user_qz
read -p "请输入你要创建的用户数量: " user_num
echo "你创建的用户是 ${user_qz}1 ~ ${user_qz}${user_num}"

read -p "你要创建的用户如下，你确定要创建吗？[ y|n ] " readly


case $readly in
y)
for i in $(seq $user_num)
do
user=${user_qz}${i}
id $user &>/dev/null
if [ $? -eq 0 ];then
echo "useradd: user $user already exists"
else
useradd $user
echo "useradd: user $user add successfully."
fi
done
;;
n)
echo "你想好了再创建......"
exit
;;
*)
echo "请不要乱输入...."
exit 1

esac
