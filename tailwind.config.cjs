/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      fontFamily: {
        "Panchang-Extrabold": ["Panchang-Extrabold"],
        "Panchang-Light": [" Panchang-Light"],
        "Panchang-Medium": ["Panchang-Medium"],
        "HankenGrotesk-Bold": ["HankenGrotesk-Bold",]
      }
    },
  },
  plugins: [],
}
