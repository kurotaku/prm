import React from 'react';
import { Bar } from 'react-chartjs-2';

export default function VerticalBar({name, chart_data}) {
  const data = {
    labels: chart_data.label,
    datasets: [
      {
        label: name,
        data: chart_data.data,
        backgroundColor: '#E06674',
      }
    ],
  }
  
  const options = {
    indexAxis: 'x',
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
      legend: {
        position: 'top',
        align: 'end',
      },
      title: {
        display: true,
        text: name
      }
    },
  }

  const onClick = (element, event) => {
    if(element.length > 0){

    }
  }

  return (
    <Bar data={data} options={options} getElementAtEvent={onClick}/>
  )

}