module.exports = {
    content: ['**/*.html'],
    css: ['static/tailwind.min.css'],
    extractors: [
        {
            extractor: content => content.match(/[\w-/:]+(?<!:)/g) || [],
            extensions: ['html']
        }
    ]
}
