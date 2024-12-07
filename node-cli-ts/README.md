# Node CLI with TypeScript

Build a simple Node CLI tool using Typescript and distribute it as a single standalone JS file.

`npx degit jaymartmedia/templates/node-cli-ts my-new-ts-cli`

# Run the CLI tool

1. `npm install`
2. `npm start`

# Distribute the CLI tool

1. `npm run build`
2. Share the `dist/index.js` file

# Goals

- Allow developers to more quickly write a simple Node CLI tool
- Relatively easy to distribute the CLI tool to others
- Simple template that can be easily digested and kept in working memory

# Functionality

- TS set up out of the box (`typescript`, `ts-node`, `ts-node-dev`)
- Exports a single script that can be easily given to someone else (`ncc`)
- Some example/out-of-the-box functionality that can be removed if not needed
  - Passing CLI arguments (currently `yargs`)
  - Prompting the user for input (currently `prompts`)
  - Basic logger with colors

# FAQ

## Couldn't I just use a BASH script?

If you're writing a simple script, sure! I absolutely recommend using BASH scripts for scripting simple things. I often use BASH scripts for things like cURL requests that I run on a regular basis, simple JSON processing with JQ, and even convenience scripts for working with Docker (In fact, I have a BASH CLI template in this repo, and take a look at [../node-cli-ts-tests](../node-cli-ts-tests/) while you're at it!). However once something gets more complex than a few lines, I prefer to use a different language.

## Wouldn't Rust/Go/{insert language} be better/faster for a CLI?

Probably. But I'm most comfortable with JavaScript. So if I want to make a CLI to optimize part of my job or day-to-day life, then JS is the go to. If you prefer another language, or need to build something that is super performant, this likely isn't the template for you.

Another downside of using a JS template is that it requires the user to have a compatible Node version installed. I mostly made this template for myself, and I have Node installed. Node 23 does have some functionality to [export executable files](https://nodejs.org/api/single-executable-applications.html) which would not require the end user to have Node installed, but I haven't had time to look into this yet.

## Why doesn't this template have X?

This template is meant to be small and easy to understand. If the template doesn't contain functionality that developers need, then developers will have to spend time adding that functionality. However if the template is too complex and difficult to understand then it will not meet the goal of allowing developers to quickly and easily build new tools. Therefore it is a balance between out-of-the-box features and simplicity.

If you have a use case in mind that you think is wide-spread, then feel free to create a GitHub issue. But keep in mind that one goal is to keep this template simple so it will have to be a wide-spread issue that I agree with.

If you have a less wide-spread use case, the nice thing about this template is that it is simple straight-forward JS. So you can add that functionality for yourself without having to read through a ton of useless code! You could even clone this template and create your own more complex template based on it!

## Why doesn't this template use X design pattern?

See above.
