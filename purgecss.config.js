module.exports = {
  content: ['**/*.html'],
  css: [
    'static/tailwind.min.css',
    'static/markdown.css',
    'static/style.css'
  ],
  extractors: [
    {
      extractor: content => content.match(/[\w-/:]+(?<!:)/g) || [],
      extensions: ['html', 'md']
    }
  ]
}
