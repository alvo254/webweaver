import logo from './logo.svg';
import {  BrowserRouter, Route, Routes } from 'react-router-dom';
import Hero from './components/Hero/Hero';
import './App.css';

function App() {
  return (
    <div className='App'>
      <BrowserRouter>
      <Routes>
        <Route path='/' element={<Hero />}/>
      </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
