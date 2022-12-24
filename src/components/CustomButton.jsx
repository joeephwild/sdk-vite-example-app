import React from 'react'

const CustomButton = ({btnType, title, styles, handleClick}) => {
  return (
    <button className={`px-4 py-2 rounded-lg text-sm font-HankenGrotesk-Bold ${styles}`}>{title}</button>
  )
}

export default CustomButton