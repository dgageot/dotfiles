#!/usr/bin/env bash

########################################################################
# Matthew's Git Bash Prompt
########################################################################
        RED="\[\033[0;31m\]"
     YELLOW="\[\033[0;33m\]"
      GREEN="\[\033[0;32m\]"
       BLUE="\[\033[0;34m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\e[0m\]"

function parse_git_branch {
  git rev-parse --git-dir &>/dev/null
  git_status="$(git status 2>/dev/null)"
  branch_pattern="^On branch ([^${IFS}]*)"
  remote_pattern="Your branch is (.*) of"
  diverge_pattern="Your branch and (.*) have diverged"

  if [[ ! ${git_status}} =~ "working tree clean" ]]; then
    state="${RED}⚡"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="${YELLOW}↑"
    else
      remote="${YELLOW}↓"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="${YELLOW}↕"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo " (${branch})${remote}${state}"
  fi
}

function prompt_func() {
    previous_return_value=$?;
    prompt="${WHITE}\w${LIGHT_GREEN}$(parse_git_branch)${COLOR_NONE} "

    if test $previous_return_value -eq 0
    then
        PS1="${prompt}${WHITE}>${COLOR_NONE} "
    else
        PS1="${prompt}${WHITE}>${COLOR_NONE} "
    fi
}

PROMPT_COMMAND=prompt_func
