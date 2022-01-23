# Draw some lines on a canvas

canvas = document.createElement('canvas')
canvas.id = "thecanvas"
canvas.width = 640
canvas.height = 480
document.body.appendChild(canvas)

imageData = canvas.getContext("2d").createImageData(canvas.clientWidth, canvas.clientHeight)

drawLine(imageData, 320, 240, 160,   0, 0, 0, 0)
drawLine(imageData, 320, 240, 320,   0, 0, 0, 0)
drawLine(imageData, 320, 240, 480,   0, 0, 0, 0)
drawLine(imageData, 320, 240, 639, 120, 0, 0, 0)
drawLine(imageData, 320, 240, 639, 240, 0, 0, 0)
drawLine(imageData, 320, 240, 639, 360, 0, 0, 0)
drawLine(imageData, 320, 240, 160, 479, 0, 0, 0)
drawLine(imageData, 320, 240, 320, 479, 0, 0, 0)
drawLine(imageData, 320, 240, 480, 479, 0, 0, 0)
drawLine(imageData, 320, 240,   0, 120, 0, 0, 0)
drawLine(imageData, 320, 240,   0, 240, 0, 0, 0)
drawLine(imageData, 320, 240,   0, 360, 0, 0, 0)

canvas.getContext("2d").putImageData(imageData, 0, 0)
