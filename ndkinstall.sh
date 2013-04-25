set -e
for i in $(./busybox --list)
do
  ./busybox ln -sf ./busybox ./$i
done
TOP=$(./pwd)
export PATH=$TOP
cd $TOP/..
tar xjf $1
touch ./.installed
