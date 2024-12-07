#!/usr/bin/env node
import yargs from 'yargs';
import { hideBin } from 'yargs/helpers';
import { sayHello } from './logicHere';
import { promptString } from './utils/string-prompt';

(async () => {
    /**
     * Extracts the parameters from CLI
     * When running via NPM the structure should be like
     * `npm run start -- --name=world`
     * https://yargs.js.org/docs/
     * https://www.npmjs.com/package/yargs
     */
    const args = await yargs(hideBin(process.argv)).options({
        name: { type: 'string', describe: "The name to greet" }
    }).parse();

    let name: string = args.name ?? await promptString("No name specified in CLI argument. Enter a name");
    
    sayHello(name);
})();
