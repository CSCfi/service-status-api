import { defineConfig } from 'vite-plus';

export default defineConfig({
  fmt: {
    printWidth: 80,
    singleQuote: true,
    sortImports: true,
  },
  lint: {
    categories: {
      correctness: 'error',
      perf: 'error',
      restriction: 'error',
      style: 'error',
      suspicious: 'error',
    },
    options: { typeAware: true, typeCheck: true },
    rules: {},
  },
  staged: {
    '*': 'vp check --fix',
  },
});
