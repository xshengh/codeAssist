#目录回退
CD_MAX_DEPTH=8
for (( i = 0; i < CD_MAX_DEPTH ; i ++ ))
do
    j=1
    CD_ALIAS_NAME="alias c" 
    CD_ALIAS_VALUE="cd .."
    while [ "$j" -lt "$i" ] 
    do
        let "j = $j+1"
        CD_ALIAS_NAME=${CD_ALIAS_NAME}"c" 
        CD_ALIAS_VALUE=${CD_ALIAS_VALUE}"/.."
     done
     $CD_ALIAS_NAME="${CD_ALIAS_VALUE}"
done

#快速杀死指定进程名 kapp phone  （按回车，phone是进程名的模糊匹配，当然尽可能唯一匹配）
function _kill_app() {
echo kill process:
adb shell ps | grep $1 | grep -v grep
echo old_p_id: `adb shell busybox pgrep $1` 
adb shell kill `adb shell ps | grep $1 | grep -v grep|awk '{print $2}'`
sleep 0.5 #新进程可能需要时间
echo new_p_id: `adb shell busybox pgrep $1`
}
alias k=_kill_app
#end
