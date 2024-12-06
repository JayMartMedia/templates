import prompts from "prompts";

export async function promptString(prompt: string) {
    const { value } = await prompts({
        type: 'text',
        name: 'value',
        message: prompt,
    });
    return value;
}

export async function promptHiddenString(prompt: string) {
    const { value } = await prompts({
        type: 'text',
        name: 'value',
        message: prompt,
    });
    return value;
}