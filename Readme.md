
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

  With those functions in your `~/.bash_profile`:

```bash
cipherup(){
  cipherhub juliangruber | gist -pR | cut -d/ -f1-5
}

cipheredit(){
  curl -sL $1/raw | cipherhub | vipe | cipherhub juliangruber | gist -u $1
}
```

  Store some secret data in a gist:

```bash
$ echo some secrets | cipherup
<GIST-URL>
```

  And edit it again:

```bash
$ cipheredit <GIST-URL>
```

## License

  MIT

