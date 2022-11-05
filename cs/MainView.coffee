`
import Canvas from './Canvas'
import React from 'react';
import Slider from '@mui/material/Slider';
`
MainView = (props) ->
  { value, app } = props;

  <Box sx={{ width: 640 }}>
    <Canvas value={value} />
    <Slider
      value={value}
      min={1}
      max={10}
      valueLabelDisplay={"on"}
      onChange={(event, value) => app.onValue(value)}
    />
  </Box>

export default MainView