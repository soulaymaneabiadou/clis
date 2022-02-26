#!/bin/bash

# nextwind() {
mkdir $1
cd $1

npx create-next-app .

touch tsconfig.json

npm install --save-dev typescript @types/react

cp pages/_app.js pages/_app.tsx
cp pages/api/hello.js pages/api/hello.ts
touch pages/index.tsx
cat >pages/index.tsx <<EOF
import React from 'react';

const Home = () => {
  return (
    <div>
      <h1>Home</h1>
    </div>
  )
}

export default Home;
EOF

rm -rf pages/_app.js pages/index.js pages/api/hello.js styles/*.module.css

npm install -D tailwindcss@latest postcss@latest autoprefixer@latest
npx tailwindcss init -p
touch postcss.config.js
cat >postcss.config.js <<EOF
module.exports = { 
  plugins: { 
    tailwindcss: {},
    autoprefixer: {}
    }
}
EOF

cat <<EOF >styles/globals.css
@tailwind base;
@tailwind components;
@tailwind utilities;

EOF

echo "Done"
# }
