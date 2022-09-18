############################
# This script collects all required info from user before installation process
# begins
############################
realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

########## Detect OS
if [[ $OSTYPE == "linux-gnu"* ]]; then
  platform="linux"
elif [[ $OSTYPE == "darwin"* ]]; then
  platform="osx"
elif [[ $OSTYPE == "cygwin" ]]; then
  # POSIX compatibility layer and Linux environment emulation for Windows
  platform="windows-linux"
elif [[ $OSTYPE == "msys" ]]; then
  # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
  platform="windows-gnu"
elif [[ $OSTYPE == "win32" ]]; then
  platform="windows"
elif [[ $OSTYPE == "freebsd"* ]]; then
  platform="freebsd"
else
  platform="unknown"
fi

if [[ $platform == "osx" ]]; then
  echo "Please enter installation mode: "
  echo "1 - personal PC (default)"
  echo "2 - work PC"
  read DF_MODE
  if [[ $DF_MODE =~ ^2$ ]]; then
    echo "WORK MODE"
    is_home=false
    is_work=true
  else
    echo "HOME MODE"
    is_home=true
    is_work=false
  fi
fi


export DF_HOME_MODE=$is_home
export DF_WORK_MODE=$is_work
export DF_PLATFORM=$platform
export DF_MY_DOTFILES_DIR=$(realpath $(dirname $(dirname ${BASH_SOURCE:-$0})))
export DF_FLAGS_COLLECTED=1
