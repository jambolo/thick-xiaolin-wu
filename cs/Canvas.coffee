`
import drawLine from './thick-xiaolin-wu'
import React, { Component, useRef } from 'react';
`

class Canvas extends Component
  componentDidMount: ->
    @update(1)

  componentDidUpdate: ->
    { value } = @props
    @update(value)

  update: (value) ->
    canvasRef = useRef()
    canvas = canvasRef.current
    ctx = canvas.getContext("2d")

    imageData = ctx.createImageData(canvas.clientWidth, canvas.clientHeight)

    drawPixel = (x, y, c) ->
      # plot the pixel at (x, y) with brightness c (where 0 ≤ c ≤ 1)
      index = x + y * imageData.width
      imageData.data[index * 4 + 0] = 0
      imageData.data[index * 4 + 1] = 0
      imageData.data[index * 4 + 2] = 0
      imageData.data[index * 4 + 3] = c * 255
      return

    drawLine 320, 240, 160,   0, value, drawPixel
    drawLine 320, 240, 320,   0, value, drawPixel
    drawLine 320, 240, 480,   0, value, drawPixel
    drawLine 320, 240, 639, 120, value, drawPixel
    drawLine 320, 240, 639, 240, value, drawPixel
    drawLine 320, 240, 639, 360, value, drawPixel
    drawLine 320, 240, 160, 479, value, drawPixel
    drawLine 320, 240, 320, 479, value, drawPixel
    drawLine 320, 240, 480, 479, value, drawPixel
    drawLine 320, 240,   0, 360, value, drawPixel
    drawLine 320, 240,   0, 240, value, drawPixel
    drawLine 320, 240,   0, 120, value, drawPixel

  render: ->
    <canvas ref="canvas" width={640} height={480} />

export default Canvas