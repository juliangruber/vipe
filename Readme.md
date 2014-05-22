
# vipe

  Pipe in and out of `$EDITOR`.

  Finally your editor is a real unix fellow!

## Example

![demo](vipe-demo.gif)

## Installation

```bash
$ npm install -g juliangruber/vipe
```

## Origin

This is a lightweight bash only version. For the original impementation in
python, check https://github.com/madx/moreutils/blob/master/vipe.

## Power combo with [gist](https://github.com/defunkt/gist) and [cipherhub](https://github.com/substack/cipherhub)

  Store some data encrypted in a gist:

```bash
$ vipe | cipherhub <GITHUB-USERNAME> | gist -pR | cut -d/ -f1-5
```

  And you get a raw gist url. To edit and update the gist in plain text:

```bash
$ curl -sL <GIST-URL>/raw | cipherhub | vipe | cipherhub <GITHUB-USERNAME> | gist -u <GIST-URL>
```

  I have this in my `~/.bash_profile`:

```bash
cipherup(){
  cipherhub juliangruber | gist -pR | cut -d/ -f1-5
}

cipheredit(){
  curl -sL $1/raw | cipherhub | vipe | cipherhub juliangruber | gist -u $1
}
```

  So I can do:

```bash
$ echo some secrets | cipherup
<GIST-URL>

$ cipheredit <GIST-URL>
```

## License

  MIT

