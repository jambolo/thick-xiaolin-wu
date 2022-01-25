# A simple extension to Xiaolin Wu's line drawing algorithm to draw thick lines.
#
# Adapted from https://en.wikipedia.org/wiki/Xiaolin_Wu%27s_line_algorithm
#

drawLine = (x0, y0, x1, y1, w, drawPixel) ->
  # Ensure positive integer values for width
  if w < 1
    w = 1

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

  # Rotate w
  w = w * Math.sqrt(1 + (gradient * gradient))

  # Handle first endpoint
  xend = Math.round(x0)
  yend = y0 - (w - 1) * 0.5 + gradient * (xend - x0)
  xgap = 1 - (x0 + 0.5 - xend)
  xpxl1 = xend # this will be used in the main loop
  ypxl1 = Math.floor(yend)
  fpart = yend - Math.floor(yend)
  rfpart = 1 - fpart

  if steep
    drawPixel ypxl1    , xpxl1, rfpart * xgap
    drawPixel ypxl1 + i, xpxl1,             1 for i in [1...w]
    drawPixel ypxl1 + w, xpxl1,  fpart * xgap
  else
    drawPixel xpxl1, ypxl1    , rfpart * xgap
    drawPixel xpxl1, ypxl1 + i,             1 for i in [1...w]
    drawPixel xpxl1, ypxl1 + w,  fpart * xgap

  intery = yend + gradient # first y-intersection for the main loop

  # Handle second endpoint
  xend = Math.round(x1)
  yend = y1 - (w - 1) * 0.5 + gradient * (xend - x1)
  xgap = 1 - (x1 + 0.5 - xend)
  xpxl2 = xend # this will be used in the main loop
  ypxl2 = Math.floor(yend)
  fpart = yend - Math.floor(yend)
  rfpart = 1 - fpart

  if steep
    drawPixel ypxl2    , xpxl2, rfpart * xgap
    drawPixel ypxl2 + i, xpxl2,             1 for i in [1...w]
    drawPixel ypxl2 + w, xpxl2,  fpart * xgap
  else
    drawPixel xpxl2, ypxl2    , rfpart * xgap
    drawPixel xpxl2, ypxl2 + i,             1 for i in [1...w]
    drawPixel xpxl2, ypxl2 + w,  fpart * xgap

  # main loop
  if steep
    for x in [xpxl1 + 1...xpxl2]
      fpart = intery - Math.floor(intery)
      rfpart = 1 - fpart
      y = Math.floor(intery)
      drawPixel y    , x, rfpart
      drawPixel y + i, x,      1 for i in [1...w]
      drawPixel y + w, x,  fpart
      intery = intery + gradient
  else
    for x in [xpxl1 + 1...xpxl2]
      fpart = intery - Math.floor(intery)
      rfpart = 1 - fpart
      y = Math.floor(intery)
      drawPixel x, y    , rfpart
      drawPixel x, y + i,      1 for i in [1...w]
      drawPixel x, y + w,  fpart
      intery = intery + gradient
  return
