import { useState,useEffect } from 'react'
import './App.css'

function App() {
  const [msg, setMsg] = useState('')
  useEffect(()=>{
    fetch('http://localhost:5000/api').then(res=>res.json()).then(data=>setMsg(data.message))
  },[])
  return (
    <>
     
      <h1>Demo App</h1>
      <div className="card">
        <button onClick={() => setMsg(msg)}>
          Message is {msg}
        </button>
        <p>
          Edit <code>src/App.jsx</code> and save to test HMR
        </p>
      </div>
    </>
  )
}

export default App
