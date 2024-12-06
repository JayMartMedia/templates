import { log } from "./utils/logs";

export function sayHello (name: string) {
    log.info(`Hello, ${name}`);
}
