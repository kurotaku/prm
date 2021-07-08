import React, { useState, useEffect } from 'react'
import axios from 'axios'
import '../../../../node_modules/react-grid-layout/css/styles.css'
import '../../../../node_modules/react-grid-layout/css/styles.css'
import RGL, { WidthProvider } from "react-grid-layout"
const ReactGridLayout = WidthProvider(RGL)

import VerticalBar from './VerticalBar'
import StackedBar from './StackedBar'

export default function Content({gadgets_data, dashboard_layout}) {
console.log(dashboard_layout)
  const [layout, setLayout] = useState(dashboard_layout ? dashboard_layout.layout : [])

  useEffect(() => {

  }, [layout])

  const onLayoutChange = (layout) => {
    saveToDB(layout)
    setLayout(layout)
  }

  const saveToDB = (layout) => {
    axios.patch(`/api/v1/dashboard_layout/${gadgets_data[0].dashboard_id}`, { 
      layout: JSON.stringify({layout})
    })
    .then(response => {
      console.log('response', response)
    })
    .catch(error => {
      console.error('dashboard_layout error!', error)
    })
  }

  return (
    <ReactGridLayout
      className="layout"
      cols={12}
      rowHeight={50}
      isDraggable={true}
      isResizable={true}
      layout={layout}
      onLayoutChange={onLayoutChange}
    >
      
      {gadgets_data.map((value, index) => {
        
        switch (value.chart_type) {
          case 'vertical_bar':
            return (
              <div className="grid-item" key={value.uid} data-grid={{x: (4*index)%12, y: Math.floor(index/4), w: 4, h: 4, minW: 4, maxW: 12, minH: 4}}>
                <VerticalBar key={index} name={value.name} chart_data={value.chart_data}/>
              </div>
            )
          case 'stacked_bar':
            return (
              <div className="grid-item" key={value.uid} data-grid={{x: (4*index)%12, y: Math.floor(index/4), w: 4, h: 4, minW: 4, maxW: 12, minH: 4}}>
                <StackedBar key={index} name={value.name} chart_data={value.chart_data}/>
              </div>
            )
          default:
            return (
              <div className="grid-item" key={value.uid} data-grid={{x: (4*index)%12, y: Math.floor(index/4), w: 4, h: 4, minW: 4, maxW: 12, minH: 4}}>undefined chart type</div>
            )
        }
      })}
      
    </ReactGridLayout>
  );
}
