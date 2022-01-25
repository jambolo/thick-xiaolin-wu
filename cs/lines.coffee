# Draw some lines on a canvas

canvas = document.createElement('canvas')
canvas.id = "thecanvas"
canvas.width = 640
canvas.height = 480
document.body.appendChild canvas

imageData = canvas.getContext("2d").createImageData(canvas.clientWidth, canvas.clientHeight)

drawPixel = (x, y, c) ->
  # plot the pixel at (x, y) with brightness c (where 0 ≤ c ≤ 1)
  index = x + y * imageData.width
  imageData.data[index * 4 + 0] = 0
  imageData.data[index * 4 + 1] = 0
  imageData.data[index * 4 + 2] = 0
  imageData.data[index * 4 + 3] = c * 255
  return


drawLine 320, 240, 160,   0, 4, drawPixel
drawLine 320, 240, 320,   0, 4, drawPixel
drawLine 320, 240, 480,   0, 4, drawPixel
drawLine 320, 240, 639, 120, 4, drawPixel
drawLine 320, 240, 639, 240, 4, drawPixel
drawLine 320, 240, 639, 360, 4, drawPixel
drawLine 320, 240, 160, 479, 4, drawPixel
drawLine 320, 240, 320, 479, 4, drawPixel
drawLine 320, 240, 480, 479, 4, drawPixel
drawLine 320, 240,   0, 360, 4, drawPixel
drawLine 320, 240,   0, 240, 4, drawPixel
drawLine 320, 240,   0, 120, 4, drawPixel

canvas.getContext("2d").putImageData imageData, 0, 0
