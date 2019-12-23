module.exports = {
  content: ['**/*.html', '**/*.md'],
  css: ['static/tailwind.min.css'],
  extractors: [
    {
      extractor: content => content.match(/[\w-/:]+(?<!:)/g) || [],
      extensions: ['html', 'md']
    }
  ]
}
