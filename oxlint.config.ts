import { defineConfig } from 'oxlint';

export default defineConfig({
  categories: {
    correctness: 'warn',
    perf: 'warn',
    restriction: 'warn',
    style: 'warn',
    suspicious: 'warn',
  },
  options: {
    maxWarnings: 10,
    typeAware: true,
    typeCheck: true,
  },
  rules: {
    'eslint/no-unused-vars': 'error',
  },
});
