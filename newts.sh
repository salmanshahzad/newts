mkdir $1
cd $1
npm init -y
npm install @types/node prettier typescript --save-dev
npx npm-add-script -k format -v "prettier --write \"src/**/*.ts\""
npx npm-add-script -k start -v "tsc && node dist/index.js"
cat > tsconfig.json << EOM
{
  "compilerOptions": {
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
    "esModuleInterop": true,
    "forceConsistentCasingInFileNames": true,
    "module": "CommonJS",
    "moduleResolution": "node",
    "noFallthroughCasesInSwitch": true,
    "noImplicitReturns": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "outDir": "dist",
    "resolveJsonModule": true,
    "rootDir": "src",
    "strict": true,
    "target": "ES2020"
  },
  "exclude": ["__tests__"]
}
EOM
mkdir src
touch src/index.ts
