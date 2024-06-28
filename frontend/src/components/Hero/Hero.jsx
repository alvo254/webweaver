import React, { Component } from 'react'
import Alvo from '../../img/Alvo.jpg'

const cardStyle = {
  border: '1px solid #ddd',
  borderRadius: '8px',
  padding: '20px',
  margin: '20px 0',
  boxShadow: '0 4px 8px rgba(0,0,0,0.1)',
  backgroundColor: '#f9f9f9',
};

const imageStyle = {
  width: '150px',
  height: '150px',
  borderRadius: '50%',
  objectFit: 'cover',
  margin: '0 auto 20px',
  display: 'block',
  border: '3px solid #3498db',
};

const linkStyle = {
  color: '#3498db',
  textDecoration: 'none',
  fontWeight: 'bold',
};

export default class Hero extends Component {
  render() {
    return (
      <div style={{ textAlign: 'center', margin: '40px auto', maxWidth: '800px', fontFamily: 'Arial, sans-serif' }}>
        <img 
        src={Alvo} 
          alt="Alvin Ndungu" 
          style={imageStyle}
        />
        <h1 style={{ color: '#2c3e50' }}>Welcome to Alvin Ndungu's Achievement Page!</h1>
        
        <div style={cardStyle}>
          <h2 style={{ color: '#3498db' }}>HNG Internship</h2>
          <p>
            I'm excited to share that I have successfully joined the HNG internship program!
          </p>
          <p>
            For more information about the HNG internship, visit the{' '}
            <a href="https://hng.tech" target="_blank" rel="noopener noreferrer" style={linkStyle}>
              HNG website
            </a>.
          </p>
        </div>

        <div style={cardStyle}>
          <h2 style={{ color: '#3498db' }}>Professional Background</h2>
          <p>
            You can learn more about my professional background on my{' '}
            <a href="https://linkedin.com/in/alvin-ndungu" target="_blank" rel="noopener noreferrer" style={linkStyle}>
              LinkedIn profile
            </a>.
          </p>
        </div>

        <div style={cardStyle}>
          <h2 style={{ color: '#3498db' }}>Projects</h2>
          <p>
            Check out my projects on my{' '}
            <a href="https://github.com/alvo254" target="_blank" rel="noopener noreferrer" style={linkStyle}>
              GitHub profile
            </a>.
          </p>
        </div>
      </div>
    )
  }
}