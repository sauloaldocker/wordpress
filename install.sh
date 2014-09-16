MY_PATH="`dirname \"$0\"`"

source $MY_PATH/cfg

cd $SRC_APP

git clone --branch 4.0 --depth=1 https://github.com/WordPress/WordPress.git .

sudo chown -R www-data:www-data .

