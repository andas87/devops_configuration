PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
var_java=`update-alternatives --list java | cut -d"/" -f1-5`
var_path="${PATH}:${var_java}/bin"
#echo "$var_path"
#echo "$var_java"
#FILE="/home/devops/lab_ansible/testfile"
FILE="/etc/profile"
if [ -s "$FILE" ];then
 var_chk=`cat $FILE | grep "JAVA_HOME"`;
 if [ -z "$var_chk" ];then
  echo "export JAVA_HOME=${var_java}" >> $FILE
  echo "export PATH=${var_path}" >> $FILE
  echo "Variables updated in $FILE"
 else
  echo "Variables exist. No need to update"
 fi
else
  touch $FILE
  echo "export JAVA_HOME=${var_java}" >> $FILE
  echo "export PATH=${var_path}" >> $FILE
  echo "$FILE created and Variables updated in file"
fi
