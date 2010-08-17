sys = require 'sys'
fs = require 'fs'
exec = require('child_process').exec

task 'deploy', 'copies files to remote server', ->
  rsync = exec "rsync -av -e ssh --exclude '*sass-cache*' --exclude '*git*' --exclude 'Cakefile' . lasers@motherfuckinglasers.com:~/public/", (error, stdout, stderr) ->
    puts stdout

task 'watch', 'watches and compilees coffee & sass', ->
  coffee = spawn 'coffee', ['-cwl', '*.coffee']
  sass   = spawn 'sass', ['-t', 'compact', '--watch', '.']
  
  [coffee, sass].forEach (child) ->
    child.stdout.on 'data', (data) -> sys.print data
    child.stderr.on 'data', (data) -> sys.print data
