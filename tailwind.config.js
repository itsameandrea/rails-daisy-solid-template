module.exports = {
  mode: "jit",
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/views/components/**/*.html.erb',
    './app/views/components/**/*.rb'
  ],
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require("daisyui")
  ],
  daisyui: {
    themes: ["cupcake"],
  },
}
