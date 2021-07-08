import React from 'react';
import { Bar } from 'react-chartjs-2';

export default function StackedBar({name, chart_data}) {

  var colors = ['#E06674', '#F39EA7', '#42628E', '#80B5DD', '#ECA35E', '#F6C27C', '#589F94', '#93C1BA']

  let datasets = []
  datasets = Object.keys(chart_data.data).map((key,index) => {
    return {
      label: key,
      data: Object.keys(chart_data.data[key]).map((k,i) => {
        return chart_data.data[key][k]
      }),
      backgroundColor: colors[index],
    }
  })

  const labels = Object.keys(chart_data.data[Object.keys(chart_data.data)[0]])

  const data = {
    labels: labels,
    datasets: datasets,
  }
  
  const options = {
    plugins: {
      legend: {
        position: 'top',
        align: 'end',
      },
      title: {
        display: true,
        text: name
      },
    },
    responsive: true,
    maintainAspectRatio: false,
    scales: {
      x: {
        stacked: true,
      },
      y: {
        stacked: true
      }
    }
  }

  const onClick = (element, event) => {
    if(element.length > 0){

    }
  }

  return (
    <Bar data={data} options={options} getElementAtEvent={onClick}/>
  )

}