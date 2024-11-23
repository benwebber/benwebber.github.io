/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'media',
  content: ['./dist/**/*.html'],
  theme: {
    extend: {
      colors: {
        primary: 'var(--primary)',
      },
      typography: ({theme}) => ({
        zinc: {
          css: {
            '--tw-prose-body': theme('colors.zinc[800]'),
          },
        },
      }),
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}
