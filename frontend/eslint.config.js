import eslint from '@eslint/js'
import tseslint from 'typescript-eslint'
import solidPlugin from 'eslint-plugin-solid'
import prettierPlugin from 'eslint-plugin-prettier/recommended'

export default [
  eslint.configs.recommended,
  ...tseslint.configs.recommended,
  {
    plugins: {
      solid: solidPlugin,
    },
    rules: {
      'solid/reactivity': 'warn',
      'solid/no-destructure': 'warn',
    },
  },
  prettierPlugin,
]
