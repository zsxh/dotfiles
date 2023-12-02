# echo "login shell"

# ------------------- PATH -------------------
# NOTE: prevent /usr/libexec/path_helper from reordering zsh $PATH
# https://gist.github.com/Linerre/f11ad4a6a934dcf01ee8415c9457e7b2
# since ${ZDOTDIR}/.zprofile is loaded after /etc/zprofile (calling page_helper), we reset correct order PATH here
if [[ ${OS_UNAME} == "Darwin" ]]; then
    source "${ZDOTDIR:-${HOME}}/.zshenv-path"
fi

