import resolve from '@rollup/plugin-node-resolve';

export default {
  // other Rollup config options
  plugins: [
    resolve({
      extensions: ['.js', '.jsx']  // Ensure .jsx is included here
    }),
    // other plugins
  ],
};
