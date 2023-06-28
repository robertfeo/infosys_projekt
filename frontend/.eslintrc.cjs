/* eslint-env node */
require('@rushstack/eslint-patch/modern-module-resolution');

module.exports = {
    root: true,
    extends: [
        'plugin:vue/vue3-essential',
        'eslint:recommended',
        '@vue/eslint-config-prettier/skip-formatting'
    ],
    parserOptions: {
        ecmaVersion: 'latest'
    },
    rules: {

        'vue/html-quotes': ['error', 'single'],
        'vue/html-closing-bracket-spacing': [
            'error',
            {
                selfClosingTag: 'always'
            }
        ],
        'vue/component-tags-order': [
            'error',
            {
                order: ['template', 'script', 'style']
            }
        ],
        'no-unused-vars': 'error',
        semi: 'off',
        'padding-line-between-statements': [
            'error',
            {blankLine: 'always', prev: '*', next: 'return'}
        ]
    }
};
