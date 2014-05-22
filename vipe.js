#!/usr/bin/env node

/**
 * This is a node implementation of the shell script,
 * just for fun :) vipe.sh is what's being used.
 */

var fs = require('fs');
var exec = require('child_process').exec;
var concat = require('concat-stream');
var run = require('comandante');

var tmp = '/tmp/vipe.' + Math.random() + '.txt';

process.stdin.isTTY()
  ? start('')
  : process.stdin.pipe(concat(start));

function start(stdin){
  fs.writeFileSync(tmp, stdin);
  var ed = process.env.EDITOR || 'vi';
  run(ed, [tmp], { stdio: 'pipe' })
  .on('exit', function(){
    process.stdout.write(fs.readFileSync(tmp));
    fs.unlinkSync(tmp);
  });
}

