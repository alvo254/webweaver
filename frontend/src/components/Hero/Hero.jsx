import React, { Component } from 'react'

export default class Hero extends Component {
  render() {
    return (
        <div style={{ textAlign: 'center', margin: '40px', fontFamily: 'Arial, sans-serif' }}>
        <h1>Welcome to Alvin Ndungu's Achievement Page!</h1>
        <p>
            I'm excited to share that I have successfully joined the HNG internship program!
        </p>
        <p>
            You can learn more about my professional background on my{' '}
            <a href="https://linkedin.com/in/alvin-ndungu" target="_blank" rel="noopener noreferrer">
                LinkedIn profile
            </a>.
        </p>
        <p>
            You can chackout my projects on{' '}
            <a href="https://github.com/alvo254" target="_blank" rel="noopener noreferrer">
                Github profile
            </a>.
        </p>
        <p>
            For more information about the HNG internship, visit the{' '}
            <a href="https://hng.tech" target="_blank" rel="noopener noreferrer">
                HNG website
            </a>.
        </p>
    </div>
    )
  }
}
