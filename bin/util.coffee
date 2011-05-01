



exports.readText = readText = (s, callback) ->
  arr = []
  s.on 'data', (data) -> arr.push data.toString 'utf-8'
  s.on 'end', () -> callback arr.join ''


exports.readText = readData = (s, callback) ->
  arr = []
  s.on 'data', (data) -> arr.push data
  s.on 'end', () -> callback joinBuffers arr


exports.joinBuffers = joinBuffers = (arr) ->
  size = 0
  for x in arr
    size += x.length
  result = new Buffer size
  pos = 0
  for x in arr
    x.copy result, pos
    pos += x.length
  result


