export function randomInRange(lowInclusive: number, highInclusive: number): number {
    const range = highInclusive - lowInclusive + 1;
    return Math.floor(Math.random() * range) + lowInclusive;
}
  
export function randomFromArray<t>(arr: t[]): t {
    const randomIndex = randomInRange(0, arr.length - 1);
    return arr[randomIndex];
}