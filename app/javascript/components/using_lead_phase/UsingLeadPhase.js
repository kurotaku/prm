import React, { useState, useEffect } from 'react';
import axios from 'axios'

const UsingLeadPhase = ({using, product_id, lead_phase_id}) => {
  const [isUsing, setIsUsing] = useState(using)

  useEffect(() => {

  }, [isUsing])

  const onchange = () => {
    axios.patch(`/api/v1/using_lead_phase/${lead_phase_id}`, { 
      product_id: product_id 
    })
    .then(response => {
      console.log('response', response)
      setIsUsing(response.data.isUsing)
    })
    .catch(error => {
        console.error('using-lead-phase error!', error)
    })
  }

  return (
    <button key={lead_phase_id} onClick={() => onchange()}> {isUsing ? '使用中' : '使用してない'} </button>
  )
}

export default UsingLeadPhase;
