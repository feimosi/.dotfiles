module.exports = {
  env: {
    browser: true,
    jasmine: true,
    mocha: true,
  },
  globals: {
    inject: true,
  },
  extends: [
    'airbnb/base',
  ],
  rules: {
    camelcase: [2, {
        properties: 'always',
    }],
    indent: [2, 4],
    strict: [2, 'never'],
    'func-names': 0,
    'id-length': [2, {
      min: 2,
      properties: 'never',
      exceptions: ['i', 'j', 'x', 'y', '$', '_'],
    }],
    'no-param-reassign': 0,
    'no-unused-expressions': [2, { allowTernary: true }],
    'no-confusing-arrow': [2, { allowParens: true }],
    'max-len': [2, 120],
    'space-before-function-paren': [2, {
      'anonymous': 'always',
      'named': 'never'
    }],
    'wrap-iife': [2, 'outside'],
  },
};
