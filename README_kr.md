# vim-git-msg-wheel

[English](README.md) [한국어](README_kr.md)

최신 git commit 메시지를 보여주고, 줄 단위 자동 완성을 제공합니다.

![gif](vim-git-msg-wheel.gif)

# 이걸 왜 써야 하죠?

commit 메시지를 재사용하는 건 썩 좋은 git 사용 습관은 아닐 겁니다.

하지만 가끔씩은 예전 commit 메시지를 보고 참고하거나 재활용할 일이 있죠.

이 플러그인은 그럴 때의 편의를 제공하기 위해 만들었습니다.

* 최근 commit 메시지를 목록으로 볼 수 있습니다.
* 새로운 commit 메시지를 쓸 때 예전 commit 메시지를 자동완성해 수정해 쓸 수 있습니다.

# Installation

## VimPlug

.vimrc 에 다음과 같이 플러그인 정의를 추가하세요.

```viml
Plug 'johngrib/vim-git-msg-wheel'
```

그리고 .vimrc 파일을 다시 읽어들인 다음,

```
:source %
```

플러그인을 설치하세요.

```
:PlugInstall
```

# Configuraion

## 메시지 자동 완성 키 지정

* 다음과 같이 설정하면 INSERT 모드에서 `ctrl + a`를 입력해서 commit 메시지 자동 완성 목록을 볼 수 있습니다.
* 기본값은 `<C-l>` 입니다.
* 설정하지 않으면 기본값으로 사용할 수 있습니다.

```viml
let g:git_msg_wheel_key = '<C-a>'
```

## 가져올 commit 메시지 숫자 지정

* 다음과 같이 설정하면 자동 완성 목록에서 최근 `100` 개의 commit 메시지를 보여줍니다.
* 기본값은 `50` 입니다.

```viml
let g:git_msg_wheel_length = 100
```

## 아래쪽에 예전 commit 메시지 목록 보이기

* 커밋 메시지를 작성할 때, 최하단에 보여주는 예전 commit 메시지 목록을 on/off 합니다.
* 기본값은 `1` 입니다. `1`이 on 이고, `0`이 off 입니다.

```viml
let g:git_msg_wheel_list_show = 0   # 목록을 끈다
```

