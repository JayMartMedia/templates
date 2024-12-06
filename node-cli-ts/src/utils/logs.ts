const ERROR_COLOR = "\u001b[31m";
const SUCCESS_COLOR = "\u001b[32m";
const CLEAR_COLOR = "\u001b[0m";

export const log = {
    error: function (message: string, error?: any) {
        if(error) {
            console.error(ERROR_COLOR + message + CLEAR_COLOR, error);
        } else {
            console.error(ERROR_COLOR + message + CLEAR_COLOR);
        }
    },
    success: function (message: string) {
        console.log(SUCCESS_COLOR + message + CLEAR_COLOR);
    },
    info: function (message: string) {
        console.log(message);
    },
};
