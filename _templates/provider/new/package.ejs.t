---
    to: providers/<%= name %>/package.json
---


{
  "name": "@notifire/<%= name %>",
  "version": "0.2.3",
  "description": "A <%= name %> wrapper for notifire",
  "main": "build/main/index.js",
  "typings": "build/main/index.d.ts",
  "module": "build/module/index.js",
  "private": false,
  "repository": "https://github.com/notifirehq/notifire",
  "license": "MIT",
  "keywords": [],
  "scripts": {
    "build": "run-p build:*",
    "build:main": "tsc -p tsconfig.json",
    "build:module": "tsc -p tsconfig.module.json",
    "fix": "run-s fix:*",
    "fix:prettier": "prettier \"src/**/*.ts\" --write",
    "fix:lint": "eslint src --ext .ts --fix",
    "test": "run-s build test:*",
    "test:lint": "eslint src --ext .ts",
    "test:unit": "jest src",
    "watch:build": "tsc -p tsconfig.json -w",
    "watch:test": "jest src --watch",
    "reset-hard": "git clean -dfx && git reset --hard && yarn",
    "prepare-release": "run-s reset-hard test"
  },
  "publishConfig": {
    "access": "public"
  },
  "engines": {
    "node": ">=10"
  },
  "dependencies": {
    "@notifire/core": "^0.2.3"
  },
  "devDependencies": {
    "@istanbuljs/nyc-config-typescript": "^1.0.1",
    "@types/jest": "^27.0.1",
    "codecov": "^3.5.0",
    "cspell": "^4.1.0",
    "cz-conventional-changelog": "^3.3.0",
    "gh-pages": "^3.1.0",
    "jest": "^27.1.0",
    "npm-run-all": "^4.1.5",
    "nyc": "^15.1.0",
    "open-cli": "^6.0.1",
    "prettier": "^2.1.1",
    "standard-version": "^9.0.0",
    "ts-jest": "^27.0.5",
    "ts-node": "^9.0.0",
    "typedoc": "^0.19.0"
  },
  "files": [
    "build/main",
    "build/module",
    "!**/*.spec.*",
    "!**/*.json",
    "CHANGELOG.md",
    "LICENSE",
    "README.md"
  ],
  "ava": {
    "failFast": true,
    "timeout": "60s",
    "typescript": {
      "rewritePaths": {
        "src/": "build/main/"
      }
    },
    "files": [
      "!build/module/**"
    ]
  },
  "config": {
    "commitizen": {
      "path": "cz-conventional-changelog"
    }
  },
  "prettier": {
    "singleQuote": true
  },
  "nyc": {
    "extends": "@istanbuljs/nyc-config-typescript",
    "exclude": [
      "**/*.spec.js"
    ]
  }
}
