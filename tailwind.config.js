module.exports = {
  purge: ["./templates/**/*.html", "./theme/**/*.html", "./**/*.md"],
  theme: {},
  variants: {},
  plugins: [
    require('@tailwindcss/typography'),
  ],
};
