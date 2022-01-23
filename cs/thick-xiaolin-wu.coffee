# A simple extension to Xiaolin Wu's line drawing algorithm to draw thick lines.
#
# Adapted from https://en.wikipedia.org/wiki/Xiaolin_Wu%27s_line_algorithm
#

plot = (imagedata, x, y, c, r, g, b) ->
  # plot the pixel at (x, y) with brightness c (where 0 ≤ c ≤ 1)
  index = (x + y * imageData.width)
  imageData.data[index * 4 + 0] = r
  imageData.data[index * 4 + 1] = g
  imageData.data[index * 4 + 2] = b
  imageData.data[index * 4 + 3] = c * 255
  return

drawLine = (imagedata, x0, y0, x1, y1, r, g, b) ->

  # If drawing a dot, the call drawDot function
  #if Math.abs(y1 - y0) < 1.0 && Math.abs(x1 - x0) < 1.0
  #  #drawDot (x0 + x1) / 2, (y0 + y1) / 2
  #  return

  # steep means that m > 1
  steep = Math.abs(y1 - y0) > Math.abs(x1 - x0)

  # If steep, then x and y must be swapped because the width is fixed in the y direction and that won't work if
  # dx < dy. Note that they are swapped again when plotting.
  if steep
    [x0, y0] = [y0, x0]
    [x1, y1] = [y1, x1]

  # Swap endpoints to ensure that dx > 0
  if x0 > x1
    [x0, x1] = [x1, x0]
    [y0, y1] = [y1, y0]

  dx = x1 - x0
  dy = y1 - y0
  gradient = if dx > 0 then dy / dx else 1.0

  # Handle first endpoint
  xend = Math.round(x0)
  yend = y0 + gradient * (xend - x0)
  xgap = 1 - (x0 + 0.5 - xend)
  xpxl1 = xend # this will be used in the main loop
  ypxl1 = Math.floor(yend)
  fpart = yend - Math.floor(yend)
  rfpart = 1 - fpart

  if steep
    plot(imagedata, ypxl1    , xpxl1, rfpart * xgap, r, g, b)
    plot(imagedata, ypxl1 + 1, xpxl1,  fpart * xgap, r, g, b)
  else
    plot(imagedata, xpxl1, ypxl1    , rfpart * xgap, r, g, b)
    plot(imagedata, xpxl1, ypxl1 + 1,  fpart * xgap, r, g, b)

  intery = yend + gradient # first y-intersection for the main loop

  # Handle second endpoint
  xend = Math.round(x1)
  yend = y1 + gradient * (xend - x1)
  xgap = 1 - (x1 + 0.5 - xend)
  xpxl2 = xend # this will be used in the main loop
  ypxl2 = Math.floor(yend)
  fpart = yend - Math.floor(yend)
  rfpart = 1 - fpart

  if steep
    plot(imagedata, ypxl2    , xpxl2, rfpart * xgap, r, g, b)
    plot(imagedata, ypxl2 + 1, xpxl2,  fpart * xgap, r, g, b)
  else
    plot(imagedata, xpxl2, ypxl2    , rfpart * xgap, r, g, b)
    plot(imagedata, xpxl2, ypxl2 + 1,  fpart * xgap, r, g, b)

  # main loop
  if steep
    for x in [xpxl1 + 1...xpxl2]
      fpart = intery - Math.floor(intery)
      rfpart = 1 - fpart
      y = Math.floor(intery)
      plot(imagedata, y    , x, rfpart, r, g, b)
      plot(imagedata, y + 1, x,  fpart, r, g, b)
      intery = intery + gradient
  else
    for x in [xpxl1 + 1...xpxl2]
      fpart = intery - Math.floor(intery)
      rfpart = 1 - fpart
      y = Math.floor(intery)
      plot(imagedata, x, y    , rfpart, r, g, b)
      plot(imagedata, x, y + 1,  fpart, r, g, b)
      intery = intery + gradient
  return
